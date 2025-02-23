#!/bin/sh

echo " -------------"
echo "| GCLOUD INFO |"
echo " -------------"
gcloud info

echo " ------------------------ "
echo "| KUBECTL CLIENT VERSION |"
echo " ------------------------ "
kubectl version --client
echo ""

echo " --------------------- "
echo "| HELM CLIENT VERSION |"
echo " --------------------- "
helm version --client
echo ""

echo " ---------------- "
echo "| HELM REPO LIST |"
echo " ---------------- "
helm repo list
echo ""

echo " ------------------------- "
echo "| CLOUD_SQL_PROXY VERSION |"
echo " ------------------------- "
cloud_sql_proxy -version
echo ""

echo " ====================== "
echo " "
echo "To run a custom script, just mount it '--volume /your/script.sh:/data/commands.sh:ro'"
