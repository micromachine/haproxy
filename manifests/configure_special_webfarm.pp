class haproxy::configure::special_webfarm (


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
                     'server webA  10.0.3.11:80 cookie A',
                     'server webB  10.0.3.12:80 cookie B',
                     'server webC  10.0.3.13:80 cookie C'
                     ],


) inherits haproxy::params {

  concat::fragment { "haproxy.cfg_special_webfarm":
      target  => "/etc/haproxy/haproxy.cfg",
      content => template("haproxy/haproxy_special_default.erb"),
      order   => 10,
    }

} 
