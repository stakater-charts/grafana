# chart-grafana
This repository contains 2 charts that are used to deploy grafana to kubernetes.
- grafana-storage
- grafana

## Installing
First install `grafana-storage` chart
```
helm install --name grafana-storage chartmuseum/grafana-storage
```

After that, install `grafana` chart
```
helm install --name grafana chartmuseum/grafana
```
