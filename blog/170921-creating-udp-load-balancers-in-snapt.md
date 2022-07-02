# Creating UDP load balancers in Snapt
Last updated: Sep. 21, '17

## Executive Summary
As of the date of this writing (Sep. 21, '17), the ADC solution provided by Snapt has not supported the creation of UDP load balancers for the simple fact that its is underpinned by HAProxy which is strictly a TCP load balancer. However, Snapt Accelerator is based on NGINX which has [recently added support for UDP load balancing](https://www.nginx.com/blog/announcing-udp-load-balancing/) via [`upstream` groups](https://www.nginx.com/blog/tcp-load-balancing-udp-load-balancing-nginx-tips-tricks/#udpLB).

A brief inspection of the NGINX configuration on a Snapt server also reveals that these stream groups are written to `/etc/nginx/udp_upstreams` and `/etc/nginx/udp_servers`.

## Using the Snapt UI
To effectively "load balance" UDP services:
1. Verify Snapt server is running *at least* NGINX version 1.9.13 (`/usr/sbin/nginx -v`)
2. Ensure Snapt Accelerator has been installed (Modules & Plugins -> Add Plugins -> Snaptins)
3. Define upstreams for each UDP port (Accelerator -> UDP Upstreams)
4. Add backend servers for each upstream (Accelerator -> UDP Upstreams -> Servers button of active upstream -> Add server tab)
5. Define virtual IPs for each upstream (Accelerator -> UDP Servers -> Add Server tab)

## Adding in Bulk (Server)
Alternatively, these tasks may be done in bulk on the server via *heredocs*:
````
# Define upstreams with backend servers (UDP Upstreams)
cat <<EOF> /etc/nginx/udp_upstreams/service_53.conf
upstream service_53 {
  server host01.example.com:53;
  server host02.example.com:53;
  server host03.example.com:53;
  server host04.example.com:53;
}
EOF

cat <<EOF> /etc/nginx/udp_upstreams/service_137.conf
upstream service_137 {
  server host01.example.com:137;
  server host02.example.com:137;
  server host03.example.com:137;
  server host04.example.com:137;
}
EOF

# Define upstream virtual IPs (UDP Servers)
sudo cat<<EOF> /etc/nginx/udp_servers/service_53.conf
server {
  listen 127.0.0.2:53 udp;
  proxy_pass service_53;
}
EOF

sudo cat<<EOF> /etc/nginx/udp_servers/service_137.conf
server {
  listen 127.0.0.2:137 udp;
  proxy_pass service_137;
}
EOF
````

## Reload and test
When finished, **Reload Accelerator** and verify virtual IP binding on the server:
````
netstat -ln
udp        0      0 127.0.0.2:53       0.0.0.0:*
udp        0      0 127.0.0.2:137      0.0.0.0:*
````
