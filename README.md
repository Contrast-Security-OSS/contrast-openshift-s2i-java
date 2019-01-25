# Contrast Security Java-s2i Example

This example demonstrates how to install the Contrast agent alongside a Spring Boot application into an s2i build suitable for deployment to Openshift.

# Required Environment Variables

* CONTRAST_API_KEY
* CONTRAST_URL
* CONTRAST_AUTHORIZATION
* CONTRAST_ORGANIZATION_ID

# Usage

`$ s2i build git@github.com:Contrast-Security-OSS/vulnerable-spring-boot-application.git Contrast-Security-OSS/contrast-openshift-s2i-java --runtime-artifact=/opt/app-root/src/target vulnerable-spring-boot-application`