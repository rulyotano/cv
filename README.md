# My CV!

This is a repository I've created to generate my CV's in a more decent way than just using .docs files.

I've used Latex to create it. I've got a template from [Jan Küster](https://github.com/jankapunkt/latexcv) and used the basic one because I was able to use it with a very basic and light Latex distribution.

Also I need to give the credits to [Ale Dominguez](https://github.com/adborroto) who inspired me and also guided me. He wrote [this interesting Medium article](https://medium.com/geekculture/keep-your-cv-updated-like-a-developer-using-github-actions-latex-ab9820484147).

## How this works

1. Create your custom tex document in the `/templates` directory (I recommend using the same to be able to work with the same Latex build)
2. To test it in local, you can use the `Makefile` commands. You also will need to have docker installed. You can change or add new `compile` commands to use your template. Note that you will need to install `make` in your SO. Then you can use `make compile` command to compile. In case you get an error during the compilation and the docker container is still alive, you can execute the `make clean`. Make build (`make build`) is only used to build the image in local, useful if you want to customize it (note: need to change the `buildpdf` variable in order to use `cv` instead of the image from the dr)
3. Behind this, there is a newly created docker image that I'e named `rulyotano/latex-builder`. If the change something in the or the entry point this image is going to be updated. Check the `.docker/entrypoint.sh` file, because in here you will be able to add your custom mappings to private fields. In my case, so far, only email and phone. Note: you don't need to use the image I've created, you can build the image during the pdf creation action, and no need to push it to any docker registry.
4. To create the pdf file, I've created a manually triggered action for that. To run this one you will need to pickup the template you want build (need to add it to the action definition file). Then the image is used to create build the pdf and then it is pushed it to a private github repository, in order to keep our privacy.

