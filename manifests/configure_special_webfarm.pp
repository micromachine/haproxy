class haproxy::configure_special_webfarm (


  $ensure          = present,
  $acl             = undef,
  $acl_backend     = undef,
  $acl_header      = undef,
  $balance         = 'source',
  $bind            = '*:80',
  $default_backend = undef,
  $instance        = 'listen',
  $mode            = 'http',
  $option          = [ 'httpclose' ],
  $server          = [
                     'server webA  10.0.3.11:81 cookie A',
                     'server webB  10.0.3.12:81 cookie B',
                     'server webC  10.0.3.13:81 cookie C'
                     ],


) inherits haproxy::params {

  concat::fragment { "haproxy.cfg_special_webfarm":
      target  => "/etc/haproxy/haproxy.cfg",
      content => template("haproxy/haproxy_backend_special.erb"),
      order   => 10,
    }

} 
