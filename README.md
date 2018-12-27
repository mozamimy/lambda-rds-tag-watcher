# rds-tag-watcher

## About

An AWS Lambda function that publishes a message to an SNS topic when an RDS instance without specified tags is found.

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
