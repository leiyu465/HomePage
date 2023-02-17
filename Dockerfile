FROM leiyu465/xiaolingxiao-base:latest as builder

RUN ln -sf /bin/bash /bin/sh

ADD . /frontend

RUN cd /frontend && \
    rm -rf ./node_modules && \
    mv /node_modules ./

RUN cd /frontend && \
    npm install && \
    npm run build

FROM registry.sensetime.com/spring-test/spring-infra/nginx:1.17-curl

RUN rm -rf /usr/share/nginx/html

COPY --from=builder /frontend/dist /usr/share/nginx/html
