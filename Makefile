PORT := 8080

run:
	docker build . -t nextjs-with-cloudrun:latest &&\
	docker run --env PORT=$(PORT) -p $(PORT):$(PORT) --rm -it --name nextjs-with-cloudrun-container nextjs-with-cloudrun
