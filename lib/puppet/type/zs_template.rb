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

    Zenoss::Template::PARAMS.each do |name, options|
      #TODO implement boolean-specific boolean: true newparam option, Puppet type proxies and validation
      newparam(name, :namevar => options[:namevar]) do
        desc options[:description]
        required
      end
    end
  end
end
