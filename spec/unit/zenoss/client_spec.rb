require 'spec_helper'
require 'zenoss/client'

describe Zenoss::Client do
  let(:options) { {} }

  subject { described_class.init(options)}

  describe "being singleton" do
    it "should disallow direct object creation" do
      expect { described_class.new }.to raise_error NoMethodError
    end

    it "should return same object on each init() call" do
      described_class.init.should be(described_class.init)
    end

    it "should keep configuration between init() calls" do
      config = { :user => 'user', :password => 'password' }
      instance = described_class.init(config)
      described_class.init(:port => 9090).config[:user].should == 'user'
      described_class.init.config[:password].should == 'password'
      instance.config[:port].should == 9090
    end
  end

  describe "on init" do
    it "should set config[:host] to localhost by default" do
      subject.config[:host].should == 'localhost'
    end

    it "should set config[:port] to 8080 by default" do
      subject.config[:host].should == 'localhost'
    end

    %w{host port user password}.each do |value|
      context "when '#{value}' option passed" do
        let(:options) { { value.to_sym => value } }

        it "should update config to received value" do
          subject.config[value.to_sym].should == value
        end
      end
    end
  end

  #it "should connect to Zenoss server with valid credentials" do
  #  subject.connect(user: 'apiuser', password: 'validpassword')
  #end

  it "should raise Zenoss::AuthenticationException on connection attempt with incorrect credentials"
end
