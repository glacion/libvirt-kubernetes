# Part 0: Host setup

## Dependencies

These are the list of packages that are necessary in an Arch Linux setup.
Other distributions may package these with a different name.

* `python3`: Ansible and optionally testinfra
* `kubectl helm helm-diff`: Interacting with the cluster
* `libvirt` `qemu`: Running the virtual servers
* `packer`: Creating the base image with kubernetes
* `terraform`: Automating deployments
* `mkisofs`: Needed for creating an image for `cloud-init`,
details and alternative tools are available at [here](https://www.packer.io/plugins/builders/qemu),
look for the `CD configuration` section.
* `vagrant`: Optional dependency for developing ansible roles.

## Configuration

### User Access

You might want to use your default user for accessing libvirt, you should add your user to the `libvirt` group.
Create the group if it does not exist.
You might also need to set `LIBVIRT_DEFAULT_URI="qemu:///system"` in your environment variables.

### Domain Setup

To reach the VMs with their hostnames, you need to add `libvirt_guest` to `/etc/nsswitch.conf`,
an example configuration file is as follows

```
hosts: libvirt_guest files myhostname dns
```

see [Arch Wiki](https://wiki.archlinux.org/title/libvirt) and [Libvirt Documentation](https://libvirt.org/nss.html)

### Volume Pool

The default volume pool adds VMs and images to `/var/lib/libvirt/images`,
If you do not have this pool you should create it by adding the following to a file,
For this example I will add them to `default.xml`.

```xml
<pool type="dir">
  <name>default</name>
  <target>
    <path>/var/lib/libvirt/images</path>
  </target>
</pool>
```

Then create the pool

```shell
virsh pool-define default.xml
virsh pool-autostart default
virsh pool-start default
```

For different kinds of pools consult to [Libvirt Documentation](https://libvirt.org/formatstorage.html#example-configuration)


