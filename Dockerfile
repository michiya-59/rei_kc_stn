FROM ruby:3.2.1

RUN apt update -qq && apt install -y postgresql-client
RUN mkdir /rei_kc_stn
WORKDIR /rei_kc_stn
COPY Gemfile /rei_kc_stn/Gemfile
COPY Gemfile.lock /rei_kc_stn/Gemfile.lock
RUN bundle install
RUN gem install foreman
COPY . /rei_kc_stn
ENV TZ Asia/Tokyo

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

