FROM openjdk:8u131-jre-alpine
LABEL maintainer="dkim010@gmail.com"

ARG YANAGISHIMA_VERSION=20.0
WORKDIR /root/

COPY dist/yanagishima-$YANAGISHIMA_VERSION.zip .
COPY conf/yanagishima.properties .

RUN unzip yanagishima-$YANAGISHIMA_VERSION.zip && \
    rm -f yanagishima-$YANAGISHIMA_VERSION.zip && \
    mv yanagishima-$YANAGISHIMA_VERSION app

RUN mv yanagishima.properties /root/app/conf/

EXPOSE 8080
RUN mkdir -p /root/data

COPY scripts/apply-env.sh app/
COPY scripts/entry.sh app/
CMD cd app && sh apply-env.sh && sh ./entry.sh
