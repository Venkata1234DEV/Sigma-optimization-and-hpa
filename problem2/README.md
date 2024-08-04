


# HorizontalPodAutoscaler (HPA) Implementation Guide

## What is HorizontalPodAutoscaler (HPA)?
HPA is a feature in Kubernetes that automatically adjusts the number of pods in a deployment based on the current load. This helps ensure your application can handle varying levels of traffic without manual intervention.

## Step-by-Step Implementation

### 1. Set Up the Namespace
Namespaces in Kubernetes are used to organize and manage resources. We’ll create a namespace called `a2odev-company`.
```sh
kubectl create namespace a2odev-company
```

### 2. Deploy the Web Server
We’ll deploy a web server using the Nginx image from Dockerhub. This involves creating a deployment configuration file.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-server
  namespace: a2odev-company
spec:
  replicas: 1
  selector:
    matchLabels:
      app: web-server
  template:
    metadata:
      labels:
        app: web-server
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        resources:
          requests:
            cpu: 100m
            memory: 64Mi
        livenessProbe:
          exec:
            command:
            - nginx
            - -t
          initialDelaySeconds: 60
          periodSeconds: 60
```

This file specifies:
- **Image**: `nginx:latest` from Dockerhub.
- **Resource Requests**: Minimum CPU and memory required.
- **Liveness Probe**: A check to ensure the server is running correctly.

Apply this configuration:
```sh
kubectl apply -f web-server-deployment.yaml
```

### 3. Expose the Web Server
We need to make the web server accessible. This is done by creating a service.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: web-server-service
  namespace: a2odev-company
spec:
  selector:
    app: web-server
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
```

Apply the service configuration:
```sh
kubectl apply -f web-server-service.yaml
```

### 4. Set Up Metrics Server
HPA relies on metrics to make scaling decisions. Ensure the Metrics Server is installed in your MicroK8s cluster.
```sh
microk8s enable metrics-server
```

### 5. Implement the HorizontalPodAutoscaler
Create an HPA resource to automatically scale the web server based on CPU and memory usage.

```yaml
apiVersion: autoscaling/v2beta2
kind: HorizontalPodAutoscaler
metadata:
  name: web-server-hpa
  namespace: a2odev-company
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: web-server
  minReplicas: 1
  maxReplicas: 5
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 32
```

Apply the HPA configuration:
```sh
kubectl apply -f web-server-hpa.yaml
```

### 6. Verify the Setup
Check the status of your HPA to ensure it’s working correctly:
```sh
kubectl get hpa -n a2odev-company
```

## Summary
- **Namespace**: Organizes resources.
- **Deployment**: Defines the web server setup.
- **Service**: Makes the web server accessible.
- **Metrics Server**: Provides metrics for scaling.
- **HPA**: Automatically scales the web server based on load.

This setup ensures our web server can handle varying traffic levels by automatically adjusting the number of running instances. If you have any questions or need further clarification, feel free to ask!
