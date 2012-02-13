## note that the file paths are hardcoded.
if %w(solo app_master app).include? node[:instance_role]
  remote_file "/data/nginx/servers/todo/custom.conf" do
    owner node.engineyard.ssh_username
    group node.engineyard.ssh_username
    mode 0644
    source "custom.conf"
  end
  
  remote_file "/data/nginx/servers/todo/custom.ssl.conf" do
    owner node.engineyard.ssh_username
    group node.engineyard.ssh_username
    mode 0644
    source "custom.ssl.conf"
  end
end