#!/usr/bin/env bash

sed -e 's/localhost:5984/'"$CDB_AUTH"'couchdb:5984/' -i /opt/dist/couchdb-lucene-$CDB_LUCENE_VER/conf/couchdb-lucene.ini

/opt/dist/couchdb-lucene-$CDB_LUCENE_VER/bin/run