require 'spec_helper'

describe package('httpd'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('apache2'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('httpd'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe package('apache2'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('apache2'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe service('org.apache.httpd'), :if => os[:family] == 'darwin' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe file('/opt/ix/tomcat/Limits.conf') do
  it { should contain('RBT_ix soft nofile 65536').from(/^group :test do/).to(/^end/) }
  it { should contain('RBT_ix hard nofile 65536').from(/^group :test do/).to(/^end/) }
  it { should contain('RBT_ix soft nproc 16384').from(/^group :test do/).to(/^end/) }
  it { should contain('RBT_ix soft nproc 16384').from(/^group :test do/).to(/^end/) }

  # test 'rspec' exists after "group :test do".
  # it { should contain('rspec').after(/^group :test do/) }
  #
  # # test 'rspec' exists before "end".
  # it { should contain('rspec').before(/^end/) }
end
