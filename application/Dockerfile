# Use java base image
FROM mohitarora/jdk7-base

# Create an application directory
RUN mkdir -p /app

# Add application binary. Adding it here because it is just a sample. In real world scenarios, things will be different
ADD ./dropwizard-sample-1.0-SNAPSHOT.jar /app/dropwizard-sample-1.0-SNAPSHOT.jar

# Add configuration file, In real world, we will use confd for this as well.
ADD ./sample.yml /app/sample.yml