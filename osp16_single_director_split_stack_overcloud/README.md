#### About
This directory contains a set of templates to support an Overcloud 
deployment using split stacks. This scenario refers to deploying the OpenStack
Controllers and OpenStack Computes in separate stacks. These templates were tested on RHOSP 16.0.2
where this Undercloud feature is offered as a tech preview, however full support
for multi-stack and multi overcloud deployments are expected on RHOSP 16.1.

For more information in deploying multiple Overclouds from the same overcloud refer
to the [Red Hat OpenStack Platform 16.1: Director Installation and Usage: Chapter 10: Deploying Multiple Overclouds.](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.1/html/director_installation_and_usage/deploying-multiple-overclouds)

#### Overcloud Features in Templates
- Split Stack Deployment of Overcloud ( 1 x Controller Stack and 1 x Compute Stack)
- Network Isolation
- Predictable Hostnames
- Predictable Host IP Addreses
- Predictable OpenStack Endpoint High Availability Virtual IP Addresses
- Encrypted External API Endpoints
- Glance with NFS integration
- Cinder with NFS integration
- Automated Satellite Registration 
- Shared Provisioning Network Across Stacks


#### Directory structure
```
├── deploy_commands
│   ├── overcloud_deploy_tlse_compute_plane.sh
│   └── overcloud_deploy_tlse_control_plane.sh
├── network_details_split_stack_templates.txt
├── node-registration.json
├── README.md
└── templates
    ├── common
    │   ├── container_image_prepare.yaml
    │   ├── environments
    │   │   ├── cinder_nfs.yaml
    │   │   ├── disable_panko.yaml
    │   │   ├── disable_swift.yaml
    │   │   ├── disable_telemetry.yaml
    │   │   ├── enable_tls.yaml
    │   │   ├── glance_nfs.yaml
    │   │   ├── inject_trust_anchor.yaml
    │   │   ├── network_environment.yaml
    │   │   ├── ssh_banner.yaml
    │   │   ├── tls_endpoints.yaml
    │   │   └── userdata.yaml
    │   ├── first_boot.yaml
    │   ├── global_node_customizations.yaml
    │   ├── network_data.yaml
    │   ├── network_interface_templates
    │   │   ├── compute.yaml
    │   │   └── controller.yaml
    │   ├── roles_data.yaml
    │   └── satellite_registration.yaml
    ├── compute_plane
    │   ├── control-plane-export.yaml
    │   ├── overrides.yaml
    │   ├── predictable_hostnames_compute.yaml
    │   └── predictable_ip_addresses_compute.yaml
    └── control_plane
        ├── overrides.yaml
        ├── predictable_hostnames_controller.yaml
        └── predictable_ip_addresses_controller.yaml
```

#### Important Notes
- The Undercloud shares the provisioning network between the stacks. Take this into consideration when allocating
fixed ip addresses to the VIPs and Overcloud hosts in the ctlplane network.
- The provisioning network can be extended as the Undercloud supports the use of routed-l3 provisioning networks 
this however was not tested with these templates and does require additional configuration in the Undercloud 
configuration as well as the network infrastructure.
