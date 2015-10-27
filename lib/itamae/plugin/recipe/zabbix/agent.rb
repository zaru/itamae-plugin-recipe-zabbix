%w( zabbix-agent ).each do |pkg|
  package pkg
end

template "/etc/zabbix/zabbix_agentd.conf" do
  owner "root"
  group "root"
  source "./templates/etc/zabbix/zabbix_agentd.conf.erb"
end

template "/etc/zabbix/zabbix_agentd.d/userparameter_netstat.conf" do
  owner "root"
  group "root"
  source "./templates/etc/zabbix/zabbix_agentd.d/userparameter_netstat.conf.erb"
end

service 'zabbix-agent' do
  action [:enable, :start]
end

service "zabbix-agent" do
  subscribes :restart, "template[/etc/zabbix/zabbix_agentd.conf]"
end
