compile:
	docker container create -it --name cv cv './Raul-Otano.en.tex' && \
	docker cp ./templates/Raul-Otano.en.tex cv:/var/build/Raul-Otano.en.tex && \
	docker container start -a cv && \
	docker cp cv:/var/build/Raul-Otano.en.pdf . && \
	docker container rm cv
build:
	docker build -t cv --target build .