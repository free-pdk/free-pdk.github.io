# Free PDK Online Documentation

This repository holds the source of the documentation available at https://free-pdk.github.io/.

## Local Setup

This site uses [Jekyll](https://jekyllrb.com/).
Jekyll is a static site generator that takes markdown files and transforms them to HTML.

To run Jekyll locally, install `ruby` `>=2.5.0` and the `bundler` gem (`gem install bundler`).
Then install dependencies by running `bundle install` and build the site by calling `bundle exec jekyll serve --livereload`.

## Deployment

Every commit on the `production` branch is built and deployed by a [GitHub Action](https://github.com/free-pdk/free-pdk.github.io/actions) and the result is force-pushed to the `master` branch, which is deployed to https://free-pdk.github.io by GitHub Pages.

The `production` branch is also automatically deployed by [netlify](https://www.netlify.com/) to https://free-pdk-preview.netlify.app/.
Logs can be viewed by clicking on this badge: [![Netlify Status](https://api.netlify.com/api/v1/badges/d2729f79-e836-460b-a65f-7199eb8f3b97/deploy-status)](https://app.netlify.com/sites/free-pdk-preview/deploys)

All pull requests are also built and deployed by netlify so that you can easily review pull requests without having to check them out locally.

There is one difference between the versions deployed to netlify and the version deployed to GitHub Pages: All URLs on netlify are automatically transformed to lower case, whereas URLs on GitHub Pages are case sensitive. For example, the URL `/chips/PFS173` works as expected on GitHub Pages and redirects to `/chips/pfs173` on netlify, whereas the URL `/chips/pfs173` works on netlify but returns 404 on GitHub Pages.