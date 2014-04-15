script "timezone_apt" do
    interpreter "bash"
    user "root"
    code <<-EOH
        mv #{node['timezone']['apt']['localtime_path']} #{node['timezone']['apt']['localtime_path']}.org
        echo "#{node['timezone']['apt']['area']}" > #{node['timezone']['apt']['localtime_path']}
        dpkg-reconfigure -f noninteractive tzdata
    EOH
    only_if "ls #{node['timezone']['apt']['zoneinfo_path']}/#{node['timezone']['apt']['area']}"
    not_if "date | grep #{node['timezone']['apt']['to_timezone']}"
end
