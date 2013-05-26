module IntegrationHelpers
  def zenoss
    Zenoss::Client.init()

  end
end
