require File.dirname(__FILE__) + '/../zenoss'

Puppet::Type.type(:zs_device).provide(:zs_device, :parent => Puppet::Provider::Zenoss) do
  @doc = "Manages Zenoss device"

  def create
    Puppet.debug("Puppet::Provider::ZS_Device: creating Zenoss device node #{resource[:name]}")
    ## The F5 API isn't consistent, it accepts long instead of ULong64 so we set connection limits later.
    #transport[wsdl].create(resource[:name], [0])
    #
    #methods = [ 'connection_limit',
    #            'dynamic_ratio',
    #            'ratio',
    #            'screen_name',
    #            'session_enabled_state' ]
    #
    #methods.each do |method|
    #  self.send("#{method}=", resource[method.to_sym]) if resource[method.to_sym]
    #end
  end

  def destroy
    Puppet.debug("Puppet::Provider::ZS_Device: destroying Zenoss device node #{resource[:name]}")
    #transport[wsdl].delete_node_address(resource[:name])
  end

  def exists?
    true
    #transport[wsdl].get_list.include?(resource[:name])
  end

  #confine :feature => :posix
  #defaultfor :feature => :posix
  #
  #def self.wsdl
  #  'LocalLB.NodeAddress'
  #end
  #
  #def wsdl
  #  self.class.wsdl
  #end
  #
  #def self.instances
  #  transport[wsdl].get_list.collect do |name|
  #    new(:name => name)
  #  end
  #end
  #
  methods = [ 'dynamic_ratio',
              'ratio',
              'screen_name',
              'session_enabled_state']
  #
  #methods.each do |method|
  #  define_method(method.to_sym) do
  #    if transport[wsdl].respond_to?("get_#{method}".to_sym)
  #      transport[wsdl].send("get_#{method}", resource[:name]).first.to_s
  #    end
  #  end
  #end
  #
  #methods.each do |method|
  #  define_method("#{method}=") do |value|
  #    if transport[wsdl].respond_to?("set_#{method}".to_sym)
  #      transport[wsdl].send("set_#{method}", resource[:name], resource[method.to_sym])
  #    end
  #  end
  #end
  #
  #def connection_limit
  #  val = transport[wsdl].get_connection_limit(resource[:name]).first
  #  to_64s(val)
  #end
  #
  #def connection_limit=(value)
  #  transport[wsdl].set_connection_limit(resource[:name], [ to_32h(resource[:connection_limit]) ])
  #end
  #
  #def monitor_association
  #  transport[wsdl].get_monitor_association(resource[:name])
  #end
  #
end
