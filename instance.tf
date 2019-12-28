resource "aws_instance" "es" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # user data
  user_data = data.template_cloudinit_config.cloudinit-es.rendered
}

resource "aws_network_interface_sg_attachment" "allow-ssh_attachment" {
  security_group_id    = "${aws_security_group.allow-ssh.id}"
  network_interface_id = "${aws_instance.es.primary_network_interface_id}"
}
