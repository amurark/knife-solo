

# Configure the mysql2 Ruby gem.
mysql2_chef_gem 'default' do
  action :install
end

# Configure the MySQL client.
mysql_client 'default' do
  action :create
end


# Configure the MySQL service.
#mysql_service 'default' do
  #initial_root_password root_password_data_bag_item['password']
 # action [:create, :start]
#end


mysql_service 'foo' do
  port '3306'
  version '5.5'
  initial_root_password 'change me'
  action [:create, :start]
end


# Create the database instance.
mysql_database 'demo_database' do
  connection(
    :host => '127.0.0.1',
    :username => 'root',
    :password => 'root'
  )
  action :create
end
