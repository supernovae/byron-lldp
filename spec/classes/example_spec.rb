require 'spec_helper'

describe 'lldp' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "lldp class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('lldp::params') }
          it { is_expected.to contain_class('lldp::install').that_comes_before('lldp::config') }
          it { is_expected.to contain_class('lldp::config') }
          it { is_expected.to contain_class('lldp::service').that_subscribes_to('lldp::config') }

          it { is_expected.to contain_service('lldpd') }
          it { is_expected.to contain_package('lldpd').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'lldp class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('lldp') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
