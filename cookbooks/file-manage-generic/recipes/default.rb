## note that the file paths are hardcoded.
# Adjust the instance types as necessary
if %w(solo app_master app).include? node[:instance_role]
  # specify file location
  remote_file "/data/nginx/servers/todo/custom.conf" do
    owner node.engineyard.ssh_username
    group node.engineyard.ssh_username
    mode 0644
    source "source_file"
  end
end