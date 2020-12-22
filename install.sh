#!/bin/bash

#Make sure you're connected to your OpenShift cluster with admin user before running this script

echo "Creating Tekton Subscription"
oc apply -f tekton-sub.yaml
echo "Tekton Subscription created!"
