#
# Cookbook Name:: rackbox
# Recipe:: nginx
#
# Install Nginx from source to support custom Nginx modules in future.
#

include_recipe "nginx::source"

file "etc/nginx/sites-enabled/000-default" do
  action :delete
end
