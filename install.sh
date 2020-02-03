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

# verify requirements
requirements=(ansible-playbook git)
for r in ${requirements[@]}; do
    if ! r_path=$(type -p $r); then
        echo "$r executable not found in path, aborting"
        exit $KO
    fi
done

# create temp dir
tmpdir="$(mktemp -d -t rxvt-unicode-XXXXXXXXXX)"

# install role locally
pushd $tmpdir
git clone -q $git_clone_url
pushd $(basename $git_clone_url .git)/install
ansible-playbook --connection=local -i inventory playbook.yml
popd
popd

# purge temp files
rm -rf $tmpdir
exit $OK
