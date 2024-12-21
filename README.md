# Return 0

A Terraform-based AWS infrastructure for automated malware analysis using Spot instances.

## ⚠️ Important Disclaimers
- This project is for legitimate security research and malware analysis only
- You must comply with AWS Terms of Service, Acceptable Use Policy (AUP), and all applicable laws
- You are responsible for any costs incurred while using this infrastructure
- Handle malware samples with extreme caution in isolated environments
- To summarize, I am not responsible for your actions.

## 🏗 Architecture

![Alt text](./arch.png?raw=true "Malware Analysis Lab Architecture")
### What the heck is that?
Yeah, I can explain each instance's purpose, but you can figure it out :)
Long Story Short is 
- Bastion is the only instance should have access to the internet and open port 22
- Transfer station is only responsible for Downloading the sample and sending it Dynamic and static instances.

## 🚀 Quick Start

### Prerequisites
- AWS Account with appropriate permissions
- Terraform
- AWS CLI, AWS IAM user
- S3 bucket for Terraform state

### Pre Deploy
1. Clone the repository "yaah"
2. Configure AWS credentials
3. Create the Terraform state bucket
```
aws configure
aws s3 api create-bucket --bucket {nameofyourbucket} --region {Choose AWS Region}
```
### Deployment
```
terraform init
terraform plan
terraform apply
```
Create the infra without the EC2
```
terraform plan -out=tfplan -var='exclude_ec2_instance=true'
terraform apply
```
### Cleanup

```
terraform apply -destroy
```

## 🔄 Roadmap
- [ ] finalize the diagram
- [ ] sysmon with config on dynamic analysis vm, and cyberchef on static analysis vm
- [ ] Explain how to spin specific resources instead of provisiong the whole lab 
- [ ] Update the github action to auto deploy and destroy
- [ ] Implement cloud-init for automated tool installation
- [ ] Enhanced security group configurations
- [ ] Add automated reporting capabilities

## 📞 Support
Create an issue :) 

## 📄 License
Not decided yet
