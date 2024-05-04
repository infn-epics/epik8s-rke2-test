#!/bin/sh
mount -o remount ,rw /
/etc/init.d/libera restart

variables=( "__IOC_PREFIX__" "__IOC_TOP__" "__IOC_NAME__" "__BPM1__" "__BPM2__" "__BPM3__" "__BPM4__")

# Loop through each variable
for var in "${variables[@]}"; do
    # Check if the variable is defined and non-empty
    if [ -n "${!var}" ]; then
        echo "patching $var ${!var}"
        # Use sed to replace the variable in the specified files
        sed -i "s|$var|${!var}|g" db/* *.cmd
    else
        echo "%%Warning no $var defined"
    fi
done

./st.cmd
