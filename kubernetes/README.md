## Run
Use minikube or Docker Desktop kubernetes for local developmene

```
minikube start --extra-config=apiserver.enable-swagger-ui=true
```


Start proxy to access API
```
kubectl proxy --port=6443
```
### First way - might not be able to pull image. Better try second way
In docker-compose.yml location type:
```
kompose up --push-image=false --server http://127.0.0.1:6443
```
### Second way
Best to delete all previous resource before (use kubernetes/delete_all.sh)
``` 
mkdir kubernetes
kompose convert && mv *.yaml kubernetes/
kubectl apply -f kubernetes/
```
In this scenario you might need to change line 
``` image: ctfd``` to ```image: ctfd/ctfd:latest```
in ctfd-deployment.yaml



## Useful commands

Shows events on pods. Useful for troubleshooting ErrPullBackImage etc. Would show events even from pods that no longer exist
```
kubectl get events
```

Show events for specific pod
```
kubectl get event --namespace abc-namespace --field-selector involvedObject.name=my-pod-zl6m6

```
Show running resources. PVC are not shown in 'all'
```
kubectl get all
kubectl get pvc
```

delete_all.sh - Delete all resources
```
kubectl delete --all deployments
kubectl delete --all services
kubectl delete --all pods
kubectl delete --all namespaces
kubectl delete --all pvc
```


## Some additional info

Pushing image to docker hub might not work (especially on OSX devices where kompose have problem accessing osxkeychain).
- https://github.com/kubernetes/kompose/issues/911

Pushing locally might have problem with certificates, so we use --server keyword:
- https://github.com/kubernetes/kompose/issues/1131
