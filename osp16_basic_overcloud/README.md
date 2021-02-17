#### About
This directory contains a set of templates to support a basic OSP16 deployment
with encrypted Public API OpenStack Endpoints. 

#### Note

For more information in deploying the TLS Everywhere feature in your Overcloud refer
to the [Red Hat OpenStack Platform 16.1: Advanced Overcloud Customization Guide.](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/16.1/html/advanced_overcloud_customization/)

#### Overcloud Features in Templates
- Network Isolation
- Predictable Hostnames
- Predictable Host IP Addreses
- Predictable OpenStack Endpoint High Availability Virtual IP Addresses
- Encrypted External API Endpoints
- Glance with NFS integration
- Cinder with NFS integration


#### Directory structure
```
├── deploy_commands
│   └── overcloud_deploy.sh
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
    │   └── userdata.yaml
    ├── first_boot.yaml
    ├── network_data.yaml
    ├── network_interface_templates
    │   ├── compute.yaml
    │   └── controller.yaml
    ├── node_info.yaml
    ├── predictable_hostnames.yaml
    ├── predictable_ip_addresses.yaml
    └── roles_data.yaml

```

#### Important Notes
