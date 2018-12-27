BUILD := debug
APP_NAME := rds-tag-watcher
JOBS := 4

build-docker-image:
	docker build -t aws-lambda-rust .
build:
	if [ ${BUILD} == "release" ]; then \
		docker-compose run builder /bin/bash -c "cargo build --jobs ${JOBS} --release"; \
	else \
		docker-compose run builder /bin/bash -c "cargo build --jobs ${JOBS}"; \
	fi
check-fmt:
	docker-compose run builder /bin/bash -c "cargo fmt --all -- --check"
zip:
	docker-compose run builder /bin/bash -c "cp /tmp/target/${BUILD}/${APP_NAME} /workspace/package"; \
	cd package && zip ${APP_NAME}.zip ${APP_NAME}
run:
	sam local invoke -e event.example.json -t template.example.json RDSTagWatcher
clean:
	rm -rf target/debug target/release package/${APP_NAME}.zip
