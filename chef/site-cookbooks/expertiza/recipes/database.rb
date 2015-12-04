execute 'rename database.yml' do
	cwd node['database']['config']
	command 'mv database.yml.example database.yml'
end

execute 'extract scrubbed db' do
	cwd '/home'
#	command 'tar -xvzf  expertiza_scrubbed_2015_08_14.sql.tar.gz'
	command 'tar -xvzf  /home/#{node['database']['scrubbed_db']}'
end

execute 'import db' do
	cwd '/home/root/expertiza'
#	command 'mysql -uroot < /home/expertiza_scrubbed_2015_08_14.sql'
	command 'mysql -uroot < /home/#{node['database']['scrubbed_sql']}'
end

execute 'db migrate' do
	cwd '/home/root/expertiza'
	command 'rake db:migrate'
end

