class ntp_wrapper {
   $server1 = '0.pool.ntp.org'
   $server2 = '1.pool.ntp.org'
  package { 'ntp':
    ensure => present,
    }  

  file { '/etc/ntp.conf':
    ensure  => file,
    group   => 'root',
    mode    => '0644',
    owner   => 'root',
    #source => 'puppet:///modules/ntp_wrapper/ntp.conf',
    content => epp('ntp_wrapper/ntp.conf.epp'),
    require => Package['ntp'],
    notify  => Service['ntpd'],
  }

    service { 'ntpd':
      ensure    => running,
      enable    => true,
    }
}
