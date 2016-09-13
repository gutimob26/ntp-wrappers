class ntp_wrapper {
  package { 'ntp':
    ensure => present,
  }

  file { '/etc/ntp.conf':
    ensure  => file.
    group   => 'root',
    mode    => '0644',
    owner   => 'root',
    source  => 'puppet:///modules/ntp_wrapper/ntp.conf',
    require => Package['ntp'],
    notify  => Service['ntpd'],

    service { 'ntpd':
      ensure    => running,
      enable    => true,
    }
  }
