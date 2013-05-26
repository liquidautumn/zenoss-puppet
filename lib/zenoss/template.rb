require File.dirname(__FILE__) + '/model'

module Zenoss
  class Template < Model
    PARAMS = {
      id: { type: String, description: 'Unique ID of the template to add', required: true, namevar: true },
      targetUid: { type: String, description: 'Unique ID of the device class to add template to', required: true }
    }
  end
end
