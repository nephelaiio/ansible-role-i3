#!/usr/bin/env bash

git_clone_url=https://github.com/nephelaiio/ansible-role-i3.git
OK=0
KO=1

# redefine pushd/popd
# see: https://stackoverflow.com/questions/25288194/dont-display-pushd-popd-stack-across-several-bash-scripts-quiet-pushd-popd
pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

# usage helper
function help {
    echo "$0 OPTIONS [ANSIBLE ARGUMENTS]"
    echo
    echo "OPTIONS:"
    echo "   [--local]"
}

# parse options
# see https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
POSITIONAL=()
while [[ $# -gt 0 ]]
do
    key="$1"

    case $key in
        --local)
            LOCAL=$OK
            shift # past argument
            ;;
        *)    # unknown option
            POSITIONAL+=("$1") # save it in an array for later
            shift # past argument
            ;;
    esac
done

# verify requirements
requirements=(ansible-playbook git)
for r in ${requirements[@]}; do
    if ! r_path=$(type -p $r); then
        echo "$r executable not found in path, aborting"
        exit $KO
    fi
done

# create temp dir
tmpdir="$(mktemp -d)"

# perform local role install
if [ -z "${LOCAL}" ]; then
    git clone -q $git_clone_url $tmpdir
else
    cp -a . $tmpdir
fi
pushd $tmpdir/install
if [ -f ../requirements.yml ]; then
    ansible-galaxy install -r ../requirements.yml --force
fi
ansible-playbook --become --connection=local -i inventory playbook.yml -t install
ansible-playbook --connection=local -i inventory playbook.yml ${POSITIONAL[@]}
popd

# purge temp files
rm -rf $tmpdir
exit $OK
