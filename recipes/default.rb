#
# Cookbook Name:: BUSCO
# Recipe:: default
#
# Copyright 2016 Eagle Genomics Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package ['tar', 'zlib-devel'] do
  action :install
end

include_recipe 'build-essential'

include_recipe 'poise-python'

python_runtime '3'

remote_file "#{Chef::Config[:file_cache_path]}/#{node['busco']['filename']}" do
  source node['busco']['url']
  action :create_if_missing
end

execute 'un-tar busco' do
  command "tar xzf #{Chef::Config[:file_cache_path]}/#{node['busco']['filename']} -C #{node['busco']['install_path']}"
  not_if { ::File.exist?("#{node['busco']['dir']}/busco") }
end

# The executables are python scripts, let's not add in symlinks atm....
# this symlinks every executable in the install subdirectory to the top of the directory tree
# so that they are in the PATH
# execute "find #{node['busco']['dir']} -maxdepth 1 -name '*.py' -executable -type f -exec ln -sf {} . \\;" do
#   cwd node['busco']['install_path'] + '/bin'
# end
