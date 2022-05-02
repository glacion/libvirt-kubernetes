from typing import Set, Tuple

import pytest

parameters: Set[Tuple[str, str | int]] = {
    ("net.ipv6.conf.all.forwarding", 1),
    ("net.ipv4.ip_forward", 1),
    ("kernel.keys.root_maxbytes", 25000000),
    ("kernel.keys.root_maxkeys", 1000000),
    ("kernel.panic", 10),
    ("kernel.panic_on_oops", 1),
    ("vm.overcommit_memory", 1),
    ("vm.panic_on_oom", 0),
    ("net.bridge.bridge-nf-call-ip6tables", 1),
    ("net.bridge.bridge-nf-call-iptables", 1),
}


@pytest.mark.parametrize("parameter,value", parameters)
def test_sysctl_parameters(host, parameter, value):
    assert host.sysctl(parameter) == value
