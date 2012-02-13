## note that the file paths are hardcoded.
if %w(solo app_master app).include? node[:instance_role]
  file "/data/nginx/servers/todo/custom.conf" do
    action :create_if_missing
    owner node.engineyard.ssh_username
    group node.engineyard.ssh_username
    mode 0644
    source "custom.conf"
  end
  
  file "/data/nginx/servers/todo/custom.ssl.conf" do
    action :create_if_missing
    owner node.engineyard.ssh_username
    group node.engineyard.ssh_username
    mode 0644
    source "custom.ssl.conf"
  end
end