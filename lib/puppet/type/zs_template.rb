Puppet::Type.newtype(:zs_template) do
  @doc = "Manage Zenoss templates."

  ensurable do
    desc "Zenoss template resource state. Valid values are present, absent."

    defaultto(:present)

    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end
  end
end
