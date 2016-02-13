# Class: lldp
# ===========================
#
# Install and start lldpd services.
#
# Parameters
# ----------
#
# * `manage_repo`
#   CentOS/RedHat do not include lldpd in base os nor in epel.  Luckily OpenSuse makes RPMS.
# Setting this to true will allow this module to create the repo it needs to install the rpm
# from otherwise you will need the rpm "lldpd" in your own local repos.
#
class lldp (
  $package_name = $::lldp::params::package_name,
  $service_name = $::lldp::params::service_name,
  $manage_repo = $::lldp::params::manage_repo,
) inherits ::lldp::params {

  # validate parameters here
  validate_bool($manage_repo)

  class { '::lldp::install': } ->
  class { '::lldp::config': } ~>
  class { '::lldp::service': } ->
  Class['::lldp']
}
