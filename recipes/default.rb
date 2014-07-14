#
# Cookbook Name:: init_heroku
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
script "heroku" do
	interpreter "bash"
	user "root"
	code <<-EOH
	wget -qO- https://toolbelt.heroku.com/install.sh | sh
	EOH
	only_if do ! File.exists?("/usr/local/heroku/bin/heroku") end
end

directory "/home/vagrant/.ssh" do
	mode 0700
	owner "vagrant"
	action :create
	only_if do ! File.exists?("/home/vagrant/.ssh") end
end

file "/home/vagrant/.ssh/config" do
	mode 0600
	owner "vagrant"
	action :create
	only_if do ! File.exists?("/home/vagrant/.ssh/config") end
end

script "config_heroku" do
	interpreter "bash"
	user "root"
	code <<-EOH
	echo 'Host heroku.com
    User git
    port 22
    Hostname heroku.com
    IdentityFile ~/.ssh/id_rsa_heroku
    TCPKeepAlive yes
    IdentitiesOnly yes' >> /home/vagrant/.ssh/config
	EOH
	not_if "grep 'heroku.com' /home/vagrant/.ssh/config > /dev/null"
end

cookbook_file "/home/vagrant/.ssh/id_rsa_heroku" do
	source ".ssh/id_rsa_heroku"
	mode   0600
	owner "vagrant"
	only_if do ! File.exists?("/home/vagrant/.ssh/id_rsa_heroku") end
end

