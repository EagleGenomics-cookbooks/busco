# BUSCO attributes
default['busco']['version'] = 'v1.22'
default['busco']['install_path'] = '/usr/local'
default['busco']['dir'] = default['busco']['install_path'] + '/' + 'busco-' + default['busco']['version']
default['busco']['filename'] = "BUSCO_#{node['busco']['version']}.tar.gz"
default['busco']['url'] = "http://busco.ezlab.org/files/#{node['busco']['filename']}"

# other attributes
node['poise-python']['install_python3']
