require 'spec_helper'

describe 'dsh' do
  it { is_expected.to compile.with_all_deps }

  context 'with default params' do
    it { is_expected.to contain_package('dsh')}
    it { is_expected.to contain_file('/etc/dsh/group/all')}

  end

  $systems_group1 = ['baz1', 'baz2']
  $systems_group2 = ['baz3', 'baz4']

  context 'with a group' do
    let (:params) {
      {
        :groups => {
          'group1' => {
            'systems' => $systems_group1
          },
          'group2' => {
            'systems' => $systems_group2
          }
        }
      }
    }
    it { is_expected.to contain_dsh__group('all') }

    it { is_expected.to contain_dsh__group('group1')}
    it { is_expected.to contain_dsh__group('group1').with_systems($systems_group1)}

    it { is_expected.to contain_dsh__group('group2') }
    it { is_expected.to contain_dsh__group('group2').with_systems($systems_group2)}

  end
end
