require 'spec_helper'
require 'zenoss/device'

describe "Zenoss device management" do
  let(:attributes) { { id: '192.168.0.216', targetUid: '/Printer' } }

  describe "on create" do
    it "should add device to zenoss instance" do
      device = Zenoss::Device.create(attributes)
      Zenoss::Device.find(attributes[:id]).should == device
    end
  end

  describe "on destroy" do
    it "should remove device from zenoss instance" do
      Zenoss::Device.destroy(attributes[:id])
      Zenoss::Device.find(attributes[:id]).should == nil
    end
  end
end
