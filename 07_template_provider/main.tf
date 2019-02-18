#    The template provider can help creating "customized configuration files"
#    You can build templates based on variables from terraform resource attributes ( e.g. a public IP address )
#    The result is a string that can be used as a variable in terraform
#      * The string contains a template ( e.g. a configuration file )
#    This process can be used to create generic templates or cloud init configs

#   1.  Create a template file
#
#       |   #!/bin/bash
#       |   echo "database-ip = ${myip}" >> /etc/myapp.config

#   2.  Create a template_file resource that will read the template file and replate ${myip} with the IP address of an
#       AWS instance created by terraform
data "template_file" "template_file_script" {
  template = "${file("template_file.sh")}"

  vars {
    myip = "${aws_instance.database1.private_ip}"
  }
}

#   3. Then tou can use the my-template resource when creating a new instance
resource "aws_instance" "web_server" {
  ami = "AMI_ID"
  instance_type = "INSTANCE_TYPE"
  # ...

  user_data = "${data.template_file.template_file_script.rendered}"
}

#   4.  When terraform runs, it will see that it first needs to spin up the database1 instance
#         a.  Generate the template
#         b.  Only than it will spin up the web_server instance
#   5.  The web_server instance will have the template injected in the user_data and when it lauches:
#         a.  The user-data will create a file /etc/myapp.config with the IP address of the database
