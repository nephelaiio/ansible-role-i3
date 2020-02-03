# nephelaiio.i3

[![Build Status](https://travis-ci.org/nephelaiio/ansible-role-i3.svg?branch=master)](https://travis-ci.org/nephelaiio/ansible-role-i3)
[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-systemd--service-blue.svg)](https://galaxy.ansible.com/nephelaiio/i3/)

An [ansible role](https://galaxy.ansible.com/nephelaiio/i3) to install and configure i3

## Local install

Execute the following from the command line shell

```
curl -s https://raw.githubusercontent.com/nephelaiio/ansible-role-rxvt-unicode/master/install.sh | bash
```

## Role Variables

```
i3_packages: None
```
Override list of installation packages for the target operating system - see [vars](/vars) files for distribution default values

```
i3_packages_state: present
```
The state of i3 packages
```
i3_conf_template: config
```
A jinja template to create the configuration
```
i3_conf_dir: ~/.config/i3
```
The path for generated i3 configuration
```
i3_conf_file: config
```
The filename for generated i3 configuration file

Please refer to the [defaults file](/defaults/main.yml) for an up to date list of input parameters.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```
    - hosts: servers
      roles:
         - role: i3
```

## Testing

Please make sure your environment has [docker](https://www.docker.com) installed in order to run role validation tests. Additional python dependencies are listed in the [requirements file](https://github.com/nephelaiio/ansible-role-requirements/blob/master/requirements.txt)

Role is tested against the following distributions (docker images):
  * Ubuntu Bionic
  * Ubuntu Xenial
  * Archlinux

You can test the role directly from sources using command ` molecule test `

## License

This project is licensed under the terms of the [MIT License](/LICENSE)
