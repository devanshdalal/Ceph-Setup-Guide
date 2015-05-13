This directry contains the basic scripts to setup ceph distributed storage cluster on the local lab kind of topology 

All these scripts must be executed from the admin node(ceph's admin node) only.

Always ensure that the admin node have password-less ssh and sudo access to the remote host.  

The function copy_id copy's the ssh keys to the remote host which we want to include in our cluster.

Each script from genOSD.sh, remOSD.sh, genMDS.sh, remMDS.sh etc provide the basic functionality of adding or removing OSDs or MDS.

#######################################################################################

Basic step to install ceph on all nodes.

1.  copy_id copies the ssh to the required host
2.  then run put.sh with the host name as arguement which will copy the required packages to the target node and install ceph and ceph dploy. 

##################################################################################################################################################################

The below mentioned scripts like addOSD.sh,  remOSD.sh, genMon.sh, addMds.sh, remMon.sh, remMds.sh, addCleint.sh etc add or removes the OSD , Mds server, moniter or client nodes to/from the existing cluster while the other files are mostly run only once during the setup of cluster.

After installing cep on all the initial nodes and cep-deploy on one of the nodes the following steps(1-5) need to be performed to start the initial cluster:

1. navigate to the directory where you want to store cep conf files
2. cep-deploy new <name of initial monitor node>
3. edit the cep.conf file add the following line
		osd pool default size = 2
		public network = {ip-address}/{netmask}
4. ceph-deploy mon create-initial
5. ceph-deploy admin <name of all the initial nodes>
      e.g. ceph-deploy admin gowla vanaspati champak
6. 
   ssh node2
   sudo mkdir /var/local/osd0
   exit

   ssh node3
   sudo mkdir /var/local/osd1
   exit
7. ceph-deploy osd prepare node2:/var/local/osd0 node3:/var/local/osd1
8. ceph-deploy osd activate node2:/var/local/osd0 node3:/var/local/osd1
9. sudo chmod +r /etc/ceph/ceph.client.admin.keyring

Note: Although steps after 6 can be done using the addOSD script but it is advisable to do them manually as mentioned above for the first time.

In step 6, we are just creating 2 directories for the shared directries on the node2 and node3.

###########################################################################################################

USAGE:

./copy_id $HOST

./put.sh $HOST
# put the required packages and their dependencies on the $HOST and installs ceph and ceph-mds packages on it.

./genOSD $HOST
# deploys the ceph osd and creates the directry /var/local/osd shared for distributed storage .

./remOSD $HOST
# removes the ceph osd from the cluster [Ensure the the current host is a part of ceph's osdtree] .

./addMDS $HOST
# adds the MDS server on the host

./remMDS $HOST
# removes the MDS server from the host 


####################################################################################################