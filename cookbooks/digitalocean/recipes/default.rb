#
# Cookbook:: digitalocean
# Recipe:: default
# 
# Only include "kubernetes:v1.0.0" in INSTALL file
# if digitialocean:1.0.0 and kubernetes:3.0.0 are in the context run.
# otherwise write to the INSTALL file "mesos::1.0.0"

Chef::Resource::File.send(:include, Digitalocean::Helper)
file '/tmp/INSTALL' do
  if cookbook_in_context?('digitalocean', '1.0.0') && cookbook_in_context?('kubernetes', '3.0.0')
    content 'kubernetes@v1.0.0'
  else
    content 'mesos@v1.0.0'
  end
end
