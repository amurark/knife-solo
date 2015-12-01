# Setting up MYSQL

#
# Cookbook Name:: Expertiza
# Recipe:: default
#
# Copyright 2015, North Carolina State University
#
# All rights reserved - Do Not Redistribute
#
package "debconf-utils"
package "libmysqlclient-dev"
package "mysql-client-5.5"

#execute "export DEBIAN_FRONTEND=noninteractive"

execute 'echo mysql-server-5.5 mysql-server/root_password password #{node["mysql"]["password"]} | debconf-set-selections '
execute 'echo mysql-server-5.5 mysql-server/root_password_again password #{node["mysql"]["password"]} | debconf-set-selections '

ENV['DEBIAN_FRONTEND']='noninteractive'

bash 'env_test0' do
  code <<-EOF
  apt-get -y install mysql-server-5.5 
  echo $DEBIAN_FRONTEND  
EOF
end

#> /home/abzter/env.txt
#> /home/abzter/mysql-server_install.txt

=begin
execute "apt-get -y install mysql-server-5.5" do
	environment 	{ "DEBIAN_FRONTEND" = "noninteractive" }
end


execute "export DEBIAN_FRONTEND=noninteractive"
package "mysql-server-5.5"


execute "sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password your_password'"
execute "echo mysql-server-5.5 mysql-server/root_password_again password #{node['mysql']['password'] | debconf-set-selections "
execute "apt-get -y install mysql-server"


execute "service mysql enable"
execute "service mysql start"
=end
