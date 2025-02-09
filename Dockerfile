FROM ubuntu:20.04 AS dev

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl git unzip xz-utils zip nginx tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata
RUN git clone https://github.com/flutter/flutter.git /opt/flutter
WORKDIR /opt/flutter

RUN git checkout 3.27.4
ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter config --enable-web
RUN flutter precache --web

WORKDIR /app
COPY pubspec.yaml pubspec.lock /app/
RUN flutter pub get

COPY . /app/
RUN flutter build web --release
RUN mv /app/build/web /var/www/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
