#!/bin/bash

# Update the deployment image
kubectl set image deployment/cw2app cw2app=ryanfinnie/cw2-app:latest --kubeconfig=/home/ubuntu/.kube/config

# Check if successful
kubectl rollout restart deployment cw2app
