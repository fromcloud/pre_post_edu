#!/bin/bash

cat > $HOME/.cloudmonkey/config<<EOL
[core]
profile = server
asyncblock = true
paramcompletion = false
history_file = /root/.cloudmonkey/history
cache_file = /root/.cloudmonkey/cache
log_file = /root/.cloudmonkey/log

[ui]
color = true
prompt = ucloudbiz > 
display = json

[lb]
domain = /
username = admin
apikey = $1
url = https://api.ucloudbiz.olleh.com/loadbalancer/v1/client/api
expires = 600
secretkey = $2
timeout = 3600
password = password
verifysslcert = true

[server]
domain = /
username = admin
apikey = $1
url = https://api.ucloudbiz.olleh.com/server/v1/client/api
expires = 600
secretkey = $2
timeout = 3600
password = password
verifysslcert = true

[waf]
domain = /
username = admin
apikey = $1
url = https://api.ucloudbiz.olleh.com/waf/v1/client/api
expires = 600
secretkey = $2
timeout = 3600
password = password
verifysslcert = true

[nas]
domain = /
username = admin
apikey = $1
url = https://api.ucloudbiz.olleh.com/nas/v1/client/api
expires = 600
secretkey = $2
timeout = 3600
password = password
verifysslcert = true

[watch]
domain = /
username = admin
apikey = $1
url = https://api.ucloudbiz.olleh.com/watch/v1/client/api
expires = 600
secretkey = $2
timeout = 3600
password = password
verifysslcert = true

[package]
domain = /
username = admin
apikey = $1
url = https://api.ucloudbiz.olleh.com/packaging/v1/client/api
expires = 600
secretkey = $2
timeout = 3600
password = password
verifysslcert = true


[message]
domain = /
username = admin
apikey = $1
url = https://api.ucloudbiz.olleh.com/messaging/v1/client/api
expires = 600
secretkey = $2
timeout = 3600
password = password
verifysslcert = true


[autoscaling]
domain = /
username = admin
apikey = $1
url = https://api.ucloudbiz.olleh.com/autoscaling/v1/client/api
expires = 600
secretkey = $2
timeout = 3600
password = password
verifysslcert = true


[db]
domain = /
username = admin
apikey = $1
url = https://api.ucloudbiz.olleh.com/db/v1/client/api
expires = 600
secretkey = $2
timeout = 3600
password = password
verifysslcert = true

[cdn]
domain = /
username = admin
apikey = $1
url = https://api.ucloudbiz.olleh.com/cdn/v1/client/api
expires = 600
secretkey = $2
timeout = 3600
password = password
verifysslcert = true


EOL
