# Docker image for Java Maven which includes node/npm/grunt executions

This image is primarily for personal use in a Concourse CI build pipeline.

Example usage:

```
$ docker run -it --rm -v /my/local/code:/code iancollington/docker-java-build mvn -f /code/pom.xml clean package
```
