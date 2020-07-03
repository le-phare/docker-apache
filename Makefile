DOCKER_IMAGE ?= lephare/apache
APACHE_VERSIONS ?= $(patsubst %/,%,$(sort $(dir $(wildcard */Dockerfile))))

.PHONY: $(APACHE_VERSIONS) all
	
all: $(APACHE_VERSIONS)
	
$(APACHE_VERSIONS): 
	docker build -t $(DOCKER_IMAGE):$@ $@

