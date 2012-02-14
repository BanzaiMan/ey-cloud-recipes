require 'rbconfig'

execute "install gem for this ruby" do
  this_ruby = File.join(RbConfig::CONFIG["bindir"], RbConfig::CONFIG["ruby_install_name"])
  this_gem = File.join(RbConfig::CONFIG["bindir"], "gem")
  command "#{this_ruby} #{this_gem} install facets"
end