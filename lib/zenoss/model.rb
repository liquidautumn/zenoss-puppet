require File.dirname(__FILE__) + '/client'

module Zenoss
  class Model
    attr_accessor :attributes

    def initialize(attributes = {})
      self.attributes = attributes
    end

    def self.create(attributes = {})
      m = new(attributes)
      m.save!
    end

    def save!
      client.post(path, attributes)
    end

    def router
      self.class.to_s.downcase
    end

    def path
      "/zport/dmd/#{router}_router"
    end

    def client
      Client.init
    end
  end
end
