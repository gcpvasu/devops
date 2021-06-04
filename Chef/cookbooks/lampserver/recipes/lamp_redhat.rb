#
# Cookbook:: .
# Recipe:: lamp_redhat
#
# Copyright:: 2021, The Authors, All Rights Reserved.


# sudo dnf update
# could not find a resource

# sudo dnf install  -y

apache_package = 'httpd'

dnf_package 'apache_package' do
    package_name apache_package
    action :install
end


# sudo systemctl enable httpd.services
# sudo systemctl start httpd.services

service apache_package do
    action [ :enable, :start ]
end


# $ sudo dnf install php php-mysqlnd php-mbstring php-opcache php-gd

php_packages = %w(php php-mysqlnd php-mbstring php-opcache php-gd)

package 'phppackages' do
    package_name php_packages
    action :install
end

# echo "<?php phpinfo(); ?>"  |  sudo tee /var/www/html/info.php

file '/var/www/html/info.php' do
    content '<?php phpinfo(); ?>'
    action :create
end

service 'Restart Service' do
    service_name apache_package
    action :restart
end
