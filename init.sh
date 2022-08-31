#!/bin/bash

docker build -t project-java_app .
docker build -t docs -f DockerfileDocs .
docker-copmose up 