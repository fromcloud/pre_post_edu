#!/bin/bash

export ST_AUTH=https://api.ucloudbiz.olleh.com/storage/v1/auth
swift -A $ST_AUTH -U $1 -K $2 delete --all
