#!/bin/bash
sudo apt-get install -y apache2
cat > index.html <<EOF
<h1>Hello, World</h1>
<p>DB address: ${db_address}</p>
<p>DB port: ${db_port}</p>
EOF

nohup busybox apache2 -f -p ${server_port} &