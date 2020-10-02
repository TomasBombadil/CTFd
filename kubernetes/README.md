# Run
Use minikube or Docker Desktop kubernetes for local developmene

```
minikube start --extra-config=apiserver.enable-swagger-ui=true
```


Start proxy to access API
```
kubectl proxy --port=6443
```

In docker-compose.yml location type:
```
kompose up --push-image=false --server http://127.0.0.1:6443
```


Pushing image to docker hub might not work (especially on OSX devices where kompose have problem accessing osxkeychain).
- https://github.com/kubernetes/kompose/issues/911

Pushing locally might have problem with certificates, so we use --server keyword:
- https://github.com/kubernetes/kompose/issues/1131
