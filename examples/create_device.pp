#naive approach for now, should provide from external source
#$zenoss::user = "apiuser"
#$zenoss::password = "pass"

zs_device { '192.168.1.100':
  device_class => '/Printer',
  title => 'Canon C1000',
  #snmp_community => '',
#  snmp_port => 161,
#  manage_ip => '',
#  location_path => '',
#  system_paths => '',
#  group_paths => '',
#  model => 'False',
#  collector => 'localhost',
#  rack_slot => '',
#  production_state => 1000,
#  comments => '',
#  hw_manufacturer => '',
#  hw_productName => '',
#  os_manufacturer => '',
#  os_productName => '',
#  priority => 3,
#  tag => '',
#  serial_number => '',
}
