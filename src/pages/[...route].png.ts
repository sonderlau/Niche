import type { APIRoute } from "astro";
import { generateOgImage } from "../utils/generateOgImage";
import { SITE_TITLE, SITE_DESCRIPTION } from "../consts";
import projectsData from "../data/projects.json";

export async function getStaticPaths() {
    // Base static pages
    const staticPages = [
        { params: { route: 'og' }, props: { title: SITE_TITLE, subtitle: SITE_DESCRIPTION } },
        { params: { route: 'about' }, props: { title: 'About', subtitle: SITE_TITLE } },
        { params: { route: 'projects' }, props: { title: 'Projects', subtitle: SITE_TITLE } },
        { params: { route: 'publications' }, props: { title: 'Publications', subtitle: SITE_TITLE } },
    ];

    const projectPages = projectsData.map((project) => ({
        params: { route: `projects/${project.id}` },
        props: { title: project.title, subtitle: 'Research Project' },
    }));

    return [...staticPages, ...projectPages];
}

export const GET: APIRoute = async ({ props }) => {
    const safeTitle = (props.title as string).replace(/&/g, 'and');
    return new Response(await generateOgImage(safeTitle, props.subtitle as string), {
        headers: { "Content-Type": "image/png" },
    });
};
