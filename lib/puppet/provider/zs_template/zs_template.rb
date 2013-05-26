require File.dirname(__FILE__) + '/../zenoss'

Puppet::Type.type(:zs_template).provide(:zs_template, :parent => Puppet::Provider::Zenoss) do
  @doc = "Manages Zenoss template"

  def create
    Puppet.debug("Puppet::Provider::ZS_Template: creating Zenoss template node #{resource[:name]}")
  end

  def destroy
    Puppet.debug("Puppet::Provider::ZS_Template: destroying Zenoss template node #{resource[:name]}")
  end

  def exists?
    true
    #transport[wsdl].get_list.include?(resource[:name])
  end
end
