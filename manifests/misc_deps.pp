# w3c deps

class w3c_validator::misc_deps {

file { '/tmp/install-misc-w3cv-deps.sh':
ensure => present,
source => 'puppet:///modules/w3c_validator/install-misc-w3cv-deps.sh',
owner  => 'root',
group  => 'root',
mode   => '0755'
  } ->

exec {'/tmp/install-misc-w3cv-deps.sh':
require=>File['/tmp/install-misc-w3cv-deps.sh'],
  } ->

exec {'/usr/sbin/apachectl graceful': }
}
