# Niche

Personal academic blog and portfolio site for Baitian Liu, built with Astro and deployed to [sonderlau.github.io][site].

## What is included

- Blog posts with Markdown/MDX support
- Projects and publications pages
- Tags, archive, RSS, sitemap, and Pagefind search
- Dark/light theme support
- Typst-powered Chinese and English CV pages
- GitHub Pages deployment workflow

## Local development

Install dependencies:

```bash
bun install
```

Start the dev server:

```bash
npm run dev
```

Then open [localhost:4321][local].

## Commands

| Command | Description |
| --- | --- |
| `npm run dev` | Generate CV assets and start the local dev server |
| `npm run build` | Generate CV assets and build the production site |
| `npm run preview` | Preview the production build locally |
| `npm run cv:build` | Compile Typst CV PDFs and generate CV JSON data |
| `npm run astro -- <command>` | Run Astro CLI commands |

## Content locations

| Path | Purpose |
| --- | --- |
| `src/content/blog/` | Blog posts |
| `src/data/projects.json` | Project entries |
| `src/data/publications.bib` | Publication records |
| `src/resume/src/chinese.typ` | Chinese CV source |
| `src/resume/src/english.typ` | English CV source |
| `src/consts.ts` | Site title, author, links, and global constants |
| `src/styles/global.css` | Global theme and typography |

## CV workflow

The CV source of truth is in `src/resume/src/*.typ`.

`npm run dev` and `npm run build` both run `npm run cv:build` first. This compiles PDFs into `public/cv/` and regenerates JSON data in `src/data/cv/`, which the `/cv` and `/cv/en` pages render from.

## Deployment

Pushes to `main` run `.github/workflows/deploy.yml`. The workflow installs dependencies, sets up Typst, builds the Astro site, and publishes `dist/` to [sonderlau.github.io][site].

## Project structure

```text
src/
  components/      Reusable Astro components
  content/blog/    Blog content
  data/            Projects, publications, generated CV data
  layouts/         Page layouts
  pages/           Route files
  resume/          Typst CV source and templates
  styles/          Global styles
  utils/           Shared utilities
public/
  cv/              Generated CV PDFs
  img/             Static images and icons
```

## License

This site is based on [Astro Scholar][astro-scholar] and uses the MIT license.

[astro-scholar]: https://github.com/shravanngoswamii/astro-scholar
[local]: http://localhost:4321
[site]: https://sonderlau.github.io
