output "address-vm01" {
  value = "${aws_eip.development.public_ip}"
  value = "${aws_eip.vm02.public_ip}"
  value = "${aws_eip.vm03.public_ip}"
  value = "${aws_eip.vm04.public_ip}"
}

output "address-vm02" {
  value = "${aws_eip.vm02.public_ip}"
}

output "address-vm03" {
  value = "${aws_eip.vm03.public_ip}"
}

output "address-vm04" {
  value = "${aws_eip.vm04.public_ip}"
}