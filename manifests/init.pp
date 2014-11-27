class haproxy (


) inherits haproxy::params  {
 include concat::setup
 class { 'haproxy::install': }
 class { 'haproxy::configure': }
 class { 'haproxy::configure_default_webfarm':} 
 class { 'haproxy::configure_special_webfarm':} 

}

