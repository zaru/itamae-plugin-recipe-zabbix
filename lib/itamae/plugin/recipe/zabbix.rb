require "itamae/plugin/recipe/zabbix/version"

zabbix_version = 2.2 # or 1.8 ~ 2.4
zabbix_version = node[:zabbix][:version] if node[:zabbix][:version]

platform = "rhel" # or debian, ubuntu
platform = node[:zabbix][:platform] if node[:zabbix][:platform]

platform_version = "6"
platform_version = node[:zabbix][:platform_version] if node[:zabbix][:platform_version]

cpu = "x86_64" # or i386
cpu = node[:zabbix][:platform_cpu] if node[:zabbix][:platform_cpu]

case node[:platform]
  when "ubuntu"
    codename = 'trusty'
    codename = node[:zabbix][:codename] if node[:zabbix][:codename]
    execute "add zabbix agent pkg" do
      user "root"
      command "wget http://repo.zabbix.com/zabbix/#{zabbix_version}/ubuntu/pool/main/z/zabbix-release/zabbix-release_#{zabbix_version}-1+#{codename}_all.deb"
      command "dpkg -i zabbix-release_#{zabbix_version}-1+#{codename}_all.deb"
      command "apt-get update"
    end
  else
    package "http://repo.zabbix.com/zabbix/#{zabbix_version}/#{platform}/#{platform_version}/#{cpu}/zabbix-release-#{zabbix_version}-1.el#{platform_version}.noarch.rpm" do
      not_if "rpm -q zabbix-release"
    end
end
