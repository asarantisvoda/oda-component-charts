# Helm Chart for CPC

## Introduction

The engine of digital transformation to boost CSP's business innovation, provides an open and agile portfolio, which go beyond connectivity, manage traditional, digital and partner ecosystem product in the single view, also bundle,price, and release any of them in any channels rapidly and flexibly.

This Helm chart to install **CPC** *(Consolidated Product Catalog)* in a Kubernetes cluster.

## Prerequisites

The installation assumes the following:

- Kubernetes cluster 1.16+. A pre-existing Kubernetes cluster with an ingress controller configured.
- Helm 3 is available and configured to use the `kubeconfig`.
- Docker images tag should match with chart version, any non-exists images or not match images may cause application running exceptions.
- Midware like zookeeper, zmq, database like mysql should be prepared before deploying chart to make sure all preconditons are ready to install.
- Persistent storage disk like EBS should be prepared to store applications data.

## Installation

### Add Helm repository


```
helm repo add helmchart https://zhaoyf23.github.io/helm-chart/
```

### Update the local available chart information from the chart repository

```
helm repo update
```

### Install helm chart for CPC

#### using default namespace to install

```
helm install cpc helmchart/cpc
```

#### using specified namespace to install

```
helm install cpc helmchart/cpc -n [namespace]
```

for example,

```
helm install cpc helmchart/cpc
```

## Uninstallation

### Uninstall/delete the CPC release:

#### using default namespace to uninstall

```
helm uninstall cpc
```

#### using specified namespace to uninstall

```
helm uninstall cpc -n [namespace]
```

for example,

```
helm uninstall cpc
```

## 