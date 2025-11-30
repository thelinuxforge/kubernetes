#!/bin/bash

sed -i -e s/USER/linux/g nginx-secrets.yaml
sed -i -e s/PASSWD/password/g nginx-secrets.yaml

kubectl apply -f nginx-secrets.yaml
