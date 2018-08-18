# # encoding: utf-8

# Inspec test for recipe digitalocean::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe command ('cat /tmp/INSTALL') do
  its(:stdout) { should cmp /mesos@v1.0.0/ }
end