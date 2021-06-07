#
# Cookbook:: .
# Recipe:: deploy
#
# Copyright:: 2021, The Authors, All Rights Reserved.

#sudo apt update

apt_update 'update packages' do
    ignore_failure true
    action :update
end

#sudo apt install openjdk-11-jdk -y

apt_package 'java package' do
    package_name 'openjdk-11-jdk'
    action :install
end


#sudo mkdir /usr/share/springpetclinic

directory '/usr/share/springpetclinic' do
    action :create
end

#wget https://referenceapplicationskhaja.s3-us-west-2.amazonaws.com/spring-petclinic-2.4.2.

remote_file '/usr/share/springpetclinic/spring-petclinic-2.4.2.jar' do
    source 'https://referenceapplicationskhaja.s3-us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar'
    action :create
end

#sudo cp spring-petclinic-2.4.2.jar /usr/share/springpetclinic/
#sudo adduser springbootuser

user 'springbootuser' do
    password 'springbootuser'
    action :create
end

#sudo chown springbootuser:springbootuser /usr/share/springpetclinic/spring-petclinic-2.4.2.jar
#sudo chmod 500 /usr/share/springpetclinic/spring-petclinic-2.4.2.jar

file '/usr/share/springpetclinic/spring-petclinic-2.4.2.jar' do
    owner 'springbootuser'
    mode '500'
end



#sudo vi /etc/systemd/system/springpetclinic.service
#sudo systemctl enable springpetclinic.service
#sudo systemctl start springpetclinic.service
#sudo systemctl status springpetclinic.service

cookbook_file '/etc/systemd/system/springpetclinic.service' do
    source 'springpetclinic.service'
    action :create
    notifies :enable, 'service[springpetclinic]'
end

service 'springpetclinic' do
    action :start
end