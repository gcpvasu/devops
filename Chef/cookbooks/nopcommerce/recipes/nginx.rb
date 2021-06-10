#
# Cookbook:: nopcommerce
# Recipe:: nginx
#
# Copyright:: 2021, The Authors, All Rights Reserved.


nginx_package = node['nopcommerce']['nginx']['package_name']

package 'nginx package' do
    package_name nginx_package
    action :install
end

dest_path = node['nopcommerce']['nginx']['source_path'] 

template dest_path do
    source 'default.erb'
    action :create
end
