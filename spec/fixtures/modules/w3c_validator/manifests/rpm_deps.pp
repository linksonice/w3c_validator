# w3c validator deps

class w3c_validator::rpm_deps {
$validator_dependency_pkgs = [ 'lynx',
  'httpd',
  'git',
  'libxml2',
  # the following - libxml2-devel - MUST be specified
  # in cpan_deps.pp - it's about the order of events!
  # 'libxml2-devel',
  'libxml2-static',
  'opensp',
  'opensp-devel',
  'tidy',
  'libtidy',
  'perl-libwww-perl',
  'gcc-c++',
  'mercurial',
  'mercurial-hgk' ]

  package { $validator_dependency_pkgs: ensure => present }
  }
