# 🛠️ DevOps Tools & Technologies Guide

## Quick Reference

| Category | Tools | Use Case |
|----------|-------|----------|
| **Container** | Docker, Podman | Image building, local development |
| **Orchestration** | Kubernetes, ECS, Docker Swarm | Container management at scale |
| **IaC** | Terraform, CloudFormation, Ansible | Infrastructure automation |
| **CI/CD** | GitHub Actions, Jenkins, GitLab CI | Automation pipelines |
| **Monitoring** | Prometheus, Grafana, Datadog | Observability & alerting |
| **Logging** | ELK Stack, Loki, Splunk | Centralized log management |
| **Secrets** | Vault, AWS Secrets Manager | Credential management |
| **GitOps** | ArgoCD, Flux | Declarative deployments |

## Installation & Setup

### Docker

```bash
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Verify installation
docker --version
docker run hello-world
```

### Kubernetes Tools

```bash
# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install Kind (local Kubernetes)
go install sigs.k8s.io/kind@latest

# Verify
kubectl version --client
helm version
```

### Terraform

```bash
# Install Terraform
wget https://releases.hashicorp.com/terraform/1.7.0/terraform_1.7.0_linux_amd64.zip
unzip terraform_1.7.0_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Verify
terraform version
```

### AWS CLI

```bash
# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Configure credentials
aws configure
```

## Common Workflows

### Docker Development

```bash
# Build image
docker build -t myapp:latest .

# Run locally
docker run -it -p 8080:8080 myapp:latest

# Push to registry
docker tag myapp:latest registry.example.com/myapp:latest
docker push registry.example.com/myapp:latest
```

### Kubernetes Operations

```bash
# Create cluster (local)
kind create cluster --name dev

# Deploy application
kubectl apply -f deployment.yaml

# View resources
kubectl get pods
kubectl get svc
kubectl get nodes

# View logs
kubectl logs -f deployment/myapp

# Scale deployment
kubectl scale deployment myapp --replicas=5

# Update deployment
kubectl set image deployment/myapp myapp=myapp:v2

# Delete resources
kubectl delete -f deployment.yaml
```

### Terraform Workflows

```bash
# Initialize Terraform
terraform init

# Format code
terraform fmt -recursive

# Validate configuration
terraform validate

# Plan changes
terraform plan -out=tfplan

# Apply changes
terraform apply tfplan

# Destroy resources
terraform destroy
```

### Infrastructure Monitoring

```bash
# Port-forward to Prometheus
kubectl port-forward -n monitoring svc/prometheus 9090:9090

# Query metrics
curl http://localhost:9090/api/v1/query?query=up

# Port-forward to Grafana
kubectl port-forward -n monitoring svc/grafana 3000:3000
# Access: http://localhost:3000 (admin/admin)
```

### Log Aggregation (ELK)

```bash
# Port-forward to Kibana
kubectl port-forward -n logging svc/kibana 5601:5601
# Access: http://localhost:5601

# Query logs in Elasticsearch
curl -X GET "localhost:9200/_search?pretty" -H 'Content-Type: application/json'
```

## Performance Tuning

### Kubernetes Optimization

```yaml
# Resource requests and limits
resources:
  requests:
    memory: "256Mi"
    cpu: "250m"
  limits:
    memory: "512Mi"
    cpu: "500m"

# Horizontal Pod Autoscaling
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: myapp-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: myapp
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 80
```

### Database Optimization

```bash
# PostgreSQL connection pooling with PgBouncer
# Add to pgbouncer.ini
[databases]
mydb = host=postgres port=5432 dbname=mydb

# Prometheus query for slow queries
rate(pg_stat_statements_query_time_sum[5m]) > 1000
```

## Security Best Practices

### Container Security

```bash
# Scan image for vulnerabilities
trivy image myapp:latest

# Sign image
cosign sign --key cosign.key registry.example.com/myapp:latest

# Verify signature
cosign verify --key cosign.pub registry.example.com/myapp:latest
```

### Kubernetes Security

```yaml
# Pod Security Policy
apiVersion: policy/v1beta1
kind: PodSecurityPolicy
metadata:
  name: restricted
spec:
  privileged: false
  allowPrivilegeEscalation: false
  requiredDropCapabilities:
    - ALL
  runAsUser:
    rule: MustRunAsNonRoot
  fsGroup:
    rule: MustRunAs
    ranges:
      - min: 1000
        max: 65535
  seLinux:
    rule: MustRunAs
  readOnlyRootFilesystem: true
```

### Secret Management

```bash
# Store secrets in Vault
vault kv put secret/app/db password="mypassword"

# Retrieve secrets
vault kv get secret/app/db

# Dynamic secrets
vault write -f database/rotate-root/postgres
```

## Troubleshooting Commands

```bash
# Kubernetes debugging
kubectl describe pod <pod-name>
kubectl exec -it <pod-name> -- /bin/bash
kubectl events <pod-name>

# Network troubleshooting
kubectl run netshoot --image=nicolaka/netshoot -it -- /bin/bash
nslookup kubernetes.default
traceroute <service-ip>

# Resource usage
kubectl top nodes
kubectl top pods

# Logs
kubectl logs -f <pod-name>
kubectl logs --previous <pod-name>

# Metrics
kubectl get --raw /apis/metrics.k8s.io/v1beta1/pods
```

## Additional Resources

- [Kubernetes Official Docs](https://kubernetes.io/docs/)
- [Terraform Registry](https://registry.terraform.io/)
- [Docker Documentation](https://docs.docker.com/)
- [AWS Documentation](https://docs.aws.amazon.com/)
- [Prometheus Docs](https://prometheus.io/docs/)

---

**Last Updated**: 2024-03-31
**Version**: 1.0
