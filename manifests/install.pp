# == Class lldp::install
#
# This class is called from lldp for install.
#
class lldp::install {

  yumrepo { 'vbernat':
    ensure   => present,
    descr    => 'vbernat-lldp',
    baseurl  => "http://download.opensuse.org/repositories/home:/vbernat/CentOS_${::operatingsystemmajrelease}/",
    gpgcheck => 0,
    notify   => Exec['clean-cache'],
  }

  package { $::lldp::package_name:
    ensure => present,
    tag    => 'lldpd',
  }

  exec { 'clean-cache':
    command     => 'yum clean metadata',
    path        => ['/usr/bin', '/bin'],
    refreshonly => true,
  }

  if $::lldp::manage_repo == true {
    Yumrepo['vbernat'] -> Package<|tag == 'lldpd'|>
  }
  else {
    Package<|tag == 'lldpd'|>
  }

}