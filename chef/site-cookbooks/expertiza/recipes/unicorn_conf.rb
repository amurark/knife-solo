

execute 'Install unicorn Gem' do
	cwd '#{node[config][exp_path]}'
	command 'gem install unicorn'
end

# set custom Unicorn config
template "#{node[config][exp_path]}/config/unicorn.rb" do
  source "unicorn.rb.erb"
  mode '0755'
  owner 'root'
end

