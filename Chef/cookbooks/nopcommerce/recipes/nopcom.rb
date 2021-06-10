#
# Cookbook:: .
# Recipe:: nopcom
#
# Copyright:: 2021, The Authors, All Rights Reserved.

nop_home_dir = node['nopcommerce']['nop_com']['home_dir']
nop_download_url = node['nopcommerce']['nop_com']['download_url']
nop_temp_location = node['nopcommerce']['nop_com']['download_temp_location']

remote_file nop_temp_location do
    source nop_download_url
    action :create
end

archive_file 'unzip_nop' do
    path nop_temp_location
    destination nop_home_dir
    action :extract

end


nop_bin_logs_dir = node['nopcommerce']['nop_com']['create_directories']

nop_bin_logs_dir.each do |dir|
    directory "nop_home_dir/#{dir}" do
      action :create
      recursive true
    end
end

execute 'Change the Group Permissions' do
    command "sudo chgrp -R www-data #{nop_home_dir}"
    action :run
    subscribes :run, 'execute[unzip_nop]', :immediate
end

execute 'Change the Group Permissions' do
    command "sudo chown -R www-data #{nop_home_dir}"
    action :run
    subscribes :run, 'execute[unzip_nop]', :immediate
end

nop_service_file = node['nopcommerce']['nop_com']['nop_service']

cookbook_file nop_service_file do
    source 'nopCommerce440.service'
    action :create
    notifies :enable, 'service[nopCommerce440]'
end

service 'nopCommerce440' do
    action :start
end

nginx_package = node['nopcommerce']['nginx']['package_name']

service 'restart nginx' do
    service_name nginx_package
    action :restart
end

