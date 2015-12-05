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
  mode 		"#{node['expertiza_clone']['mode']}"
  action 	:create
end

git "/home/#{node['user']['name']}/#{node['app']}" do
  repository	"#{node['expertiza_clone']['github']}"
  reference		"master"                
  action		:sync                     
end
