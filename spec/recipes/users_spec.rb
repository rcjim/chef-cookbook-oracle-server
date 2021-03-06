require_relative '../spec_helper'

describe 'owi-oracle-server::users' do
  let(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }

  it 'creates a user named `oracle`' do
    expect(chef_run).to create_user('oracle')
  end

  it 'creates a group named `oinstall`' do
    expect(chef_run).to create_group('oinstall')
  end

  it 'creates a group named `dba` and adds the oracle user to it' do
    expect(chef_run).to create_group('dba')
  end

  it 'creates a directory named `/home/oracle`' do
    expect(chef_run).to create_directory('/home/oracle').with(
      user:   'oracle',
      group:  'oinstall'
    )
  end
end
