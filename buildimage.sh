#!/bin/bash

echo "Construction de l'image Docker, tag=$1"
if [ $# -eq 0 ]
  then
    tag='latest'
  else
    tag=$1
fi

docker build -t boucle:$tag .
