require 'fileutils'
is_64bit = `uname -m` =~ /64/

if node[:instance_role] == 'util'
  has_32bit_cext = `find /data/*/shared/bundled_gems -name \\*so -exec file {} \\;` =~ /32-bit/
  has_64bit_cext = `find /data/*/shared/bundled_gems -name \\*so -exec file {} \\;` =~ /64-bit/

  if (is_64bit && has_32bit_cext || (!is_64bit) && has_64bit_cext)
    FileUtils.rm_rf Dir.glob('/data/*/shared/bundled_gems')
  end

  node[:applications].each do |app_name, data|
    next unless File.directory? "/data/#{app_name}/current"
    FileUtils.cd "/data/#{app_name}/current" do
      system "bundle install"
    end
  end
end