class haproxy::configure_default_webfarm (
#	
#        backend default_webfarm
#               mode http
#               balance roundrobin
#               cookie SERVERID insert nocache indirect
#               fullconn   10000
#	       option httpclose
#               option forwardfor
#	       option http-server-close
#              #option httpchk HEAD /robots.txt HTTP/1.0
#              #option httpchk HTTP/1.1
#	       server webA 10.0.3.100:81 cookie A check maxconn 2048
#               server webB 10.0.3.101:81 cookie B check maxconn 2048

  $ensure          = present,
  $acl             = undef,
  $acl_backend     = undef,
  $acl_header      = undef,
  $bname 	   = 'default_webfarm',
  $balance         = 'source',
  $bind            = '*:80',
  $default_backend = undef,
  $instance        = 'listen',
  $mode            = 'http',
  $option          = [ 'httpclose' ],
  $server          = [
                     ' webA  10.0.3.11:80 cookie A',
		     ' webB  10.0.3.12:80 cookie B',
                     ' webC  10.0.3.13:80 cookie C'
                     ],


) inherits haproxy::params  {

  concat::fragment { "haproxy.cfg_default_webfarm":
      target  => "/etc/haproxy/haproxy.cfg",
      content => template("haproxy/haproxy_backend_default.erb"),
      order   => 09,
    }

} 
