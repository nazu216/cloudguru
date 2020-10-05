provider "aws" {
        region = "us-east-2"
        access_key = "AKIAJZHDQOIAOT7CAWXA"
        secret_key = "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"
}
resource "aws_key_pair" "terraform-demo" {
  key_name   = "terraform-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDl9fSH0xOJuGmY3wQJK/PCt+/4P090UZjipKuMgwsQkv90PP7xmvXncY4lGGnEpvBCZXve9Hza8YLPT+NLAAtcISGTgEtkhpwmfT69oaqG6gR0ERPryLDyze1rJLAy9V++H6AIiomm4XDodRGh0GL37lwVqM0yL3HoBiTr+Ar/33n7NUViBHkoJbsj62MF48ZppGHi34oFFX7HniBiFsp5vvnEyO1XFve2sUuI2Ll55ST0x18Wm2D388rjY9EurXxY30tmcKuioN9+BnLNthgxYFhHEJyQqR2ko+WtKPUgOQCOXeCVOn8bkPvgPoE8lKsjKqT5l477epSpKcUL2xkT root@ip-172-31-45-77.us-east-2.compute.internal"
}


resource "aws_instance" "jfrog" {
    # Use an aws-linux-2 image in Ohio
    ami = "ami-03657b56516ab7912"

    instance_type = "t2.micro"


    user_data = "var.user_data"
    tags {
        Name = "MYjfrog"
    }


    subnet_id = "subnet-a15524ed"
    associate_public_ip_address = true





    provisioner "local-exec" {
        command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root --private-key ./deployer.pem -i 'aws_instance.jfrog.public_ip,' ansible-playbook.yml"
    }
}
~
