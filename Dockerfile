FROM alpine:latest

WORKDIR /home

RUN apk update && apk add \
        curl \
        wget \
        git \
        make \
        nodejs \
        erlang \
        erlang-parsetools \
        erlang-syntax-tools \
        elixir \
        erlang-ssl \
        erlang-crypto \
        && rm -rf /var/cache/apk/*

ENV PHOENIX_VERSION 1.1.4

RUN mix archive.install \
        --force https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHOENIX_VERSION.ez \
        && mix phoenix.new app

WORKDIR /home/app

RUN mix local.hex --force \
        && mix local.rebar \
        && mix deps.get \
        && npm install && npm install --save-dev babel-cli babel-preset-es2015 \
        && echo '{ "presets": ["es2015"] }' > .babelrc

EXPOSE 4000

