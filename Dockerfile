FROM neo4j:3.4
LABEL MAINTAINER="Simon Baynes"

RUN echo "dbms.security.procedures.unrestricted=apoc.*" >> conf/neo4j.conf
CMD ["neo4j"]