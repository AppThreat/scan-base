#!/usr/bin/env bash

docker build -t appthreat/scan-base .
docker build -f Dockerfile-slim -t appthreat/scan-base-slim .
docker build -f Dockerfile-java -t appthreat/scan-base-java .
docker build -f Dockerfile-csharp -t appthreat/scan-base-csharp .
