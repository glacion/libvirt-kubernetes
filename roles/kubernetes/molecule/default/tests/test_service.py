from testinfra.modules.service import Service
from testinfra.modules.socket import Socket


def test_qemu_guest_agent_service(host):
    it: Service = host.service("qemu-guest-agent")

    assert it.is_valid
    assert it.is_enabled
    assert it.is_running


def test_containerd_service(host):
    it: Service = host.service("containerd")

    assert it.is_valid
    assert it.is_enabled
    assert it.is_running


def test_containerd_socket(host):
    with host.sudo():
        it: Socket = host.socket("unix:///run/containerd/containerd.sock")

    assert it.is_listening


def test_containerd_stress(host):
    with host.sudo():
        it = host.run("containerd-stress")

    assert it.succeeded
