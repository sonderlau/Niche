import { readFileSync, mkdirSync, writeFileSync } from "node:fs";
import { dirname } from "node:path";

const SRC = process.argv[2];
const OUT = process.argv[3];
if (!SRC || !OUT) {
  console.error("Usage: node parse-cv.mjs <input.typ> <output.json>");
  process.exit(1);
}

function matchParens(content, prefix) {
  const pos = content.indexOf(prefix);
  if (pos === -1) return null;
  let depth = 0;
  for (let i = pos + prefix.length; i < content.length; i++) {
    if (content[i] === "(") depth++;
    else if (content[i] === ")") {
      if (depth === 0) return { inner: content.slice(pos + prefix.length, i), end: i + 1 };
      depth--;
    }
  }
  return null;
}

function extractStr(content, key) {
  const idx = content.indexOf(key);
  if (idx === -1) return "";
  const start = content.indexOf('"', idx + key.length);
  if (start === -1) return "";
  let i = start + 1;
  while (i < content.length) {
    if (content[i] === "\\") { i += 2; continue; }
    if (content[i] === '"') return content.slice(start + 1, i);
    i++;
  }
  return "";
}

const raw = readFileSync(SRC, "utf-8");
const content = raw.replace(/^\s*\/\/.*$/gm, "");

const cv = { name: "", goal: "", pic: "", info: [], sections: [] };

const initM = matchParens(content, "#init(");
if (initM) {
  cv.name = extractStr(initM.inner, "name:");
  cv.goal = extractStr(initM.inner, "goal:");
  cv.pic = extractStr(initM.inner, "pic_path:");
}

const infoM = matchParens(content, "#info(");
if (infoM) {
  const tupleRe = /\(\s*icon:\s*(?:(\w+)|"((?:[^"\\]|\\.)*)"),\s*(?:link:\s*"((?:[^"\\]|\\.)*)",\s*)?content:\s*"((?:[^"\\]|\\.)*)"\s*,?\s*\)/g;
  let m;
  while ((m = tupleRe.exec(infoM.inner)) !== null) {
    const icon = m[1] !== undefined ? m[1] : m[2];
    const link = m[3] || "";
    const content = m[4];
    cv.info.push({ icon, link, content });
  }
}

const sectionRe = /#resume_section\(("(?:[^"\\]|\\.)*"|\[(?:[^\]\\]|\\.)*\])\)/g;
const positions = [];
let sm;
while ((sm = sectionRe.exec(content)) !== null) {
  let title = sm[1];
  if (title.startsWith('"')) title = title.slice(1, -1).replace(/\\"/g, '"');
  else if (title.startsWith("[")) title = title.slice(1, -1).replace(/\\\]/g, "]");
  positions.push({ idx: sm.index, end: sm.index + sm[0].length, title });
}

for (let i = 0; i < positions.length; i++) {
  const pos = positions[i];
  const nextEnd = i + 1 < positions.length ? positions[i + 1].idx : content.length;
  const body = content.slice(pos.end, nextEnd);

  const section = { title: pos.title, type: "items", items: [], bullets: [], text: [] };

  if (body.includes("#resume_item(")) {
    section.type = "items";
    const itemParts = body.split(/#resume_item\(/).filter((p) => p.trim());
    for (const part of itemParts) {
      const args = matchParens(part, "");
      if (!args) continue;
      const strs = parseArgStrings(args.inner);
      if (strs.length < 4) continue;
      const item = { title: strs[0], role: strs[1], detail: strs[2], date: strs[3], descs: [] };

      const afterItem = part.slice(args.end);
      const descRe = /#resume_desc\(/g;
      let dm;
      while ((dm = descRe.exec(afterItem)) !== null) {
        const dargs = matchParens(afterItem.slice(dm.index), "#resume_desc(");
        if (!dargs) continue;
        const dstrs = parseArgStrings(dargs.inner, true);
        if (dstrs.length >= 2) {
          item.descs.push({ label: dstrs[0], text: dstrs[1] });
        }
      }
      section.items.push(item);
    }
  } else if (/^\s*- /m.test(body.trim())) {
    section.type = "bullets";
    const bulletRe = /^-\s+(.+)$/gm;
    let bm;
    while ((bm = bulletRe.exec(body)) !== null) {
      section.bullets.push(bm[1].trim());
    }
  } else {
    section.type = "text";
    const text = body.trim();
    if (text.length > 0) section.text.push(text);
  }

  cv.sections.push(section);
}

mkdirSync(dirname(OUT), { recursive: true });
writeFileSync(OUT, JSON.stringify(cv, null, 2));
console.log(`Parsed ${SRC} -> ${OUT}: ${cv.sections.length} sections`);

function parseArgStrings(inner, allowBracket) {
  const result = [];
  let i = 0;
  const len = inner.length;
  while (i < len) {
    while (i < len && (inner[i] === " " || inner[i] === "\n" || inner[i] === "\t" || inner[i] === ",")) i++;
    if (i >= len) break;

    if (inner[i] === '"') {
      i++;
      let s = "";
      while (i < len) {
        if (inner[i] === "\\") { s += inner[i + 1] || ""; i += 2; continue; }
        if (inner[i] === '"') { i++; break; }
        s += inner[i];
        i++;
      }
      result.push(s);
    } else if (allowBracket && inner[i] === "[") {
      let depth = 0;
      let s = "";
      i++;
      while (i < len) {
        if (inner[i] === "\\") { s += inner[i + 1] || ""; i += 2; continue; }
        if (inner[i] === "[" && depth === 0) depth++;
        else if (inner[i] === "]") {
          if (depth === 0) { i++; break; }
          depth--;
        }
        s += inner[i];
        i++;
      }
      result.push(s);
    } else {
      i++;
    }
  }
  return result;
}
