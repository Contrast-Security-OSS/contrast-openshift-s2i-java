FROM registry.access.redhat.com/rhel7:latest

EXPOSE 8080

ENV JAVA_VERSON=1.8.0 \
    MAVEN_VERSION=3.3.9 \
    JAVA_HOME=/usr/lib/jvm/java \
    MAVEN_HOME=/usr/share/maven \
    STI_SCRIPTS_PATH=/usr/libexec/s2i

LABEL io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java,java8,maven,maven3,springboot" \
      name="Contrast Security S2i Demo" \
      vendor="Contrast Security" \
      version="1.1" \
      release="2" \
      run='docker run -e CONTRAST_URL -e CONTRAST_ORGANIZATION_ID -e CONTRAST_API_KEY -e CONTRAST_AUTHORIZATION  -p 8080:8080 vulnerable-spring-boot-application' \
      summary="Contrast Security S2i Demo" \
      description="Contrast Security S2i Demo" 

# Copy licenses
run mkdir /licenses
COPY ./licenses /licenses

# Enable default yum repo
RUN yum localinstall -y --nogpgcheck http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm 

RUN yum install -y curl java-$JAVA_VERSON-openjdk-devel && \
    yum clean all

RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# Copy S2i scripts
COPY ./s2i/bin/ $STI_SCRIPTS_PATH
RUN /usr/bin/chmod +x $STI_SCRIPTS_PATH/*
RUN /usr/bin/chown -R 1001:0 $STI_SCRIPTS_PATH/*
USER 1001

CMD $STI_SCRIPTS_PATH/usage