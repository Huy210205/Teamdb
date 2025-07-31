# 🚀 Automated Deployment Setup

## 📋 Prerequisites

Để setup deployment tự động, bạn cần cấu hình các secrets sau trong GitHub repository:

### 🔐 GitHub Secrets Required

1. **DOCKER_USERNAME**: Tên user Docker Hub
2. **DOCKER_PASSWORD**: Password Docker Hub
3. **SSH_PRIVATE_KEY**: Private key để SSH vào server
4. **SERVER_USER**: Username để SSH vào server
5. **SERVER_HOST**: IP hoặc domain của server

### 🛠️ Setup Instructions

#### 1. Generate SSH Key Pair
```bash
ssh-keygen -t rsa -b 4096 -C "github-actions"
```

#### 2. Add Public Key to Server
```bash
# Copy public key to server
ssh-copy-id -i ~/.ssh/id_rsa.pub user@your-server-ip
```

#### 3. Configure GitHub Secrets
Vào GitHub repository → Settings → Secrets and variables → Actions → New repository secret

Thêm các secrets:
- `DOCKER_USERNAME`: huy210205
- `DOCKER_PASSWORD`: [your-docker-hub-password]
- `SSH_PRIVATE_KEY`: [content of ~/.ssh/id_rsa]
- `SERVER_USER`: [your-server-username]
- `SERVER_HOST`: [your-server-ip-or-domain]

## 🔄 Workflow Process

1. **Push code** → GitHub Actions trigger
2. **Run tests** → Unit tests for blog.jsp and controllers
3. **Build & Push** → Create Docker image and push to Docker Hub
4. **Auto Deploy** → SSH to server, pull new image, restart container

## 🧪 Unit Tests Added

- `BlogControllerTest.java`: Test blog endpoints
- `BlogJspTest.java`: Test blog.jsp content and structure

## ✅ Benefits

- ✅ No manual intervention required
- ✅ Automatic testing before deployment
- ✅ Zero-downtime deployment
- ✅ Rollback capability (previous image remains)
- ✅ Comprehensive logging and monitoring

## 🐛 Troubleshooting

### SSH Connection Issues
```bash
# Test SSH connection
ssh -i ~/.ssh/id_rsa user@server-ip
```

### Docker Permission Issues
```bash
# Add user to docker group
sudo usermod -aG docker $USER
```

### Container Health Check
```bash
# Check container status
docker ps
docker logs homiehotel-app
``` 