resource "aws_launch_configuration" "web" {
  name_prefix = "web-"
image_id = "$ami_id" 
  instance_type = "$instance_type"
  key_name = "$ec2key"
security_groups = [ "${aws_security_group.Prodsg.id}" ]
  associate_public_ip_address = true
  user_data = "${file("data.sh")}"
lifecycle {
    create_before_destroy = true
  }
}