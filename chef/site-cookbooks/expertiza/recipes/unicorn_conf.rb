execute 'Install unicorn Gem' do
cwd '/home/root/expertiza'
command 'gem install unicorn'
end

# set custom Unicorn config
template "/home/root/expertiza/config/unicorn.rb" do
  source "unicorn.rb.erb"
  mode '0755'
  owner 'root'
  #group 'root'
#  notifies :restart, "service[nginx]", :delayed
end

