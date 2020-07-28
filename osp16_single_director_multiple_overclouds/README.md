#### About
This directory contains a set of templates to support a multiple Overcloud 
deployment from the same Undercloud. These templates were tested on RHOSP 16.0.2
where this Undercloud feature is offered as a tech preview, however full support
for multi-stack and multi overcloud deployments are expected on RHOSP 16.1.

For more information in deploying multiple Overclouds from the same overcloud refer
to the [Red Hat OpenStack Platform 16.0: Director Installation and Usage: Chapter 10: Deploying Multiple Overclouds.](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.0/html/director_installation_and_usage/deploying-multiple-overclouds)

#### Overcloud Features in Templates
- Multi Overcloud Cloud Support
- Network Isolation
- Predictable Hostnames
- Predictable Host IP Addreses
- Predictable VIPS
- Encrypted External API Endpoints
- Glance with NFS integration
- Cinder with NFS integration
- Automated Satellite Registration 


#### Directory structure
```
node-registration-dev-cloud.json
node-registration-prod-cloud.json
├ dev_cloud
│   ├ scripts
│   └ templates
│       ├ environments
│       └ network_interface_templates
└ prod_cloud
    ├ scripts
    └ templates
        ├ environments
        └ network_interface_templates
```

#### Important Notes
- Deploying multiple clouds using customized service maps do not work with TLS-Everywhere yet.
There is an upstream bug filed for this: https://bugs.launchpad.net/tripleo/+bug/1888388
- The Undercloud shares the provisioning network between the Overclouds. Take this into consideration when allocating
fixed ip addresses to the VIPs and Overcloud hosts in the ctlplane network.
- The provisioning network can be extended  as the Undercloud supports the use of routed-l3 provisioning networks 
this however was not tested with these templates and does require additional configuration in the Undercloud 
configuration as well as the network infrastructure.
