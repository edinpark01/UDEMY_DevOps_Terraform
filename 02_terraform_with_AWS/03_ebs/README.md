# EBS - Elastic Block Storage

From AWS
> Amazon Elastic Block Store (Amazon EBS) provides persistent block storage volumes for use with Amazon EC2
> Instances in the AWS Cloud. Each Amazon EBS volume is automatically replicated within its Availability Zone to
> protect you from complete failure, offering high availability and durability. Amazon EBS volumes offer the 
> consistent low-latency performance needed to run your workloads. 
> <br>With Amazon EBS, you can scale your usage up or down within minutes - all while paying a low price for only
> what you provision. 
> <br><br>Amazon EBS is designed for application workloads that benefit from fine tuning for performance, cost and 
> capacity. 
> <br><br>Typical yse cases include 
> * Big Data analytics engines:
>  * Hadoop Ecosystems
>  * HDFS Ecosystems
>  * Amazon EMR Clusters
> * Releational and NoSQL databases:
>  * Microsoft SQL Server
>  * MySQL, or Cassandra
>  * MongoDB
> * Stream and log processing applications:
>  * Kafka 
>  * Splunk
> * Data Warehousing Applications
>  * Vertica 
>  * Teradata


* The t2. micro instance with this particular AMI automatically adds 10 GB of EBS storage.

Some instance types have local storage on the instance itself
* This is called ephemeral storage
* This type of storage is always lost when the instance terminates

The 10 GB EBS root volume storage that comes with the instance is also set to be automatically removed when the instance 
is terminated.
* You could still instruct AWS not to do so, but that would be counter-intuitive.

In most cases the 10 GB for the OS (root block device) suffices.

### Extra / Persistent EBS storage volume
In this example we are exploring adding an extra EBS storage volume
* Extra volumes can be used for the log files, any real data that is put on the instance. 
* That data will be persisted until you instruct AWS to remove it. 
* <b>EBS Storage</b> can be added using a terraform resource and then attached to out instance.  