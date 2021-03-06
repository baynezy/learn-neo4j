FROM alpine:3.8 as downloader

RUN apk add --no-cache curl &&\
	mkdir downloads &&\
	curl -SL https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/3.4.0.3/apoc-3.4.0.3-all.jar --output downloads/apoc-3.4.0.3-all.jar &&\
	curl -SL https://github.com/neo4j-contrib/spatial/releases/download/0.25-neo4j-3.4.5/neo4j-spatial-0.25.6-neo4j-3.4.5-server-plugin.jar --output downloads/neo4j-spatial-0.25.6-neo4j-3.4.5-server-plugin.jar

FROM neo4j:3.4
LABEL MAINTAINER="Simon Baynes"

COPY --from=downloader /downloads/apoc-3.4.0.3-all.jar plugins/apoc-3.4.0.3-all.jar
COPY --from=downloader /downloads/neo4j-spatial-0.25.6-neo4j-3.4.5-server-plugin.jar plugins/neo4j-spatial-0.25.6-neo4j-3.4.5-server-plugin.jar
RUN echo "dbms.security.procedures.unrestricted=apoc.*" >> conf/neo4j.conf &&\
	echo "apoc.import.file.enabled=true" >> conf/neo4j.conf &&\
	echo "apoc.spatial.geocode.provider=osm" >> conf/neo4j.conf &&\
	echo "apoc.spatial.geocode.osm.throttle=5000" >> conf/neo4j.conf
CMD ["neo4j"]