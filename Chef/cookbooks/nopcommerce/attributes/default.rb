default['nopcommerce']['microsoft_key']['url'] = 'https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb'
default['nopcommerce']['microsoft_key']['download_location'] = '/tmp/packages-microsoft-prod.deb'

default['nopcommerce']['dotnet_packages'] = %w(apt-transport-https aspnetcore-runtime-3.1)


default['nopcommerce']['nginx']['package_name'] = 'nginx'

default['nopcommerce']['nginx']['source_path'] = '/etc/nginx/sites-available/default'

default['nopcommerce']['nop_com']['home_dir'] = '/var/www/nopCommerce440'
default['nopcommerce']['nop_com']['download_url'] = 'https://github.com/nopSolutions/nopCommerce/releases/download/release-4.40.3/nopCommerce_4.40.3_NoSource_linux_x64.zip'

default['nopcommerce']['nop_com']['download_temp_location'] = '/tmp/nopCommerce_4.40.3_NoSource_linux_x64.zip'

default['nopcommerce']['nop_com']['create_directories'] = %w(bin logs)

default['nopcommerce']['nop_com']['nop_service'] = '/etc/systemd/system/nopCommerce440.service'