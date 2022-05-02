from testinfra.modules.service import Service


def test_qemu_guest_agent_service(host):
    it: Service = host.service("qemu-guest-agent")

    assert it.is_valid
    assert it.is_enabled


def test_containerd_service(host):
    it: Service = host.service("containerd")

    assert it.is_valid
    assert it.is_enabled


def test_kubelet_service(host):
    it: Service = host.service("kubelet")

    assert it.is_valid
    assert it.is_enabled
