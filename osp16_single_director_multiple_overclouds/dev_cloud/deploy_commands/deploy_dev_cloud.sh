#!/usr/bin/env bash 
#
###################################################                                                               
# Variables
###################################################                                              
THT_DEFAULT="/usr/share/openstack-tripleo-heat-templates"
THT_CUSTOM_TEMPLATES="/home/stack/overcloud_deployment/dev_cloud/templates"
THT_STACK_NAME="dev-overcloud"
RC_FILE="/home/stack/stackrc"

if [[ $USER != "stack" ]]; then
  echo -e "ERROR: Deploy script  must be run as the stack user."
  exit 1
fi 

echo "Running the overcloud deployment for stack: ${THT_STACK_NAME}"

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

openstack overcloud deploy --stack ${THT_STACK_NAME} --templates \
  -r ${THT_CUSTOM_TEMPLATES}/roles_data.yaml \
  -n ${THT_CUSTOM_TEMPLATES}/network_data.yaml \
  -e ${THT_DEFAULT}/environments/network-isolation.yaml \
  -e ${THT_DEFAULT}/environments/services/neutron-ovn-dvr-ha.yaml \
  -e ${THT_DEFAULT}/environments/ssl/tls-endpoints-public-dns.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/container_image_prepare.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/node_info.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/customizations.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/first_boot.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/environments/network_environment.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/predictable_ip_addresses.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/predictable_hostnames.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/environments/tls_endpoints.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/environments/enable_tls.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/environments/glance_nfs.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/environments/cinder_nfs.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/environments/ssh_banner.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/environments/disable_telemetry.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/environments/disable_panko.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/environments/disable_swift.yaml \
  -e ${THT_CUSTOM_TEMPLATES}/satellite_registration.yaml 
