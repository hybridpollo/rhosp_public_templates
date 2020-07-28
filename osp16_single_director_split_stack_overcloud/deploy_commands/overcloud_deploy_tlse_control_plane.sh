#!/usr/bin/env bash 
#
###################################################                                                               
# Variables
###################################################                                              
THT_DEFAULT="/usr/share/openstack-tripleo-heat-templates"
THT_CUSTOM="/home/stack/overcloud_deployment/templates"
RC_FILE="/home/stack/stackrc"
STACK_NAME="vxyz-labs-central"

if [[ $USER != "stack" ]]; then
  echo -e "ERROR: Deploy script  must be run as the stack user."
  exit 1
fi 

echo "Running the overcloud deployment for stack: ${STACK_NAME}."

if test -f "${RC_FILE}" ; then  
  source ${RC_FILE}
  cd /home/stack
else
  echo -e "Undercloud environment file: ${RC_FILE} does not exist!"
  exit 1
fi

###################################################                                                               
# Deploy 
###################################################    

openstack overcloud deploy --stack ${STACK_NAME} \
  --templates \
  -e ${THT_DEFAULT}/environments/network-isolation.yaml \
  -e ${THT_DEFAULT}/environments/services/neutron-ovn-dvr-ha.yaml \
  -e ${THT_DEFAULT}/environments/ssl/enable-internal-tls.yaml \
  -e ${THT_DEFAULT}/environments/ssl/tls-everywhere-endpoints-dns.yaml \
  -r ${THT_CUSTOM}/common/roles_data.yaml \
  -n ${THT_CUSTOM}/common/network_data.yaml \
  -e ${THT_CUSTOM}/common/environments/network_environment.yaml \
  -e ${THT_CUSTOM}/common/container_image_prepare.yaml \
  -e ${THT_CUSTOM}/common/global_node_customizations.yaml \
  -e ${THT_CUSTOM}/common/first_boot.yaml \
  -e ${THT_CUSTOM}/common/environments/tls_endpoints.yaml \
  -e ${THT_CUSTOM}/common/environments/inject_trust_anchor.yaml \
  -e ${THT_CUSTOM}/common/environments/enable_tls.yaml \
  -e ${THT_CUSTOM}/common/environments/glance_nfs.yaml \
  -e ${THT_CUSTOM}/common/environments/cinder_nfs.yaml \
  -e ${THT_CUSTOM}/common/environments/ssh_banner.yaml \
  -e ${THT_CUSTOM}/common/environments/disable_telemetry.yaml \
  -e ${THT_CUSTOM}/common/environments/disable_panko.yaml \
  -e ${THT_CUSTOM}/common/environments/disable_swift.yaml \
  -e ${THT_CUSTOM}/common/satellite_registration.yaml \
  -e ${THT_CUSTOM}/control_plane/predictable_ip_addresses_controller.yaml \
  -e ${THT_CUSTOM}/control_plane/predictable_hostnames_controller.yaml \
  -e ${THT_CUSTOM}/control_plane/overrides.yaml