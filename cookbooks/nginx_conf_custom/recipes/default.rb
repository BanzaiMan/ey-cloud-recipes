# apply nginx customizations if appropriate

if ['solo', 'app', 'app_master'].include?(node[:instance_role])
  remote_file "/data/nginx/servers/#{app_name}/custom.locations.conf" do
    # do not replace existing customizations
    not_if "grep -v 'Custom locations' custom.locations.conf", :cwd => "/data/nginx/servers/#{app_name}"
    mode "0644"
    source "custom.locations.conf"
  end
  
  execute 'reload nginx configurations' do
    command '/etc/init.d/nginx reload'
    user 'root'
  end
end