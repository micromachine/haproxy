class haproxy::install {


  	package { "haproxy":
                ensure => present
                }
        service {'haproxy' :
                ensure => 'running',
                enable => 'true',
                require => Package['haproxy'],
                }
        file { '/etc/default/haproxy':
                content => 'ENABLED=1',
                require => Package['haproxy'],
                }
	concat { '/etc/haproxy/haproxy.cfg':
      		owner   => '0',
      		group   => '0',
      		mode    => '0644',
      		require => Package['haproxy'],
    		}



} 
