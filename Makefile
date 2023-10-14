buildpdf = docker container create -it --name cv rulyotano/latex-builder:6518038010 './$(templateFileName).tex' && \
						docker cp ./templates/$(templateFileName).tex cv:/var/build/$(templateFileName).tex && \
						docker container start -a cv && \
						docker cp cv:/var/build/$(templateFileName).pdf . && \
						docker container rm cv

compile: 
	$(eval templateFileName := Raul-Otano.en)
	$(buildpdf)

clean:
	docker container rm -f cv

build:
	docker build -t cv --target build .