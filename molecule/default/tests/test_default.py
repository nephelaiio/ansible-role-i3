import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_command(host):
    assert host.command('i3 --version').rc == 0
    assert host.command('pactl --version').rc == 0
    assert host.command('Xorg -version').rc == 0
