# == Class: gitweb::configure
#
# Configures gitweb authentication for apache
class gitweb::configure {
  $gitroot = $gitweb::gitroot

  file { '/etc/gitweb.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('gitweb/gitweb.erb'),
  } -> apache::loadmodule{'cgi': }

  file { '/etc/apache2/conf-available/git.conf':
    ensure  => present,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    content => template('gitweb/git.erb'),
  } -> apache::loadconf{'git': }
}
