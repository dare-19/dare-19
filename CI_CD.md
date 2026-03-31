# 🔄 CI/CD Pipeline Documentation

## Overview

This repository uses automated CI/CD pipelines for continuous integration, testing, and deployment. All workflows are defined in `.github/workflows/`.

## Available Workflows

### 1. Update README (`update-readme.yml`)

**Trigger**: 
- On push to main branch
- Every 6 hours (scheduled)
- Manual dispatch

**Purpose**: Keeps the README.md file updated with latest metrics and timestamps.

**Steps**:
1. Checkout repository
2. Set up Python environment
3. Update README metrics
4. Commit and push changes

```bash
# Manual trigger
gh workflow run update-readme.yml
```

## Pipeline Architecture

```
Code Push / Schedule
    ↓
Validation Stage
├─ Lint & Format
├─ Unit Tests
└─ Type Checking
    ↓
Build Stage
├─ Build Docker Image
├─ Push to Registry
└─ Run Integration Tests
    ↓
Deploy Stage
├─ Deploy to Staging
├─ Run E2E Tests
└─ Create GitHub Release
    ↓
Approval Gate
    ↓
Production Deploy
├─ Canary Deployment
├─ Monitor Metrics
└─ Full Rollout / Rollback
```

## Best Practices

### Commits
- Use conventional commit messages: `feat:`, `fix:`, `chore:`, `docs:`
- Include issue references: `fixes #123`
- Keep commits atomic and focused

### Pull Requests
- One feature per PR
- Write descriptive PR description
- Request reviews before merge
- All checks must pass before merging

### Versioning
- Follow Semantic Versioning (MAJOR.MINOR.PATCH)
- Version bumped automatically based on commit types
- Tags created on releases

## Environment Variables

```yaml
# .github/secrets (Configure in GitHub Settings)
DOCKER_REGISTRY_URL: your-registry.azurecr.io
DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}
DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
KUBE_CONFIG: ${{ secrets.KUBE_CONFIG }}
AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

## Monitoring Pipeline Performance

View workflow runs:
```bash
gh run list --workflow=update-readme.yml
```

View specific run details:
```bash
gh run view <run-id>
```

View job logs:
```bash
gh run view <run-id> --log
```

## Troubleshooting

### Workflow Fails
1. Check run logs: `gh run view <run-id> --log`
2. Verify secrets are configured
3. Check branch protection rules
4. Review recent commits

### Deployment Issues
1. Check pod logs: `kubectl logs -f deployment/app`
2. View service status: `kubectl get svc`
3. Check resource limits: `kubectl top pods`

## Local Development

### Running Tests Locally
```bash
# Install dependencies
pip install -r requirements.txt

# Run tests
pytest tests/

# Run with coverage
pytest --cov=src tests/
```

### Running Linters
```bash
# Python linting
flake8 src/
black --check src/

# YAML validation
yamllint .github/workflows/

# Docker image build test
docker build -t test:latest .
```

## Future Enhancements

- [ ] Add Terraform plan approval workflow
- [ ] Implement cost estimation in PR comments
- [ ] Add security scanning (Trivy, Snyk)
- [ ] Implement SBOM generation
- [ ] Add automated changelog generation
- [ ] Implement GitOps with ArgoCD integration

---

**Last Updated**: 2024-03-31
**Documentation Version**: 1.0
