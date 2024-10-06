FROM ruby:3.2.1

RUN apt update -qq && apt install -y postgresql-client
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    fontconfig
# 日本語フォントインストール
RUN wget https://moji.or.jp/wp-content/ipafont/IPAexfont/IPAexfont00301.zip
RUN unzip IPAexfont00301.zip
RUN mkdir -p /usr/share/fonts/ipa
RUN cp IPAexfont00301/*.ttf /usr/share/fonts/ipa
RUN fc-cache -fv
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
