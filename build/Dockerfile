FROM        openjdk:8-jdk-alpine

LABEL       author="ViViV_" maintainer="sysadmin@whiteshield.ch"

EXPOSE      6567/TCP
EXPOSE      6567/UDP

RUN         apk add --update --no-cache curl ca-certificates openssl git tar bash
RUN         apk add --update --no-cache curl ca-certificates sqlite
RUN         apk add --update --no-cache curl ca-certificates tmux

ENV         MINDUSTRY_USER mindustry
ENV         MINDUSTRY_HOME /var/lib/mindustry

RUN         adduser -D -h $MINDUSTRY_HOME $MINDUSTRY_USER

COPY        Mindustry-server-4.0-alpha-56.jar /usr/local/share/mindustry/server.jar

USER        root

VOLUME      $MINDUSTRY_HOME/.mindustry

WORKDIR     $MINDUSTRY_HOME

COPY        ./.tmux.conf .

COPY        ./console.sh /usr/local/bin/console

COPY        ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["host"]
