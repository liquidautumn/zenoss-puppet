#naive approach for now, should provide from external source
$zenoss::user = "apiuser"
$zenoss::password = "pass"

zenoss::template { 'template_id':
  target_uid => 'target_id'
}

zenoss::template { 'template_id':
  ensure => absent
}

