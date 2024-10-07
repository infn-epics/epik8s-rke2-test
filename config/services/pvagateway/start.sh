#!/bin/sh
name=`hostname`
echo "Starting PVA Gateway ($name)"
# -debug 1
CLIENT_NAME="$name"
#export EPICS_PVA_ADDR_LIST $EPICS_CA_ADDR_LIST
# export EPICS_PVA_NAME_SERVERS=$EPICS_CA_ADDR_LIST
# Generate JSON content
# JSON_CONTENT=$(cat <<EOF
# {
#     "version": 2,
#     "clients":[
#         {
#             "name":"cam1",
#             "addrlist": "cam01.eli.svc",
#             "autoaddrlist":false
#         },
#          {
#             "name":"cam2",
#             "addrlist": "cam02.eli.svc",
#             "autoaddrlist":false
#         }

#     ],
#     "servers": [

#         {
#             "name":"server192",
#             "clients":["cam1","cam2"],
#             "autoaddrlist":false,
#             "statusprefix":"GW:STS:"
#         }
#     ]
# }
# EOF
# )

JSON_CONTENT=$(cat <<EOF
{
    "version": 2,
    "clients":[
        {
            "name":"cameranet",
            "addrlist": "10.96.255.255",
            "autoaddrlist":false
        }

    ],
    "servers": [

        {
            "name":"server192",
            "clients":["cameranet"],
            "autoaddrlist":false,
            "statusprefix":"GW:STS:"
        }
    ]
}
EOF
)

# Output the JSON content to a file
echo "$JSON_CONTENT" > gateway_config.json

echo "Generated gateway_config.json:"
cat gateway_config.json
## -- debug
python3 -m p4p.gw gateway_config.json
