execute 'rename database.yml' do
cwd '/home/root/expertiza/config'
command 'mv database.yml.example database.yml'
end

execute 'import db' do
cwd '/home/root/expertiza'
command 'mysql -uroot < /root/expertiza_scrubbed_2015_08_14.sql'
end

execute 'db migrate' do
cwd '/home/root/expertiza'
command 'rake db:migrate'
end

