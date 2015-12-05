package "nginx"

# remove default nginx config
default_path = "#{node['nginx']['default']}"
execute "rm -f #{default_path}" do
  only_if { File.exists?(default_path) }
end

# start nginx
service "nginx" do
  supports [:status, :restart]
  action :start
end

# set custom nginx config
template "#{node['nginx']['default_conf']}" do
  source "#{node['nginx']['default_file']}"
  mode "#{node['nginx']['mode']}"
  owner 'root'
end

