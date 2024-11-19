# VHS-Web-Services

This integrates nginx-proxy, nginx-proxy-letsencrypt helper, and the various public VHS web services.

## Configuration

Services are defined in the services directories. A `_template` example service definition is available.

## Custom configurations

Place additional configurations in the `docker-compose` directory and override the default configuration by combining the additional files in the `COMPOSE_FILE` variable in a `.env` file.

Example:

```
COMPOSE_FILE=docker-compose.yml:services/name/service.yml
```

One can generate a fully functional `.env` file with `generate-default-compose-env.sh`.

## Deploy

- Use the `deploy.sh` script
- Call `docker compose up -d`

## Automatic deployments

- Symlink .git/hooks/post-checkout to `deploy.sh` script
