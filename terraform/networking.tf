resource "aws_vpc" "farmerbank" {
  cidr_block       = "10.0.0.0/16"

  tags {
    Name = "farmerbank"
  }
}

resource "aws_subnet" "production" {
  vpc_id     = "${aws_vpc.farmerbank.id}"
  cidr_block = "10.0.1.0/24"
  # map_public_ip_on_launch = true

  tags {
    Name = "production"
  }
}

resource "aws_subnet" "develpment" {
  vpc_id     = "${aws_vpc.farmerbank.id}"
  cidr_block = "10.0.2.0/24"
  # map_public_ip_on_launch = true

  tags {
    Name = "development"
  }
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.farmerbank.id}"
}

# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.farmerbank.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
}

