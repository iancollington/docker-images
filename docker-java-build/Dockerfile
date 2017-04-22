FROM java:8

RUN apt-get update \
 && apt-get install -y curl \
 && apt-get install -y npm \
 && apt-get install -y git

RUN ln -s /usr/bin/nodejs /usr/bin/node

# Install Maven
ENV MAVEN_VERSION 3.3.9
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

# Create a nonroot user, and switch to it
RUN /usr/sbin/useradd --create-home --home-dir /usr/local/nonroot --shell /bin/bash nonroot
RUN /usr/sbin/adduser nonroot sudo
RUN chown -R nonroot /usr/local/
RUN chown -R nonroot /usr/lib/
RUN chown -R nonroot /usr/share/
RUN chown -R nonroot /usr/bin/
RUN chown -R nonroot /src

USER nonroot

CMD ["bash"]
