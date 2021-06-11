#
# Cookbook:: tomcat9
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if node['platform'] == 'ubuntu'
    include_recipe 'tomcat9::installjava'
    include_recipe 'tomcat9::tomcatdeploy'
end