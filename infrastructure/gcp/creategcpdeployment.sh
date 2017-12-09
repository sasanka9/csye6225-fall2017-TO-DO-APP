gcloud deployment-manager deployments create my-igm \
    --template vm_template.jinja

gcloud beta bigtable instances create csye6225-instance --cluster=csye6225-cluster --cluster-zone=us-central1-b --instance-type=PRODUCTION --cluster-num-nodes=3 --cluster-storage-type=SSD --description=csye6225-instance
echo -e "instance = csye6225-instance" > ~/.cbtrc
cbt createtable csye6225-table 10,20
cbt createfamily csye6225-table cf1
cbt -project gcloud-csye6225-cloud -instance csye6225-instance setgcpolicy csye6225-table cf1 maxage=0.33dh