require 'net/http'
require 'singleton'

require File.dirname(__FILE__) + '/model'
require File.dirname(__FILE__) + '/authentication_error'

module Zenoss
  class Client
    include Singleton

    attr_accessor :config
    attr_accessor :secret

    def self.init(options = {})
      client = instance
      client.config = ( client.config || { host: 'localhost', port: 8080 } ).update options
      client
    end

    def post(path, data)
      request(:post, path, data)
    end

    def get(path, data)
      request(:get, path, data)
    end

    def request(method, path, data)
      raise ArgumentError.new "Invalid method" unless [:get, :post, :put, :delete].include? method
      with_secret do
        url = URI(hostname + path)
        Object.const_get("Net::HTTP::#{method.to_s.capitalize}").new(url.path)
        req.add_field("Cookie", "_ZopeId=#{secret}")
        req.add_field("Content-type", "application/json; charset=utf-8")
        req = Net::HTTP.new(url.host, url.port).start do |http|
          http.request(req)
        end
      end
    end

    def with_secret
      fetch_secret unless self.secret
      yield
    end

    def fetch_secret
      params = { :__ac_name => config[:user], :__ac_password => config[:password], :submitted => true, :came_from => "http://#{config[:host]}:#{config[:port]}/zport/dmd" }
      r = Net::HTTP.post_form URI("#{self.hostname}/zport/acl_users/cookieAuthHelper/login"), params
      raise AuthenticationError.new "Could not authenticate to #{hostname}: step 1 failed, expected redirect, got #{r.code}" unless r.code == 302
      r = Net::HTTP.post_form URI(r.header['Location']), params
      raise AuthenticationError.new "Could not authenticate to #{hostname}: step 1 failed, expected redirect, got #{r.code}" unless r.code == 200
      self.secret = $1 if r.header["set-cookie"].match /_ZopeId="([^"]+)"/
      raise AuthenticationError.new "Could not authenticate to #{hostname}: failed to fetch secret from responce" unless secret
    end

    def hostname
      "http://#{config[:host]}:#{config[:port]}"
    end
  end
end
