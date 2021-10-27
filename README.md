# Sample Deployment for Alfresco with Search Enterprise 3 (Elasticsearch)

From ACS 7.1 two Search Engines are available:

* [Search Services 1.x and 2.x](https://docs.alfresco.com/search-services/latest/), that is relaying on a customization of [Apache SOLR 6.6](https://solr.apache.org/guide/6_6/)
* [Search Enterprise 3.x](https://docs.alfresco.com/search-enterprise/latest/), that is a standard client for [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/7.10/index.html)

This project provides a *sample* Docker Compose template for ACS 7.1 with Alfresco Search Enterprise 3.0. Note that deploying the product in *production* environments would require additional configuration.

Docker Images from [quay.io](https://quay.io/organization/alfresco) are used, since this product is only available for Alfresco Enterprise customers. If you are Enterprise Customer or Partner but you are still experimenting problems to download Docker Images, contact [Alfresco Hyland Support](https://community.hyland.com) in order to get required credentials and permissions.

## Docker Compose

Docker Compose template includes following files:

```
.
├── docker-compose.yml
├── indexing
│   └── reindex.prefixes-file.json
└── reindexing
    ├── Dockerfile
    └── wait.sh
```

* `docker-compose.yml` is a regular ACS Docker Compose, including Elasticsearch Connector (indexing and reindexing services) and Elasticsearch server with Kibana
* `indexing/reindex.prefixes-file.json` is a mapping file build with https://github.com/AlfrescoLabs/model-ns-prefix-mapping project. This file is required when indexing an Alfresco Repository including customized models
* `reindexing` folder includes a waiting script for Reindexing application: [wait.sh](reindexing/wait.sh). This will start the [ESC Reindexing Application](https://docs.alfresco.com/search-enterprise/latest/config/#alfresco-re-indexing-app) once Alfresco Repository is ready.

## Using

```
$ docker-compose up --build --force-recreate
```

## Service URLs

http://localhost:8080/workspace

ADW
* user: admin
* password: admin

http://localhost:8080/alfresco

Alfresco Repository
* user: admin
* password: admin

http://localhost:5601

Kibana
No credentials
