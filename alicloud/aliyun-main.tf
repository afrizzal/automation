provider "alicloud" {
  access_key = "THIS_IS_ACCESS_KEY"
  secret_key = "THIS_IS_SECRET_KEY"
  region     = "ap-southeast-5"
}

# Create a VPC and subnet
resource "alicloud_vpc" "my_vpc" {
  name       = "my_vpc"
  cidr_block = "10.0.0.0/16"
}

resource "alicloud_subnet" "my_subnet" {
  name            = "my_subnet"
  vpc_id          = alicloud_vpc.my_vpc.id
  cidr_block      = "10.0.1.0/24"
  availability_zone = "ap-southeast-5"
}

# Create a security group
resource "alicloud_security_group" "my_sg" {
  name        = "my_sg"
  description = "Security group for my VM"

  rule {
    ip_protocol = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_ip     = "0.0.0.0/0"
  }
}

# Create a virtual machine instance
resource "alicloud_instance" "my_vm" {
  instance_name         = "my_vm"
  instance_type         = "ecs.t5-lc1m1.small"
  image_id              = "ubuntu_20_04_lts_64_20G_alibase_20210819.vhd"
  vswitch_id            = alicloud_subnet.my_subnet.vswitch_id
  security_groups       = [alicloud_security_group.my_sg.id]
  internet_max_bandwidth_out = 10

  # Attach a data disk
  data_disks {
    category     = "cloud_ssd"
    size         = 20
    disk_name    = "local_disk"
    description  = "Local Disk"
    delete_with_instance = true
  }

  # Add SSH key
  key_name = "my_ssh_key"
  key_pair_name = "my_ssh_key_pair"
}
