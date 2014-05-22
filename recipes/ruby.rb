#
# Cookbook Name:: rackbox
# Recipe:: ruby
#
# Install and setup Ruby environment
#

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "rbenv::rbenv_vars"

node["rackbox"]["ruby"]["versions"].each do |rb_version|

  rbenv_ruby rb_version do
    global(node["rackbox"]["ruby"]["global_version"] == rb_version)
  end
  rbenv_gem "bundler" do
    ruby_version rb_version
  end

end

vars_content = node["rackbox"]["rbenv_vars"].map do |key, val|
  "#{key}=#{val}"
end.join("\n")

file "#{node[:rbenv][:root]}/vars" do
  owner "rbenv"
  group "rbenv"
  mode "0744"
  action :create
  content vars_content
end
