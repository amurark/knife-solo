#
# Cookbook Name:: Expertiza
# Recipe:: default
#
# Copyright 2015, North Carolina State University
#
# All rights reserved - Do Not Redistribute
#

# install rvm
bash 'install RVM' do
  user node['user']['name']
  cwd "/home/#{node['user']['name']}"
  code <<-EOH
    export HOME=/home/#{node['user']['name']}
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    \\curl -L https://get.rvm.io | bash -s stable
    source $HOME/.rvm/scripts/rvm
    rvm install #{node['ruby']['version']}
    rvm use  #{node['ruby']['version']}
  EOH
  #not_if { File.exists?("/home/#{node['user']['name']}/.rvm/scripts/rvm") }
end

=begin
# create .bash_profile file
cookbook_file "/home/#{node['user']['name']}/.bash_profile" do
  source "bash_profile"
  mode 0644
  owner node['user']['name']
  group node['group']
end
=end


=begin
# install ruby
#version_path = "/home/#{node['user']['name']}/.rbenv/version"
bash 'install ruby' do
  user node['user']['name']
  cwd "/home/#{node['user']['name']}"
  code <<-EOH
    export HOME=/home/#{node['user']['name']}   
    rvm install #{node['ruby']['version']}
    rvm use  #{node['ruby']['version']}
  EOH
  #not_if { File.exists?(version_path) && `cat #{version_path}`.chomp.split[0] == node['ruby']['version'] }
end
=end

=begin
execute "su - #{node['user']['name']}"
execute "cd $HOME"
execute "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
execute "\\curl -L https://get.rvm.io | bash -s stable"
execute "source $HOME/.rvm/scripts/rvm"
execute "rvm install 2.1.5"
execute "rvm use 2.1.5"
=end


