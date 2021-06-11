#
# Cookbook:: .
# Recipe:: tomcatdeploy
#
# Copyright:: 2021, The Authors, All Rights Reserved.

tomcat_groupname = node['tomcat9']['groupname']

group tomcat_groupname do
    action :create
end

tomcat_username = node['tomcat9']['username']
tomcat_shell = node['tomcat9']['default_shell']
tomcat_homedir = node['tomcat9']['home_dir']

user tomcat_username do    
    gid tomcat_groupname
    home tomcat_homedir
    shell tomcat_shell
    action :create
end

tomcat_download_url = node['tomcat9']['download_url']
tomcat_download_temp_location = node['tomcat9']['download_temp_location']

remote_file tomcat_download_temp_location do
    source tomcat_download_url
    action :create
end


directory tomcat_homedir do
    action :create
end

execute 'untartomcat' do
    command "tar xzvf #{tomcat_download_temp_location} -C #{tomcat_homedir} --strip-components=1"
    action :run
    only_if { not Dir.exist?"#{tomcat_homedir}/conf"}
end

#archive_file 'untarapachetomcat' do
#    owner tomcat_username
#    group tomcat_groupname
#    path tomcat_download_temp_location
#    destination tomcat_homedir
#    action :extract
#end


execute 'change group permissions for tomcat folder' do
    command "chgrp -R #{tomcat_groupname} #{tomcat_homedir}"
    action :run
    subscribes :run, 'execute[untarapachetomcat]', :immediately
end

execute 'give read permissions to the group for conf folder' do
    command "sudo chmod -R g+r #{tomcat_homedir}/conf"
    action :run
    subscribes :run, 'execute[untarapachetomcat]', :immediately
end

execute 'give execute permissions to the group for conf folder' do
    command "sudo chmod -R g+x #{tomcat_homedir}/conf"
    action :run
    subscribes :run, 'execute[untarapachetomcat]', :immediately
end

#sudo chown -R tomcat webapps/ work/ temp/ logs/

execute 'change ownership for tomcat folders' do
    command "sudo chown -R tomcat #{tomcat_homedir}/webapps/ #{tomcat_homedir}/work/ #{tomcat_homedir}/temp/ #{tomcat_homedir}/logs/"
    action :run
    subscribes :run, 'execute[untartomcat]', :immediately
end

service_file = node['tomcat9']['tomcat_servicefile_location']

cookbook_file service_file do
    source 'tomcat.service'
    action :create
    notifies :enable, 'service[tomcat]'
end

service 'tomcat' do
    action :start
end







