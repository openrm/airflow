#!make

.PHONY: build

version := 1.10.14-java8

build:
	docker build . \
        --build-arg AIRFLOW_VERSION=${version} \
        --build-arg PYTHON_BASE_IMAGE="python:3.7-slim-buster" \
        --build-arg PYTHON_MAJOR_MINOR_VERSION=3.7 \
        --build-arg AIRFLOW_EXTRAS="aws,gcp,kubernetes,postgres,redis,slack,ssh,statsd,virtualenv,sentry,sendgrid" \
        --build-arg ADDITIONAL_RUNTIME_APT_COMMAND="echo \"deb http://deb.debian.org/debian/ sid main\" >> /etc/apt/sources.list" \
        --build-arg ADDITIONAL_RUNTIME_APT_DEPS="git openjdk-8-jre-headless" \
        --build-arg INSTALL_MYSQL_CLIENT="false" \
        --tag openrm/airflow:${version}
