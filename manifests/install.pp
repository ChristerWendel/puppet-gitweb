# == Class: gitweb::install
#
# Installs gitweb
class gitweb::install {
  package { 'git':
    ensure => $gitweb::version,
  }

  package { 'gitweb':
    ensure => $gitweb::version,
  }
}
