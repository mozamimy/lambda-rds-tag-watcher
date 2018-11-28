# lambda-rds-tag-watcher

## About

This program publishes a message to an SNS topic when there are no RDS instances without specified tags.

## Run locally with SAM CLI

```sh
make build-docker-image
make build
make zip
make run
```

## Releae build

```sh
make build-docker-image
make build BUILD=release
make zip BUILD=release
```

## License

MIT
