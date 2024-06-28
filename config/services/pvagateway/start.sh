#!/bin/sh
name=`hostname`
echo "Starting PVA Gateway ($name)"
# -debug 1
CLIENT_NAME="$name"
#export EPICS_PVA_ADDR_LIST $EPICS_CA_ADDR_LIST
# export EPICS_PVA_NAME_SERVERS=$EPICS_CA_ADDR_LIST
# Generate JSON content
JSON_CONTENT=$(cat <<EOF
{
    "version": 2,
    "clients":[
        {
            "name":"cam1",
            "addrlist": "plsparcgige001.lnf.infn.it:5175",
            "autoaddrlist":false
        },
         {
            "name":"cam2",
            "addrlist": "plsparcgige001.lnf.infn.it",
            "autoaddrlist":false
        }
    ],
    "servers": [
        {
            "name": "$SERVER_NAME",
            "clients": ["cam1","cam2"],
            "addrlist": "",
            "autoaddrlist": false,
            "statusprefix": "GW:STS:"
        }
    ]
}
EOF
)

# Output the JSON content to a file
echo "$JSON_CONTENT" > gateway_config.json

echo "Generated gateway_config.json:"

python3 -m p4p.gw --debug gateway_config.json
