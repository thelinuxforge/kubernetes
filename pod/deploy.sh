#!bin/bash
sed -i -e s#USER#$(username)#g secrets.yaml
sed -i -e s#PASSWORD#$(password)#g secrets.yaml
kubectl apply -f secrets.yaml
