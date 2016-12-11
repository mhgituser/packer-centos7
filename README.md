# Build A CentOS Box

Build a CentOS 7 box using packer, virtualbox, vagrant.

Learn about these tools, and install them on your PC.

- [Virtualbox](http://www.virtualbox.org)
- [Vagrant](http://www.vagrantup.com)
- [Packer](http://www.packer.io)

After cloning this repo, drop a CentOS ISO into the `build` directory.  You may
already have one, or you may pull one off the net, for example:
```
% mkdir build
% cd build
% curl -O http://linux.mirrors.es.net/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1511.iso
```

A list of CentOS mirrors is at http://isoredirect.centos.org/centos/7/isos/x86_64/

Then simply build the box (it will be dropped in `build` directory).
```
% packer build centos7.json
```

The resulting box is minimal, with the addition of
- Virtualbox Guest Additions (used by vagrant), and
- puppet (for configuration).

This box will be added into your vagrant installation when you bring up your first instance using the Vagrantfile.
```
% vagrant up
```

Once the box is up, you can log into it:
```
% vagrant ssh
```
