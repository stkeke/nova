#!/bin/bash

set -x
vncserver -kill :1
vncserver

sudo rm -rf /var/run/libvirt
sudo ln -sf /opt/stack/local/libvirt/var/run/libvirt /var/run/

sudo umount /sys/fs/resctrl
sudo mount -t resctrl resctrl /sys/fs/resctrl
sleep 1
sudo su -c "echo 'L3:0=700;1=700
MB:0=100;1=100' > /sys/fs/resctrl/schemata"

   sudo systemctl restart systemd-journald
   sudo /bin/systemctl restart openvswitch
   sudo /bin/systemctl restart httpd
   sudo /bin/systemctl restart iscsid
   sudo /bin/systemctl restart libvirtd
   sudo /bin/systemctl restart virtlogd
   sudo /bin/systemctl restart mariadb
   sudo /bin/systemctl restart memcached
   sudo /bin/systemctl restart lvm2-lvmetad

        sudo systemctl restart devstack@c-api.service
        sudo systemctl restart devstack@c-sch.service
        sudo systemctl restart devstack@c-vol.service
        sudo systemctl restart devstack@g-api.service
        sudo systemctl restart devstack@g-reg.service
        sudo systemctl restart devstack@keystone.service
        sudo systemctl restart devstack@n-api-meta.service
        sudo systemctl restart devstack@n-api.service
        sudo systemctl restart devstack@n-cond-cell1.service
        sudo systemctl restart devstack@n-cpu.service
        sudo systemctl restart devstack@n-novnc-cell1.service
        sudo systemctl restart devstack@n-sch.service
        sudo systemctl restart devstack@n-super-cond.service
        sudo systemctl restart devstack@placement-api.service
        sudo systemctl restart devstack@q-agt.service
        sudo systemctl restart devstack@q-dhcp.service
        sudo systemctl restart devstack@q-l3.service
        sudo systemctl restart devstack@q-meta.service
        sudo systemctl restart devstack@q-svc.service


set +x
