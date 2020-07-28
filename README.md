## Redhat OpenStack Platform Deployment Templates

#### About this Repository
This repository contains a collection of Tripleo Heat templates 
used to test a few of the new features in Red Hat OpenStack Platform 16, 
in addition to serving as a collection of other general purpose deployment templates. 
Each top level directory represent a deployment template for a desired used case. 
Additional branches on this repository will also have a collection of templates for Red Hat 
OpenStack Platform 13.

These are some of the interesting deployment scenarios covered by these templates:
- Deploying Multiple Overclouds from a Single Overcloud
- Deploying the Overcloud using independent heat stacks for controllers, and compute nodes.
- Deploying the Overcloud using TLS encryption everywhere.

Additional information for each deployment template set can be found in the
README.md for each deployment scenario.

#### Important Notes
These templates were tested on RHOSP 16.0.2 where this Undercloud feature is offered as a tech   
preview, however full support for multi-stack and multi overcloud deployments are expected on RHOSP 16.1.
Features such as predictable IP addressing, hostnames, and TLS-Everywhere have been fully supported since RHOSP 13.

#### Documentation
- [Red Hat OpenStack Platform Documentation](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform)
- [Tripleo Upstream Documentation](https://docs.openstack.org/tripleo-docs/latest/)
