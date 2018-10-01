FROM ruby:alpine
ENV PGHOST=pghost PGUSER=postgres PGPASSWORD=postgres AGE=7200
RUN apk add --no-cache postgresql-client
WORKDIR /usr/src/app
COPY cleandb.rb .
CMD ["./cleandb.rb"]
