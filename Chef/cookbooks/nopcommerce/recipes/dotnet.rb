#
# Cookbook:: nopcommerce
# Recipe:: dotnet
#
# Copyright:: 2021, The Authors, All Rights Reserved.

microsoft_key_url = node['nopcommerce']['microsoft_key']['url']
microsoft_key_path = node['nopcommerce']['microsoft_key']['download_location']

remote_file microsoft_key_path do
    source microsoft_key_url
    action :create
end

dpkg_package 'microsoft pakcage' do
    source microsoft_key_path
    action :install
 end

apt_update 'update ubuntu packages' do
    ignore_failure true
    action :update
end

dotnet_packages = node['nopcommerce']['dotnet_packages']

package 'dotnet packages' do
    package_name dotnet_packages
    action :install
end
