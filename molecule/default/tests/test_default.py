import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_command(Command):
    assert Command('i3 --version').rc == 0
    assert Command('pactl --version').rc == 0
    assert Command('Xorg -version').rc == 0
