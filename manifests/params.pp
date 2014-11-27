class haproxy::params {

  $stats_auth_enable    = false
  $stats_auth_pass      = 'secret'
  $stats_auth_user      = 'haproxy'
  $stats_enable         = false
  $stats_listen_address = '127.0.0.1'
  $stats_listen_port    = '8000'
  $stats_realm          = 'HAProxy'
  $stats_url            = '/haproxy'

  $global_chroot       = undef
  $global_daemon       = true
  $global_debug        = false
  $global_log          = [ '/dev/log local0', '/dev/log local1 notice' ]
  $global_maxconn      = '4096'
  $global_nbproc       = $::processorcount
  $global_quiet        = false
  $global_stats_socket = '/var/run/haproxy.sock mode 660 level admin'
  $global_ulimit       = '8192'
  $daemon_user 	       = 'haproxy'
  $daemon_group        = 'haproxy'
  $config_dir	       = '/etc/haproxy'

  $defaults_log        = [ 'global' ]
  $defaults_retries    = '3'
  $defaults_maxconn    = '2000'
  $defaults_contimeout = '5000'
  $defaults_clitimeout = '50000'
  $defaults_srvtimeout = '50000'
  $defaults_option     = [
    'httplog',
    'redispatch',
    'dontlognull'
  ]

  $ensure          = present
  $acl             = undef
  $acl_backend     = undef
  $acl_header      = undef
  $balance         = 'source'
  $bind            = '*:80'
  $default_backend = 'default_webfarm'
  $instance        = 'listen'
  $mode            = 'http'
  $option          = [ 'httpclose' ]
  $server          = undef
  $fname 	   = 'all_http'
  $special_backend_name   = 'special_webfarm'
  $special_acl_name   = 'cdn'
  $special_host_name = 'cdn.media4net.pl'


}
