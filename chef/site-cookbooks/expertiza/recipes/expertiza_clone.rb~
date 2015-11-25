#
# Cookbook Name:: Expertiza
# Recipe:: default
#
# Copyright 2015, North Carolina State University
#
# All rights reserved - Do Not Redistribute
#

#cloning Expertiza from git repo

directory "/home/Expetiza_demo2" do
  owner 	'root'
  group 	'root'
  mode 		'0754'
  action 	:create
end

git "/home/Expetiza_demo2" do
  #environment 	production                   
  repository	"https://github.com/expertiza/expertiza.git"
  reference		"master"                
  action		:sync                     
end
