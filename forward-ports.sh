#!/bin/bash

while :
do
ps aux | awk '$0 ~ /port-forward/ { print $2}' | xargs kill -9
kubectl -n prometheus port-forward svc/prometheus-grafana 3000:80 &
kubectl -n prometheus port-forward svc/prometheus-kube-prometheus-prometheus 9090:9090 &
kubectl -n prometheus port-forward svc/prometheus-kube-prometheus-alertmanager 9093:9093 &
sleep 300
kill %1 %2 %3
sleep 1
done
