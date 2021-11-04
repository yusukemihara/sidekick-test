FROM ruby:3.0.2-buster
# ベースにするイメージを指定

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim curl && curl -o /tmp/key -sS https://dl.yarnpkg.com/debian/pubkey.gpg && apt-key add /tmp/key && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && apt-get update && apt-get install yarn
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /opt/app
# コンテナ内にmyappディレクトリを作成

WORKDIR /opt/app
# 作成したmyappディレクトリを作業用ディレクトリとして設定

COPY Gemfile /opt/app/Gemfile
COPY Gemfile.lock /opt/app/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のmyapp配下にコピー

RUN bundle install && rails webpacker:install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /opt/app
# ローカルのmyapp配下のファイルをコンテナ内のmyapp配下にコピー
