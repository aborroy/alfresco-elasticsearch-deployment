ARG REINDEXING_TAG
FROM quay.io/alfresco/alfresco-elasticsearch-reindexing:${REINDEXING_TAG}

COPY wait.sh /
RUN chmod +x /wait.sh

ENTRYPOINT /wait.sh && exec java $JAVA_OPTS -jar app.jar
