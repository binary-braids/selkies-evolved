[![binary-braids](./src/img/binary-braids-logo.png)](https://www.github.com/binary-braids)

# [binary-braids/ansible-selkies](https://github.com/binary-braids/selkies-evolved)

>[!NOTE]
> I am not the original creator of this project. This is simply an alternate docker image which includes some additional packages. Please see the [selkies](https://github.com/selkies-project) GitHub organization for the original project.

Selkies Evolved

![GitHub Actions](https://github.com/binary-braids/selkies-evolved/actions/workflows/main.yml/badge.svg)
[![Trivy](https://img.shields.io/badge/trivy-enabled-brightgreen?style=for-the-badge&logo=trivy)](https://trivy.dev)
[![renovate](https://img.shields.io/badge/renovate-enabled-brightgreen?style=for-the-badge&logo=renovatebot)](https://github.com/renovatebot/renovate)

## Table of Contents

- [Configuration](#configuration)
  - [Environment Variables](#environment-variables)
- [Available Architecture](#available-architecture)
- [Examples](#examples)
  - [Docker Compose](#docker-compose)
  - [Docker CLI](#docker-cli)
- [Support](#support)
  - [Issues](#issues)
  - [Feature Requests](#feature-requests)
  - [Updates](#updates)

## Configuration

### Environment Variables

Please see the [docker-selkies-glx-desktop](https://github.com/selkies-project/docker-selkies-glx-desktop) repository for the available environment variables.

## Available Architecture

| Architecture | Available | Tag |
| :----: | :----: | ---- |
| x86-64 | ✅ | amd64-\<version tag\> |
| arm64 | ✅ | arm64-\<version tag\> |

## Examples

### Docker Compose

```yaml
services:
  semaphore:
    ports:
      - 3000:3000
    image: ghcr.io/binary-braids/ansible-semaphore:latest
    environment:
      SEMAPHORE_DB_DIALECT: bolt
      SEMAPHORE_ADMIN_PASSWORD: changeme
      SEMAPHORE_ADMIN_NAME: admin
      SEMAPHORE_ADMIN_EMAIL: admin@localhost
      SEMAPHORE_ADMIN: admin
```

### Docker CLI

```bash
docker run -p 3000:3000 --name semaphore \
	-e SEMAPHORE_DB_DIALECT=bolt \
	-e SEMAPHORE_ADMIN=admin \
	-e SEMAPHORE_ADMIN_PASSWORD=changeme \
	-e SEMAPHORE_ADMIN_NAME=Admin \
	-e SEMAPHORE_ADMIN_EMAIL=admin@localhost \
	-d ghcr.io/binary-braids/ansible-semaphore:latest
```

## Support
This image is provided as is and is a hobby project. With that being said, please see below on details for support.

### Issues

- Please submit a new [Issue](https://github.com/binary-braids/selkies-evolved/issues/new) if you encounter any bugs or issues

### Feature Requests

- You are welcome to submit a feature request but no timeline or guarantee will be provided regarding implentation thereof

### Updates

- The image will be updated from time to time based on fixes or new features
