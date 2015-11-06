%w( zabbix-agent ).each do |pkg|
  package pkg
end

template "/etc/zabbix/zabbix_agentd.conf" do
  owner "root"
  group "root"
  source "./templates/etc/zabbix/zabbix_agentd.conf.erb"
end

service 'zabbix-agent' do
  action [:enable, :start]
end

service "zabbix-agent" do
  subscribes :restart, "template[/etc/zabbix/zabbix_agentd.conf]"
end

define :zabbix_userparameters, path: "" do
  path = params[:path]

  node[:zabbix][:userparameters].each do |f|
    template "/etc/zabbix/zabbix_agentd.d/#{f.gsub('.erb', '')}" do
      owner "root"
      group "root"
      source  path + "/#{f}"
    end
  end

end