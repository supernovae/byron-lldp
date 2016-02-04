# == Class lldp::params
#
# This class is meant to be called from lldp.
# It sets variables according to platform.
#
class lldp::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'lldpd'
      $service_name = 'lldpd'
    }
    'RedHat', 'Amazon': {
      $package_name = 'lldpd'
      $service_name = 'lldpd'
      $manage_repo = true
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
