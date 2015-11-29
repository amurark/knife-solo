#
# Cookbook Name:: Expertiza
# Recipe:: default
#
# Copyright 2015, North Carolina State University
#
# All rights reserved - Do Not Redistribute
#

#cloning Expertiza from git repo

directory "/home/#{node['user']['name']}/" do
  owner 	"#{node['user']['name']}"
  group 	"#{node['group']}"
  mode 		'0754'#check this once, should be 754 or 774, or should the group owner and group be deps and admin respectively
  action 	:create
end

git "/home/#{node['user']['name']}/#{node['app']}" do
  #environment 	production                   
  repository	"https://github.com/expertiza/expertiza.git"
  reference		"master"                
  action		:sync                     
end
