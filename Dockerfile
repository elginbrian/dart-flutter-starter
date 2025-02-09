FROM ubuntu:22.04 AS build

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl git unzip xz-utils zip nginx tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

RUN git clone --depth 1 --branch 3.27.4 https://github.com/flutter/flutter.git /opt/flutter
ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter config --enable-web && flutter precache --web

WORKDIR /app
COPY pubspec.yaml pubspec.lock /app/
RUN flutter pub get

COPY . /app/
RUN flutter build web --release

FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]