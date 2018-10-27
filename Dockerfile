FROM alpine:3.8 as downloader

RUN apk add --no-cache curl &&\
	mkdir downloads &&\
	curl -SL https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/3.4.0.3/apoc-3.4.0.3-all.jar --output downloads/apoc-3.4.0.3-all.jar

FROM neo4j:3.4
LABEL MAINTAINER="Simon Baynes"

COPY --from=downloader /downloads/apoc-3.4.0.3-all.jar plugins/apoc-3.4.0.3-all.jar
RUN echo "dbms.security.procedures.unrestricted=apoc.*" >> conf/neo4j.conf
CMD ["neo4j"]