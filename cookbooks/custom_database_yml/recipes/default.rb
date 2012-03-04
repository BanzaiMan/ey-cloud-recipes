environment = node.engineyard.environment

# db_master = node[:instances].select {|i| i["role"] == "db_master"}.first
user = node[:users].first

node.engineyard.apps.each do |app|
  template "/data/#{app.name}/current/config/database.yml" do
    source "database.yml.erb"
    owner environment.ssh_username
    group environment.ssh_username
    mode 0744
    variables({
      :username => user[:username],
      :password => user[:password],
      :dbname => app.database_name,
      :host => environment.db_host
      })
  end
end