#
# Based on the official Ruby image: https://hub.docker.com/_/ruby
#
# To build:
#     $ docker build . --tag jeantessier/code-coverage-summary-action:1.0.0 --tag jeantessier/code-coverage-summary-action:latest
#
# To upload to hub.docker.com:
#     $ docker push jeantessier/code-coverage-summary-action:1.0.0
#     $ docker push jeantessier/code-coverage-summary-action:latest
#

FROM ruby:latest

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# GitHub Actions resets WORKDIR to /github/workspace, so we have to reference
# the install path directl.
CMD ["/usr/src/app/entrypoint.rb"]
