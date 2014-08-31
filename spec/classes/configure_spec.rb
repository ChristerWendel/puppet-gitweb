require 'spec_helper'

describe 'gitweb', :type => :class do
  let(:title) { 'gitweb::configure' }

  it { should contain_file('/etc/gitweb.conf')
    .with_ensure('present')
    .with_owner('root')
    .with_group('root')
    .with_mode('0644')
    .that_comes_before('Apache::loadmodule[cgi]')
  }

  it { should contain_file('/etc/apache2/conf-available/git.conf')
    .with_ensure('present')
    .with_owner('www-data')
    .with_group('www-data')
    .with_mode('0644')
    .that_comes_before('Apache::loadconf[git]')
  }
end
