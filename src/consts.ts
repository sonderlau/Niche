// Place any global data in this file.
// You can import this data from anywhere in your site by using the `import` keyword.

export const SITE_TITLE = 'Niche';
export const SITE_DESCRIPTION = 'The academic portfolio of Baitian Liu.';
export const AUTHOR_NAME = 'Baitian Liu';

export const CV_URL = 'https://shravangoswami.com/resume.pdf';

export const CONTACT = {
  organization: 'Baitian Liu',
  addressLines: [
    'Nanjing University',
  ],
  emails: [
    'c29uZGVybGF1QGZveG1haWwuY29t', // base64 of sonderlau@foxmail.com
  ],
};

export type SocialIcon = 'website' | 'scholar' | 'email' | 'github' | 'linkedin' | 'twitter' | 'orcid';

export const SOCIAL_LINKS: ReadonlyArray<{
  label: string;
  href: string;
  icon: SocialIcon;
}> = [
  {
    label: 'GitHub',
    href: 'https://github.com/sonderlau',
    icon: 'github',
  },
  {
    label: 'ORCID',
    href: 'https://orcid.org/0009-0003-5770-4770',
    icon: 'orcid',
  },
  {
    label: 'NJUHML Lab',
    href: 'https://njuhml.github.io/',
    icon: 'website',
  }
];

export const FOOTER_CREDIT = {
  designerName: 'Shravan Goswami',
  sourceLabel: 'Open Source',
  sourceUrl: 'https://github.com/shravanngoswamii/astro-scholar',
};
