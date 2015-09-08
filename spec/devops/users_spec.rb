require 'spec_helper'

describe file('/etc/passwd') do
  its(:content) { should match /deploy/ }
end
