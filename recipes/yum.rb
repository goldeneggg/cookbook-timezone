script "timezone_yum" do
    interpreter "bash"
    user "root"
    code <<-EOH
        mv #{node['timezone']['yum']['localtime_path']} #{node['timezone']['yum']['localtime_path']}.org
        ln -s #{node['timezone']['yum']['zoneinfo_path']}/#{node['timezone']['yum']['area']} #{node['timezone']['yum']['localtime_path']}
    EOH
    only_if "ls #{node['timezone']['yum']['zoneinfo_path']}/#{node['timezone']['yum']['area']}"
    not_if "date | grep #{node['timezone']['yum']['to_timezone']}"
end
