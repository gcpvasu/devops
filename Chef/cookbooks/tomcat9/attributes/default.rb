#Install open-jdk  java package

default['tomcat9']['java_package'] = 'openjdk-8-jdk'

# Tomcat configuration 

default['tomcat9']['groupname'] = 'tomcat'
default['tomcat9']['username'] = 'tomcat'
default['tomcat9']['home_dir'] = '/opt/tomcat'
default['tomcat9']['default_shell'] = '/bin/false'


# Download Tomcat

default['tomcat9']['download_url'] = 'https://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz'
default['tomcat9']['download_temp_location'] = '/tmp/apache-tomcat-9.0.46.tar.gz'
default['tomcat9']['tomcat_servicefile_location'] = '/etc/systemd/system/tomcat.service'