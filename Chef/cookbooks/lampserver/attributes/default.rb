# using attributes is the best way of using packages and variables

if node['platform'] == 'ubuntu'
    default['lampserver']['apache_package'] = 'apache2'
    default['lampserver']['php_packages'] = %w(php libapache2-mod-php php-mysql php-cli)
elsif node['platform'] == 'redhat'
    default['lampserver']['apache_package'] = 'httpd'
    default['lampserver']['php_packages'] = %w(php php-mysqlnd php-mbstring php-opcache php-gd)
end