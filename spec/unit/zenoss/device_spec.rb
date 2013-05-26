require 'spec_helper'
require 'zenoss/device'

describe Zenoss::Device do
  it_behaves_like 'model'

  let(:params) { {
    :name => '192.168.0.100',
    :device_class => '/Printer',
    :title => 'Canon C1000'
  } }

  before(:each) do
    Zenoss::Client.init(host: '192.168.0.100', user: 'apiuser', password: 'zno314')
  end

  describe "create" do
    it "should add device to Zenoss instance" do
      #subject.client.should_receive(:get)
      #described_class.create(params)
    end
  end
end
