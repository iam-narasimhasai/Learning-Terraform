resource "aws_instance" "web" {

  ami                    = var.imageid
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = ["${aws_security_group.sgone.id}"]
  #user_data              = file("${path.module}/file1.txt")

  # count = 2
  # tags = {
  #   Name = "${count.index} -  tf instance" //count
  # }

#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("${path.module}/id_rsa")

#     host = self.public_ip

#   }
#   provisioner "file" {
#     source      = "file1.sh"
#     destination = "/tmp/file1.sh"


#   }

#   provisioner "file" {
#     content     = "this is content for file2"
#     destination = "/tmp/file2.txt"


#   }

#   provisioner "local-exec" {
#     on_failure = continue
#     command = "env>env.txt"
#     environment = {
#       envname = "envvalue"
#     }
#     #command = "echo ${self.public_ip}  > /tmp/tmp.txt"
#   }

#   # provisioner "local-exec" {
#   #   working_dir = "/tmp"
#   #   interpreter = [ 
#   #     "/usr/bin/python3" , "-c"
#   #    ]
#   #   command = "print('HelloWorld')"
#   # }



#   provisioner "local-exec" {
#     when    = destroy
#     command = "echo 'at delete'"
#   }



# provisioner "remote-exec" {
#   when = create
#   inline = [ 
#     "echo 'hi this is from terraform' > /tmp/p.txt"

#    ]
# }

# # provisioner "remote-exec" {
# #   when = destroy
# #   script = "./file1.sh"
# # }

}

module "webserver" {
  source = "./module/webserver"
  imageid = "abcdasa"
  instance_type = "t2.medium"
}


