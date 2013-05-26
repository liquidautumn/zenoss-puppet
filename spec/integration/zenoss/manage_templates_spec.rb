require 'spec_helper'
require 'zenoss/template'

describe "Zenoss template management" do
  let(:attributes) { { id: 'unique_template_id', targetUid: '/Printer' } }

  describe "on create" do
    it "should add template to zenoss instance" do
      template = Zenoss::Template.create(attributes)
      Zenoss::Template.find(attributes[:id]).should == template
    end
  end

  describe "on destroy" do
    it "should remove template from zenoss instance" do
      Zenoss::Template.destroy(attributes[:id])
      Zenoss::Template.find(attributes[:id]).should == nil
    end
  end
end
