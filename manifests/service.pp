# == Class lldp::service
#
# This class is meant to be called from lldp.
# It ensure the service is running.
#
class lldp::service {

  service { $::lldp::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
