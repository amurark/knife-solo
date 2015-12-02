execute 'start unicorn' do
cwd '/home/root/expertiza'
command 'unicorn_rails -c config/unicorn.rb -D'
end

execute 'restart nginx' do
cwd '/home/root/expertiza'
command 'service nginx restart'
end
