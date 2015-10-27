%w( zabbix-agent ).each do |pkg|
  package pkg
end

template "/etc/zabbix/zabbix_agentd.conf" do
  owner "root"
  group "root"
  source "./templates/etc/zabbix/zabbix_agentd.conf.erb"
end

node[:zabbix][:userparameters].each do |f|
  template "/etc/zabbix/zabbix_agentd.d/#{f}" do
    owner "root"
    group "root"
    source "/zabbix/templates/etc/zabbix/zabbix_agentd.d/#{f}.erb"
  end
end

service 'zabbix-agent' do
  action [:enable, :start]
end

service "zabbix-agent" do
  subscribes :restart, "template[/etc/zabbix/zabbix_agentd.conf]"
end
