FROM ubuntu:20.04 AS builder

RUN apt-get update && apt-get install -y \
    curl git unzip xz-utils zip \
    && rm -rf /var/lib/apt/lists/*

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
RUN flutter clean && flutter build web --release

FROM nginx:stable-alpine

WORKDIR /usr/share/nginx/html
COPY --from=builder /app/build/web . 
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]