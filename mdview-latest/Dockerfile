FROM vvakame/review:latest
LABEL maintainer="nuits.jp@live.jp"

# build-essentialのインストール
# md2reviewのビルドに利用する
RUN apt update && \
    apt install -y build-essential && \
    apt autoclean && \
    rm -rf /var/lib/apt/lists/*

# ruby-devのインストール
# md2reviewのビルドに利用する
RUN apt-get update && \
    apt-get install -y --no-install-recommends ruby-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN gem install md2review

RUN apt-get update && \
    apt-get install -y --no-install-recommends pdftk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*

ENTRYPOINT ["/bin/sh", "-c"]