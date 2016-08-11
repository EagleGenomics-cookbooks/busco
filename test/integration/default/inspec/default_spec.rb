
# Check that the installation directory was created successfully
describe file('/usr/local/BUSCO_v1.22') do
  it { should be_directory }
end
