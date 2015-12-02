package "nginx"

# remove default nginx config
default_path = "/etc/nginx/sites-enabled/default"
execute "rm -f #{default_path}" do
  only_if { File.exists?(default_path) }
end

# start nginx
service "nginx" do
  supports [:status, :restart]
  action :start
end

# set custom nginx config
template "/etc/nginx/conf.d/default.conf" do
#template "/home/root/expertiza/xyz/defaulttt.conf" do
  source "default.conf.erb"
  mode '0755'
  owner 'root'
  #group 'root'
#  notifies :restart, "service[nginx]", :delayed
end

