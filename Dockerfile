FROM jenkins/agent:latest-alpine

WORKDIR /usr/src

USER 0

RUN apk add --no-cache curl tar xz && \
  curl -s -o zig.tar.xz https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz && \
  mkdir -p /usr/local/bin/zig && \
  tar -Jvxf /usr/src/zig.tar.xz -C /usr/local/bin/zig --strip-components=1 && \
  rm -vf /usr/src/zig.tar.xz

USER 1000

ENV PATH "/usr/local/bin/zig:${PATH}"
