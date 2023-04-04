data "aws_security_group" "sg1" {
  name = "default"
  id = "sg-04ddd59286c754bfb" 
}



resource     "aws_instance" "demo1" {
    ami            = "ami-04581fbf744a7d11f"
    instance_type  = "t2.micro"

    vpc_security_group_ids =  [data.aws_security_group.sg1.id]
    key_name       = "dev-wdp"
    user_data = file("${path.module}/postgresql.sh")
    tags = {
      "Name"       = "postgresql-server"
      "env"        = "dev"

  }
}