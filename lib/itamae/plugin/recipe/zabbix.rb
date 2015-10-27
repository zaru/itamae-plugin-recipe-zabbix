require "itamae/plugin/recipe/zabbix/version"

zabbix_version = 2.2 # or 1.8 ~ 2.4
zabbix_version = node[:zabbix][:version] if node[:zabbix][:version]

platform = "rhel" # or debian, ubuntu
platform = node[:distribution][:version] if node[:distribution][:version]

platform_version = "6"
platform_version = node[:platform_version] if node[:platform_version]

cpu = "x86_64" # or i386
cpu = node[:distribution][:cpu] if node[:distribution][:cpu]

package "http://repo.zabbix.com/zabbix/#{zabbix_version}/#{platform}/#{platform_version}/#{cpu}/zabbix-release-#{zabbix_version}-1.el#{platform_version}.noarch.rpm" do
  not_if "rpm -q zabbix-release"
end
