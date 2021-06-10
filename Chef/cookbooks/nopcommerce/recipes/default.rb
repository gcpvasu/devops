#
# Cookbook:: nopcommerce
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if node['platform'] == 'ubuntu'
    include_recipe 'nopcommerce::dotnet'
    include_recipe 'nopcommerce::nginx'
    include_recipe 'nopcommerce::nopcom'
end