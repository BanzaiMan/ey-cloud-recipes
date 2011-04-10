# apply nginx customizations if appropriate

if ['solo', 'app', 'app_master'].include?(node[:instance_role])
  node[:applications].each do |app_name, data|
    # presently, we apply the same customizations for all applications on this server
    remote_file "/data/nginx/servers/#{app_name}/custom.locations.conf" do
      # do not replace existing customizations
      not_if "grep -v 'Custom locations' /data/nginx/servers/#{app_name}/custom.locations.conf"
      mode "0644"
      source "custom.locations.conf"
    end

    execute 'reload nginx configurations' do
      command '/etc/init.d/nginx reload'
      user 'root'
    end
  end
end