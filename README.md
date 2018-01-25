# Developer Page
My website where I keep favorite/useful links and write about things I discover during development.

The top-level directory of this repo is the web root, as required by GitHub Pages. The development directory is `src`.

# Building
Running `make all` will build all pages. Requires markdown and a small preprocessor I wrote (found in `lib`) for file inclusion and inline code execution.

# Folder Structure

## Top-level Directory (webroot)

### add-bookmark.sh
Appends bookmark name and url to bookmarks page.

### lib
Binaries used for building.

### assets, blog
Assets (images, stylsheets) are served from here, and blog is where blog posts are served from and are linked to on `blog.html`.

I may also keep useful files in the top-level directory for my own use.

## src (development)

### blog
All blog posts.

### includes
Partials to be included throughout site (i.e. head, footer), as well as partials intended for specific pages.

### pages
All pages for this website (excluding blog posts).
