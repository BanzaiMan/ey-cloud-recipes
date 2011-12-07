#
#

if ['app_master'].include? node[:instance_role]
  # customizations
  app_name = "app"
  execute "insert errorfile directive to haproxy.cfg" do
    not_if "grep 'errorfile [0-9][0-9][0-9] /data' /etc/haproxy.cfg"
    command "sed -i.bak 's:^defaults:defaults\\n\\terrorfile 504 /data/#{app_name}/shared/system/500.http:' /etc/haproxy.cfg"
  end

end
