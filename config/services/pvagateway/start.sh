#!/bin/sh
name=`hostname`
echo "Starting PVA Gateway $EPICS_CA_ADDR_LIST on $EPICS_GATEWAY_ADDR_LIST ($name)"
# -debug 1
CLIENT_NAME="$name"
#export EPICS_PVA_ADDR_LIST $EPICS_CA_ADDR_LIST
export EPICS_PVA_NAME_SERVERS $EPICS_CA_ADDR_LIST
# Generate JSON content
JSON_CONTENT=$(cat <<EOF
{
    "version": 2,
    "clients":[
        {
            "name":"$CLIENT_NAME",
            "autoaddrlist":false
        }
    ],
    "servers": [
        {
            "name": "$SERVER_NAME",
            "clients": ["$CLIENT_NAME"],
            "addrlist": "$EPICS_CA_ADDR_LIST",
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
