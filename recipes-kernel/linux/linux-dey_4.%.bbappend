# Enable IPTABLES, IP Maquerade and Aync PPP to kernel configuration


# Prepend to existing PATH 
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# apply kernel fragment for iptables & masquerade support
SRC_URI += "file://iptables_masq.cfg"

# apply kernel fragment for Async PPP support
SRC-URI += "file://ppp_async.cfg"

# statically link FTDI SIO support into kernel (default is kernel module) 
#SRC_URI += "file://ftdi_sio.cfg"

# Per the Yocto documentation the below should not be necessary. 
# Without it, however, the above fragments are not applied. 
do_configure_append() {
   cat ${WORKDIR}/*.cfg >> ${B}/.config
}
