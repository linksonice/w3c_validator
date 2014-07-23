# w3c deps

class w3c_validator::misc_deps {
# file { '/tmp/tidyp-1.04.tar.gz':
# ensure => present,
# source => 'puppet:///modules/w3c_validator/tidyp-1.04.tar.gz',
# owner  => 'root',
# group  => 'root',
# mode   => '0755'
#   } ->

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

# file { '/etc/httpd/conf.d/validator.conf':
# ensure => present,
# source => 'puppet:///modules/w3c_validator/validator.conf',
# owner  => 'root',
# group  => 'root',
# mode   => '0755'
#  } ->

exec {'/usr/sbin/apachectl graceful':
# require=>File['/usr/sbin/apachectl'],
  }
}
