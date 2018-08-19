# Versions

```
$ chef --version
Chef Development Kit Version: 3.1.0
chef-client version: 14.2.0
delivery version: master (6862f27aba89109a9630f0b6c6798efec56b4efe)
berks version: 7.0.4
inspec version: 2.1.72

$ kitchen --version
Test Kitchen version 1.23.2
```

# Library

### cookbook_in_context?
Module with one method that can be mixen with any class to run cookbook_in_context?

`chef/cookbooks/digitialocean/libraries/digitalocean_helper.rb/`

# Unit Tests
Rspec units on the library method.

`chef/cookbooks/digitalocean/spec/unit/helper_spec.rb`

#### Usage
```
cd chef/
make rspec
```
or
```
cd cookbooks/digitalocean
chef exec rspec spec/unit/helper_spec.rb -fd --color
```

# Integration Tests
Integration tests using kitchen that validates the recipes on ubuntu-16.04

#### Usage
```
cd chef/
make kitchen
```
or
```
cd chef/
kitchen converge && kitchen verify
```

# Recipe
Simple recipe that demonstrates the usage of the helper library to write to /tmp/INSTALL based on cookbook_in_context?

`chef/cookbooks/digitalocean/recipes/default.rb`


#### Usage
```
cd chef/
make recipe
```
or
```
chef-client --local-mode --runlist 'recipe[digitalocean],recipe[kubernetes]' -l warn
```
