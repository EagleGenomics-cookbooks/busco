# BUSCO attributes
default['busco']['version'] = 'v1.22'
default['busco']['install_path'] = '/usr/local'
default['busco']['dir'] = default['busco']['install_path'] + '/' + 'BUSCO_' + default['busco']['version']
default['busco']['filename'] = "BUSCO_#{node['busco']['version']}.tar.gz"
default['busco']['root_url'] = 'http://busco.ezlab.org/files/'
default['busco']['url'] = "#{node['busco']['root_url']}#{node['busco']['filename']}"
default['busco']['lineage_filename'] = 'vertebrata_buscos.tar.gz'
default['busco']['lineage_url'] = "#{node['busco']['root_url']}#{node['busco']['lineage_filename']}"
# other attributes
node['poise-python']['install_python3']
