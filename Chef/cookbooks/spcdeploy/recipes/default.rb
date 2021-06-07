#
# Cookbook:: spcdeploy
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if node['platform'] == 'ubuntu'
    include_recipe 'spcdeploy::deploy'
end