default['timezone']['install_type'] = case node['platform_family']
    when "rhel", "fedora"
        "yum"
    when "debian"
        "apt"
    else
        # TODO
        "source"
end

default['timezone']['yum']['localtime_path'] = "/etc/localtime"
default['timezone']['yum']['zoneinfo_path'] = "/usr/share/zoneinfo"
default['timezone']['yum']['area'] = "Asia/Tokyo"
default['timezone']['yum']['to_timezone'] = "JST"

default['timezone']['apt']['localtime_path'] = "/etc/timezone"
default['timezone']['apt']['zoneinfo_path'] = "/usr/share/zoneinfo"
default['timezone']['apt']['area'] = "Japan"
default['timezone']['apt']['to_timezone'] = "JST"
