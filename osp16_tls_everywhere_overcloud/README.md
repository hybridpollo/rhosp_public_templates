#### About
This directory contains a set of templates to support TLS Encryption 
on both Public and Internal OpenStack Endpoints. 

#### Note

For more information in deploying the TLS Everywhere feature in your Overcloud refer
to the [Red Hat OpenStack Platform 16.1: Advanced Overcloud Customization: Chapter 15: Enabling SSL/TLS On Internal and Public Endpoints with Identity Management.](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.1/html/advanced_overcloud_customization/sect-enabling_internal_ssltls_on_the_overcloud)

#### Overcloud Features in Templates
- Network Isolation
- Predictable Hostnames
- Predictable Host IP Addreses
- Predictable VIPS
- Encrypted External API Endpoints
- Encrypted Internal API Endpoints
- Glance with NFS integration
- Cinder with NFS integration
- Automated Satellite Registration 


#### Directory structure
```
├── deploy_commands
│   └── overcloud_deploy_tls_everywhere.sh
├── node-registration.json
├── README.md
└── templates
    ├── container_image_prepare.yaml
    ├── customizations.yaml
    ├── environments
    │   ├── cinder_nfs.yaml
    │   ├── disable_panko.yaml
    │   ├── disable_swift.yaml
    │   ├── disable_telemetry.yaml
    │   ├── enable_tls.yaml
    │   ├── glance_nfs.yaml
    │   ├── inject_trust_anchor.yaml
    │   ├── network_environment.yaml
    │   ├── ssh_banner.yaml
    │   ├── tls_endpoints.yaml
    │   └── userdata.yaml
    ├── first_boot.yaml
    ├── network_data.yaml
    ├── network_interface_templates
    │   ├── compute.yaml
    │   └── controller.yaml
    ├── node_info.yaml
    ├── predictable_hostnames.yaml
    ├── predictable_ip_addresses.yaml
    ├── roles_data.yaml
    └── satellite_registration.yaml
```

#### Important Notes
- Requires a  [Red Hat Identity Management Server](https://access.redhat.com/products/identity-management). 