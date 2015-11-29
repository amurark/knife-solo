#
# Cookbook Name:: expertiza
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


#update package database
execute "apt-get update"

#install packages
package "telnet"
package "postfix"
package "curl"
package "git-core"
package "zlib1g-dev"
package "libssl-dev"
package "libreadline-dev"
package "libyaml-dev"
package "libsqlite3-dev"
package "sqlite3"
package "libxml2-dev"
package "libxslt1-dev"
#package "libpq-dev"
package "build-essential"
package "tree"
#package "mysql-client-5.6"
#package "mysql-server-5.6"
#package "libmysqlclient18"
#package "ruby-full"
package "openjdk-6-jre-headless"
package "openjdk-6-source"
package "libmysqlclient-dev"
package "libaspell-dev"
package "libpq-dev"
package "bundler"

#set timezone
bash "set timezone" do
  code <<-EOH
    echo 'US/Eastern-New' > /etc/timezone
    dpkg-reconfigure -f noninteractive tzdata
  EOH
  not_if "date | grep -q 'EDT\|EST'"
end
