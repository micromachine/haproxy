# haproxy

#### Info
This module generate haproxy.cfg with two backends  
-----
```
defaults
	log             global
	option          httplog
	option          redispatch
	option          dontlognull
	retries         3
	maxconn         2000
	timeout connect 5000
	timeout client  50000
	timeout server  50000
	errorfile       400 /etc/haproxy/errors/400.http
        errorfile       403 /etc/haproxy/errors/403.http
        errorfile       408 /etc/haproxy/errors/408.http
        errorfile       500 /etc/haproxy/errors/500.http
        errorfile       502 /etc/haproxy/errors/502.http
        errorfile       503 /etc/haproxy/errors/503.http
        errorfile       504 /etc/haproxy/errors/504.http

frontend all_http
        mode            http
        bind            *:80
        option          httpclose
        acl cdn hdr_dom(host) -i cdn.media4net.pl
        use_backend special_webfarm if cdn
        default_backend default_webfarm
        
backend default_webfarm
        mode    http
        balance source
        option  httpclose
        
        server   webA  10.0.3.11:80 cookie A
        server   webB  10.0.3.12:80 cookie B
        server   webC  10.0.3.13:80 cookie C

backend special_webfarm
        mode    http
        balance source
        option  httpclose
        
        server webA  10.0.3.11:81 cookie A
        server webB  10.0.3.12:81 cookie B
        server webC  10.0.3.13:81 cookie C

```
