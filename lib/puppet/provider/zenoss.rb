require File.dirname(__FILE__) + '/../../zenoss/client'

class Puppet::Provider::Zenoss < Puppet::Provider
  def self.transport
    Puppet.debug "Zenoss::Client: connecting to #{Facter.value(:zs_host)}."
    options = { :host => Facter.value(:zs_host), :user => Facter.value(:zs_user), :password => Facter.value(:zs_password) }
    Zenoss::Client.init(options)
  end

  def transport
    self.class.transport
  end
end
