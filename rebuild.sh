#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Usage: ./rebuild.sh all|imagename"
	exit 1
fi

echo "Rebuild images with parameter $1"

if [ "$1" = "php7.4-apache-custom" ] || [ "$1" = "all" ]
then
	echo "Rebuild php7.4-apache-custom"
	docker build --tag=alessandrolanni/php7.4-apache-custom ./php/7.4-apache-custom
	#docker push alessandrolanni/php7.4-apache-custom
fi

