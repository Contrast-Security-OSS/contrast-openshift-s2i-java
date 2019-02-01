# Contrast Security Java-s2i Example

This example demonstrates how to install the Contrast agent alongside a Spring Boot application into an s2i build suitable for deployment to Openshift.

In this example, we'll inject [Contrast's example Spring Boot application](https://github.com/Contrast-Security-OSS/vulnerable-spring-boot-application) into a Docker container using Openshift's Source To Image. 

Read more about Source to Image [here](https://github.com/openshift/source-to-image)

# Required Environment Variables

* CONTRAST_API_KEY
* CONTRAST_URL
* CONTRAST_AUTHORIZATION
* CONTRAST_ORGANIZATION_ID

All of these can be found by logging in to Contrast and going to "Your Account"

# Usage

`$ s2i build git@github.com:Contrast-Security-OSS/vulnerable-spring-boot-application.git Contrast-Security-OSS/contrast-openshift-s2i-java --runtime-artifact=/opt/app-root/src/target vulnerable-spring-boot-application`

`$ docker run -e CONTRAST_URL -e CONTRAST_ORGANIZATION_ID -e CONTRAST_API_KEY -e CONTRAST_AUTHORIZATION  -p 8080:8080 vulnerable-spring-boot-application`

# Development

* (Make changes)
* `docker build .`
* `docker push contrast/contrast-openshift-s2i-java:latest`