import pytest

VIRTUAL_IP = "192.168.121.200"
PORT = 80


@pytest.mark.parametrize("_", range(32))
def test_virtual_ip(_, host):
    assert host.addr(VIRTUAL_IP).is_reachable
    assert host.addr(VIRTUAL_IP).port(PORT).is_reachable
