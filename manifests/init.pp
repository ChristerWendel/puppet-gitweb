# == Class: gitweb
#
# A module to configure gitweb for apache
#
# === Parameters
# ["version"]
#   The package version to install
#
# ["gitroot"]
#   Parent directory of git repositories
#
# ["enable"]
#   Should the service be enabled during boot time?
#
# ["start"]
#   Should the service be started by Puppet

class gitweb (
  $version = 'present',
  $gitroot = ['/var/lib/git'],
  $enable = true,
  $start = true
  )  {
    include apache

    class{'gitweb::install': } ->
    class{'gitweb::configure': } ~>
    Service['apache2'] ->
    Class['gitweb']
  }

