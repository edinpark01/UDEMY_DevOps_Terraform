# VPC
On Amazon AWS, we have a default VPC (Virtual Private Network). It is like having your own network in the cloud.
Its is completely isolated from any other AWS client's VPC.

<b>NOTES:</b><br>
* An instance launched in one VPC can never communicate with an instance in an other VPC using their private IP addresses
    *   They could communicate still, but using their public IP (<b>not recommended</b>)
    *   You could also link 2 VPC - called peering
    
* Every availability zone (DATA CENTRE) has its own <b>public</b> and <b>private</b> subnet.
* All the public subnets are connected to an <b>Internet Gateway</b>. These instances will also have a public id address, allowing them to be reachable from the internet
* Instances launched in the private subnets don't get a public IP address, so they will not be reachable from the internet
* Instances from main-public can reach from main-private, because they are all in the same VPC. This ofcourse if you set the firewall to allow traffic from one to another. 
* Tipically:
    *   Use the public subnets for internet facing services/applications
    *   Use the private subnets for databases, caching services and backends
* If you use a Load Balancer (LB), you will typically put the LB in the public subnets and the instances serving an application in the private subnets. 
