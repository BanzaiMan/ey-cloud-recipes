  file "/data/nginx/servers/#{app}/custom.conf" do
    action :create_if_missing
    owner node.engineyard.ssh_username
    group node.engineyard.ssh_username
    mode 0644
  end