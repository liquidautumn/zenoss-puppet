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

  newparam(:name, :namevar=>true) do
    desc "Device IP address or domain name."
    newvalues(/^[[:alpha:][:digit:]\.]+$/)
  end

  newparam(:device_class) do
    desc "Zenoss device."
  end

  newparam(:title) do
    desc "Device title."
  end
end
