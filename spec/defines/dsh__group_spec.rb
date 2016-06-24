require 'spec_helper'

$systems = ['foo1', 'foo2', 'foo3']
describe 'dsh::group' do
    let (:title) { 'blub' }
    let (:params) {{
        :grpname    => 'foo',
        :systems    => $systems
    }}
    it { is_expected.to contain_file('/etc/dsh/group/foo') }
    $systems.each do |system|
        it do
            is_expected.to contain_file('/etc/dsh/group/foo')
                .with_content(/^#{system}$/)
        end
    end
end
