# set custom nginx config
template "/home/root/expertiza/config/unicorn.rb" do
#template "/home/root/expertiza/xyz/defaulttt.conf" do
  source "unicorn.rb.erb"
  mode '0755'
  owner 'root'
  #group 'root'
#  notifies :restart, "service[nginx]", :delayed
end

