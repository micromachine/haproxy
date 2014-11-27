class config (
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
  $server          = undef,

 
	
) {


}

