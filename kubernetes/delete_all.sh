kubectl delete --all deployments
kubectl delete --all services
kubectl delete --all pods
kubectl delete --all namespaces
kubectl delete --all pvc

# Verfiy with 
# kubectl get all
# and additionally cmd below. PVC are not listed in all
# kubectl get pvc
