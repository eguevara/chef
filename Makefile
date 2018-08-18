.PHONY: version kitchen rspec converge destroy clean recipe

VERSION := $(shell cat VERSION)


all: rspec kitchen

recipe:
	@echo "Run sample recipe locally"
	@cd cookbooks/digitalocean && chef-client --local-mode --runlist 'recipe[digitalocean]'

rspec:
	@echo "Run unit tests on cookbook_in_context? library"
	@cd cookbooks/digitalocean && chef exec rspec spec/unit/helper_spec.rb -fd --color

kitchen: converge
	@echo "Run kitchen verify on $@"
	@kitchen verify

converge:
	@echo "kitchen converge"
	@kitchen converge

destroy:
	@echo "Delete kitchen instance information"
	@kitchen destroy

version:
	@echo $(VERSION)

clean: destroy
	@echo "Clean up"


