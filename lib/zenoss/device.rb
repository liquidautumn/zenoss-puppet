require File.dirname(__FILE__) + '/model'

module Zenoss
  class Device < Model
    PARAMS = {
      deviceName: { type: String, description: 'Name or IP of the new device', required: true, namevar: true },
      deviceClass: { type: String, description: 'The device class to add new device to', required: true },
      title: { type: String, description: 'The title of the new device', default: '' },
      snmpCommunity: { type: String, description: 'A specific community string to use for this device', default: '' },
      snmpPort: { type: Integer, description: 'SNMP port on new device', default: 161 },
      manageIp: { type: String, description: 'Management IP address on new device', default: '' },
      locationPath: { type: String, description: 'Organizer path of the location for this device', default: '' },
      systemPaths: { type: Array, description: 'List of organizer paths for the device', default: [] },
      groupPaths: { type: Array, description: 'List of organizer paths for the device', default: [] },
      model: { type: Boolean, description: 'True to model device at add time', default: false },
      collector: { type: String, description: 'Collector to use for new device', default: 'localhost' },
      rackSlot: { type: String, description: 'Rack slot description', default: '' },
      productionState: { type: Integer, description: 'Production state of the new device', default: 1000 },
      comments: { type: String, description: 'Comments on this device', default: '' },
      hwManufacturer: { type: String, description: 'Hardware manufacturer name', default: '' },
      hwProductName: { type: String, description: 'Hardware product name', default: '' },
      osManufacturer: { type: String, description: 'OS manufacturer name', default: '' },
      osProductName: { type: String, description: 'OS product name', default: '' }
    }
  end
end
