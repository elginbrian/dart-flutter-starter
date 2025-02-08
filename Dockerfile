FROM ubuntu:20.04 as builder

RUN apt-get update \
  && apt-get install -y \
  curl \
  git \
  unzip \
  xz-utils \
  zip \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/flutter/flutter.git /opt/flutter

RUN cd /opt/flutter && git checkout stable

ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"

WORKDIR /app
COPY . .

RUN flutter pub get && flutter build web

FROM nginx:stable-alpine
WORKDIR /usr/share/nginx/html
COPY --from=builder /app/build/web .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]