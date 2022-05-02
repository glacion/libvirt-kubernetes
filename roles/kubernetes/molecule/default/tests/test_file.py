from typing import Set

import pytest
from testinfra.modules.file import File

executables: Set[str] = {
    "/opt/cni/bin/bandwidth",
    "/opt/cni/bin/bridge",
    "/opt/cni/bin/dhcp",
    "/opt/cni/bin/firewall",
    "/opt/cni/bin/host-device",
    "/opt/cni/bin/host-local",
    "/opt/cni/bin/ipvlan",
    "/opt/cni/bin/loopback",
    "/opt/cni/bin/macvlan",
    "/opt/cni/bin/portmap",
    "/opt/cni/bin/ptp",
    "/opt/cni/bin/sbr",
    "/opt/cni/bin/static",
    "/opt/cni/bin/tuning",
    "/opt/cni/bin/vlan",
    "/opt/cni/bin/vrf",
    "/usr/local/bin/containerd",
    "/usr/local/bin/containerd-shim",
    "/usr/local/bin/containerd-shim-runc-v1",
    "/usr/local/bin/containerd-shim-runc-v2",
    "/usr/local/bin/containerd-stress",
    "/usr/local/bin/ctr",
    "/usr/local/bin/crictl",
    "/usr/local/bin/critest",
    "/usr/local/bin/etcd",
    "/usr/local/bin/etcdctl",
    "/usr/local/bin/kubeadm",
    "/usr/local/bin/kubectl",
    "/usr/local/bin/kubelet",
    "/usr/local/bin/nerdctl",
    "/usr/local/sbin/runc",
}


@pytest.mark.parametrize("executable", executables)
def test_executables(host, executable):
    it: File = host.file(executable)

    assert it.exists
    assert it.user == "root"
    assert it.group == "root"
    assert it.mode == 0o755
