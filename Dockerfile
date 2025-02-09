FROM ubuntu:20.04 AS dev

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

EXPOSE 8080

CMD ["flutter", "run", "-d", "web-server", "--web-hostname=0.0.0.0", "--web-port=8080"]