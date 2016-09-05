
# Check that the installation directory was created successfully
describe file('/usr/local/BUSCO_v1.22') do
  it { should be_directory }
end

# check lineage
describe file('/usr/local/BUSCO_v1.22/vertebrata') do
  it { should be_directory }
end

describe file('/usr/local/BUSCO_v1.22/BUSCO_v1.22.py') do
  it { should be_file }
end

describe file('/usr/local/BUSCO_v1.22/sample_data') do
  it { should be_directory }
end

describe bash('. /etc/profile; cd /usr/local/BUSCO_v1.22/sample_data; python3 /usr/local/BUSCO_v1.22/BUSCO_v1.22.py -f -in target.fa -o SAMPLE -l example -m genome') do
  its(:exit_status) { should eq 0 }
end

describe file('/usr/local/BUSCO_v1.22/sample_data/run_SAMPLE') do
  it { should be_directory }
end

# BUSCO suggests you should compare the output of your test to a proveided result: run_example, however
# the order can be diffferent so we will directlyt look for the correct results:
describe file('/usr/local/BUSCO_v1.22/sample_data/run_SAMPLE/full_table_SAMPLE') do
  it { should exist }
  its('content') { should match(/BUSCO_10\sMissing/) }
  its('content') { should match '234117]' }
end

describe file('/usr/local/BUSCO_v1.22/sample_data/run_SAMPLE/short_summary_SAMPLE') do
  it { should exist }
  its('content') { should match(/10\sTotal BUSCO groups searched/) }
  its('content') { should match(/2\sMissing BUSCOs/) }
  its('content') { should match 'BUSCO was run in mode: genome' }
end

describe file('/usr/local/BUSCO_v1.22/sample_data/temp') do
  it { should exist }
  its('content') { should match 'Internal pipeline statistics summary' }
end
