provider "aws" {
  region      = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.ssh.name}"]
  key_name      = "${aws_key_pair.public.key_name}"
  connection {
    user        = "ubuntu"
    //private_key = "${file("terraform_aws_key.pem")}"
    private_key = "${file("~/.ssh/terraform_aws_key")}"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo docker --version",
      "lsb_release",
      "ls -la",
      "ls -la .ssh"
    ]
  }
}
