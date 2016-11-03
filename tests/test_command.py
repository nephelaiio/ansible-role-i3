from testinfra.utils.ansible_runner import AnsibleRunner


testinfra_hosts = \
    AnsibleRunner('.molecule/ansible_inventory').get_hosts('test')


def test_command(Command):
    assert Command('i3 --version').rc == 0
    assert Command('pactl --version').rc == 0
    assert Command('Xorg -version').rc == 0
