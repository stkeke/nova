#!/bin/bash

source /opt/stack/devstack/openrc admin demo

flavor_name="rdt.numa"
openstack flavor delete $flavor_name
openstack flavor create --vcpus 10 --ram 128 $flavor_name
openstack flavor set --property hw:cpu_sockets=2 --property hw:cpu_cores=5 --property hw:cpu_threads=1 $flavor_name
openstack flavor set --property "hw:numa_nodes=2" --property "hw:numa_cpus.0=0-3" --property "hw:numa_cpus.1=4-9" $flavor_name
openstack flavor set --property "hw:numa_mem.0=64" --property "hw:numa_mem.1=64" $flavor_name
openstack flavor set --property "hw:numa_cache.0=2" --property "hw:numa_cache.1=4" $flavor_name
openstack flavor set --property "hw:cpu_policy=dedicated" $flavor_name
openstack flavor show $flavor_name

