# syntax = docker/dockerfile:1
ARG RUBY_VERSION=3.1.4
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

WORKDIR /rails

# Install base packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libjemalloc2 libvips sqlite3 && \
    apt-get install --no-install-recommends -y libpq-dev && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Set production environment and paths
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    GEM_HOME="/usr/local/bundle" \
    BUNDLE_WITHOUT="development:test"

# Build stage
FROM base AS build

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Copy Gemfiles and install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --path "${BUNDLE_PATH}" --deployment --without development test && \
    rm -rf "${BUNDLE_PATH}/ruby/*/cache" "${BUNDLE_PATH}/ruby/*/bundler/gems/*/.git" && \
    bundle exec bootsnap precompile --gemfile

# Copy application code
COPY . .

# Precompile bootsnap and assets
RUN bundle exec bootsnap precompile app/ lib/
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Final stage
FROM base

# Copy built artifacts (gems and app)
COPY --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --from=build /rails /rails

# Install Foreman (for running multiple processes)
RUN gem install foreman


# Expose Rails server port
EXPOSE 3000

CMD ["foreman", "start"]
