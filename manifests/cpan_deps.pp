# crucial
class w3c_validator::cpan_deps {

    include cpan

    # cpan { 'Test::Simple': ensure  => present, require => Class['::cpan'], }

    # cpan { 'JSON::PP': ensure  => present, require => Class['::cpan'], }

    cpan { 'App::cpanminus': ensure  => present, require => Class['::cpan'], }

    # cpan { 'version': ensure  => present, require => Class['::cpan'], }

    cpan { 'YAML': ensure  => present, require => Class['::cpan'], }

    package { 'libxml2-devel': ensure => present } ->
      cpan { 'XML::LibXML': ensure  => present, require => Class['::cpan'], }

    cpan { 'pmtools': ensure  => present, require => Class['::cpan'], }

    cpan { 'Term::ReadKey': ensure  => present, require => Class['::cpan'], }

    # cpan { 'Term::ReadLine::Perl': ensure  => present, #require => Class['::cpan'], }

    cpan { 'CGI': ensure  => present, require => Class['::cpan'], }

    cpan { 'Config::General': ensure  => present, require => Class['::cpan'], }

    cpan { 'Encode': ensure  => present, require => Class['::cpan'], }

    cpan { 'Encode::HanExtra': ensure  => present, require => Class['::cpan'], }

    cpan { 'HTML::Parser': ensure  => present, require => Class['::cpan'], }

    cpan { 'HTML::Encoding': ensure  => present, require => Class['::cpan'], }

    cpan { 'HTML::Template': ensure  => present, require => Class['::cpan'], }

    # cpan { 'JSON': ensure  => present, require => Class['::cpan'], }

    cpan { 'LWP': ensure  => present, require => Class['::cpan'], }

    cpan { 'Net::IP': ensure  => present, require => Class['::cpan'],}

    cpan { 'SGML::Parser::OpenSP': ensure  => present, require => Class['::cpan'], }

    # cpan { 'URI': ensure  => present, require => Class['::cpan'], }

    cpan { 'App::pmuninstall': ensure  => present, require => Class['::cpan'], }

}

