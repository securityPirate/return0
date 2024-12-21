# outputs.tf

output "bastion_host_public_ip" {
  value = one(aws_instance.bastion_host[*].public_ip)
}

output "bastion_host_private_ip" {
  value = one(aws_instance.bastion_host[*].private_ip)
}

output "static_analysis_private_ip" {
  value = one(aws_instance.static_analysis_instance[*].private_ip)
}

output "dynamic_analysis_private_ip" {
  value = one(aws_instance.dynamic_analysis_instance[*].private_ip)
}

output "private_key" {
  value     = one(tls_private_key.rsa_key[*].private_key_pem)
  sensitive = true
}
