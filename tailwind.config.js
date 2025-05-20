// tailwind.config.js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./themes/hidamarid/layouts/**/*.html", // Include layouts
    "./themes/hidamarid/assets/**/*.js",
    "./content/**/*.md", // Include content files (if classes are used in Markdown)
    "./assets/**/*.js", // Include JS files if you manipulate classes there
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
