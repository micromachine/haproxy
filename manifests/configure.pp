class haproxy::configure {

  concat::fragment { 'haproxy.cfg_header':
    target  => "/etc/haproxy/haproxy.cfg",
    content => "# Managed by Puppet\n",
    order   => 01,
  }

  concat::fragment { 'haproxy.cfg_global':
    target  => "/etc/haproxy/haproxy.cfg",
    content => template('haproxy/haproxy_main.erb'),
    order   => 02,
  }
  concat::fragment { "haproxy.cfg_instance":
      target  => "/etc/haproxy/haproxy.cfg",
      content => template("haproxy/haproxy_front.erb"),
      order   => 03,
    }

} 
