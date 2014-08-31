require 'spec_helper'

describe 'gitweb', :type => :class do
  let(:title) { 'gitweb::install' }

  context 'with default parameters' do
    it { should contain_package('git')
        .with_ensure('present')
    }

    it { should contain_package('gitweb')
        .with_ensure('present')
    }
  end

  context 'version => present' do
    let(:params) { {:version => 'present'} }

    it { should contain_package('git')
        .with_ensure('present')
    }

    it { should contain_package('gitweb')
        .with_ensure('present')
    }
  end

  context 'version => latest' do
    let(:params) { {:version => 'latest'} }

    it { should contain_package('git')
        .with_ensure('latest')
    }

    it { should contain_package('gitweb')
        .with_ensure('latest')
    }
  end
end
