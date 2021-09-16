require 'spec_helper'

describe 'test::default' do
  context 'on ubuntu with default attribute values' do
    platform 'ubuntu', '20.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates help.txt' do
      # expect(chef_run).to <action>_<resource_type>('<resource title>')
      expect(chef_run).to create_file('/root/help.txt')
    end

    it 'installs apache2' do
      # expect(chef_run).to install_package('apache2').with(version: '1.2.3')
      # is_expected.to install_package('apache2').with(version: '1.2.3')
      is_expected.to install_package('apache2')
    end
  end
end


# expect(chef_run) = is_expected
