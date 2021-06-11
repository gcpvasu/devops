#
# Cookbook:: .
# Recipe:: installjava
#
# Copyright:: 2021, The Authors, All Rights Reserved.

apt_update 'update packages' do
    ignore_failure true
    action :update
    only_if { node['platform'] == 'ubuntu'}
end

java_package = node['tomcat9']['java_package']


apt_package 'java package' do
    package_name java_package
    action :install
end

