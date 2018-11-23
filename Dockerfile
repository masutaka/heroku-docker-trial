FROM ruby:2.5.3-alpine3.8
WORKDIR /app
COPY server.rb /app/
CMD ruby server.rb
