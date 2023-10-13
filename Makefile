compile:
	docker run -it --rm -v .:/var/build cv ./templates/Raul-Otano.en
build:
	docker build -t cv --target build .