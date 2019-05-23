export GOOGLE_APPLICATION_CREDENTIALS=/data/Gitlab-kube-81.json
export CLOUDSDK_CORE_PROJECT=gitlab-coderef-ci-01
NAMESPACE=gitlab-runner-ns
# Init
# -----
# gcloud auth application-default login
# gcloud container clusters create gitlab-runner --zone europe-west4 --num-nodes 3
# gcloud config set project gitlab-coderef-ci-01
# kubectl create namespace gitlab-runner-ns

gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS
gcloud container clusters get-credentials gitlab-runner --zone europe-west4
kubectl get namespaces
kubectl config set-context $(kubectl config current-context) --namespace=gitlab-runner-ns

# kubectl create -f config-map.yaml
kubectl get configmaps
kubectl describe configmap gitlab-runner-cm


## API URL
# kubectl cluster-info | grep 'Kubernetes master' | awk '/http/ {print $NF}'
# > https://34.90.61.154

## CA certificate
# kubectl get secrets
# kubectl get secret <secret name> -o jsonpath="{['data']['ca\.crt']}" | base64 -d


## Token
# kubectl create --validate -f deployment.yaml
kubectl -n ${NAMESPACE} describe secret $(kubectl -n ${NAMESPACE} get secret |
  grep gitlab-runner | awk '{print $1}')
