output "private_server_dns" {
  value = aws_instance.private_server.public_dns
}

output "private_server_public_ip" {
  value = aws_instance.private_server.public_ip
}

output "private_server_tags" {
  value = aws_instance.private_server.tags
}

output "bastion_server_dns" {
  value = aws_instance.bastion_server.public_dns
}

output "bastion_server_public_ip" {
  value = aws_instance.bastion_server.public_ip
}

output "bastion_server_tags" {
  value = aws_instance.bastion_server.tags
}

