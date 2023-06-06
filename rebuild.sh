#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Usage: ./rebuild.sh all|imagename"
	exit 1
fi

echo "Rebuild images with parameter $1"

if [ "$1" = "node-gulp" ] || [ "$1" = "all" ]
then
	echo "Rebuild Node with Gulp"
	docker build --tag=alessandrolanni/node-gulp ./node/node-gulp
	docker push alessandrolanni/node-gulp:latest
fi

if [ "$1" = "php7.4-apache-custom" ] || [ "$1" = "all" ]
then
	echo "Rebuild php7.4-apache-custom"
	docker build --tag=alessandrolanni/php7.4-apache-custom ./php/7.4-apache-custom
	docker push alessandrolanni/php7.4-apache-custom
fi

if [ "$1" = "php8.0-apache-custom" ] || [ "$1" = "all" ]
then
        echo "Rebuild php8.0-apache-custom"
        docker build --tag=alessandrolanni/php8.0-apache-custom ./php/8.0-apache-custom
        docker push alessandrolanni/php8.0-apache-custom
fi

if [ "$1" = "php-rabbit-consumer" ] || [ "$1" = "all" ]
then
	echo "Rebuild php-rabbit-consumer"
        docker build --tag=alessandrolanni/php-rabbit-consumer ./php-rabbit-consumer
        docker push alessandrolanni/php-rabbit-consumer
fi

if [ "$1" = "php8.1-apache-custom" ] || [ "$1" = "all" ]
then
        echo "Rebuild php8.1-apache-custom"
        docker buildx build --tag=alessandrolanni/php8.1-apache-custom --push --platform=linux/arm64,linux/amd64 ./php/8.1-apache-custom
fi

if [ "$1" = "php8.1-apache-custom-debug" ] || [ "$1" = "all" ]
then
        echo "Rebuild php8.1-apache-custom-debug"
        docker buildx build --tag=alessandrolanni/php8.1-apache-custom-debug --push --platform=linux/arm64,linux/amd64 ./php/8.1-apache-custom-debug
fi