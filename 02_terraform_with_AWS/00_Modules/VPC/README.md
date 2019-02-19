# VPC Module
###### VPC from AWS console: 
A VPC is an isolated portion of the AWS cloud populated by AWS objects, such as Amazon EC2 instances. <br>
1. You must specify an IPv4 address range for your VPC.
    *   Specify the IPv4 address range as a Classless Inter-Domain Routing (CIDR) Block;
        * For exemple: 10.0.0.0/16
    *   You CANNOt specify an IPv4 CIDR block larger than /16
    *   You can optionally associate an Amazon-provided IPv6 CIDR block with the VPC


```
# Internet VPC - MAIN resource
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  tags {
    Name = "main"
  }
}
```


###### Subnet from AWS console:
Specify your subnet's IP address block in CIDR format. IPv4 block sizes must be between a /16 netmask and /28 netmask, and can be the same sze as your VPC.

The main subnet attribute that distinguishes wether a subnet is private/public facing is "map_public_ip_on_launch".    
```
# PUBLIC
resource "aws_subnet" "main-public-1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = "${aws_vpc.main.id}"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-a"

  tags {
    Name = "main-public-1"
  }
}

# PRIVATE
resource "aws_subnet" "main-private-1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = "${aws_vpc.main.id}"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-a"

  tags {
    Name = "main-private-1"
  }
}

```


###### Internet Gateway from AWS console:
An internet gateway is a virtual router that connects a VPC to the internet. To create a new internet gateway specify the name for the gateway.

```
# Internet Gateway
resource "aws_internet_gateway" "main-gateway" {
  vpc_id = "${aws_vpc.main.id}"
  
  tags {
    Name = "main"
  }
}
```
 
 
###### Route Tables & Associations from AWS console:
A route table specifies how packets are forwarded between the subnets within your VPC, the internet, and your VPN connection 

 ```
 # Route Tables
resource "aws_route_table" "" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main-gateway.id}"
  }

  tags {
    Name = "main-public-1"
  }
}

# Route associations - public
resource "aws_route_table_association" "main-public-1-a" {
  route_table_id = "${aws_route_table.main-public.id}"
  subnet_id      = "${aws_subnet.main-public-1.id}"
}
 ```
 
### Attributes Reference
<b>FROM Terraform Documentation:</b><br>
<hr> 

| Argument | Description |
| --- | --- |
| tags | (Optional) - A mapping of tags, each pair of which must exactly match a pair on the desired VPC |


| Attribute | Description |
| --- | --- |
| cidr_block | (Optional) The cidr block of the desired VPC |
| instance_tenancy | The allowed tenancy of instances lauched into the selected VPC. May be any of "default", "dedicated", or "host" |
| enable_dns_hostnames | Whether or not the VPC has DNS hostname support |
| enable_classiclink | If enabled - you can associate CIDR blocks from the 10.0.0.0/16 and 10.1.0.0/16 ranges, but you cannot associate any other CIDR block from the 10.0.0.0/8 range - EC2 Classic |

### VPC Diagram
<hr> 

*   VPC CIDR_BLOCK: 10.0.0.0/16
    *   Public Subnet:
        *   10.0.1.0/24 - Avaialbility Zone: us-east-1a
        *   10.0.2.0/24 - Avaialbility Zone: us-east-1b
        *   10.0.3.0/24 - Avaialbility Zone: us-east-1c
    *   Private Subnet:
        *   10.0.4.0/24 - Avaialbility Zone: us-east-1a
        *   10.0.5.0/24 - Avaialbility Zone: us-east-1b
        *   10.0.6.0/24 - Avaialbility Zone: us-east-1c
        

      
