require 'lib/zenoss/device'

Puppet::Type.newtype(:zs_device) do
  @doc = "Manage Zenoss devices."

  ensurable do
    desc "Zenoss device resource state. Valid values are present, absent."

    defaultto(:present)

    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end
  end

  Zenoss::Device::PARAMS.each do |name, options|
    #TODO implement boolean-specific boolean: true newparam option, Puppet type proxies and validation
    newparam(name, :namevar => options[:namevar]) do
      desc options[:description]
      required
    end
  end
end
