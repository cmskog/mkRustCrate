#!@bash@/bin/bash

source $utils

buildScript=
args=("$@")

for i in ${!args[@]}
do
    if [ "x${args[$i]::9}" = "xmetadata=" ]
    then
        args[$i]=metadata=$(crate_hash $out)
    elif [ "x${args[$i]::15}" = "xextra-filename=" ]
    then
        # TODO this causes rustc (?) to not generate the fingerprint,
        # then fail
        : # args[$i]=extra-filename=-$(crate_hash $out)
    elif [ "x${args[$i]}" = "x--crate-name" ] \
             && [ "x${args[$i+1]}" = "xbuild_script_build" ]
    then
        buildScript=1
    fi
done

if [ "$buildScript" ]
then
    depFlags+=" $buildDepFlags $BUILD_RUSTFLAGS"
fi

>&2 echo @cmd@ $depFlags "${args[@]}"

env @cmd@ $depFlags "${args[@]}"
