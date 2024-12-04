# Return 0

A Terraform-based AWS infrastructure for automated malware analysis using Spot instances.

## ⚠️ Important Disclaimers
- This project is for legitimate security research and malware analysis only
- You must comply with AWS Terms of Service, Acceptable Use Policy (AUP), and all applicable laws
- You are responsible for any costs incurred while using this infrastructure
- Handle malware samples with extreme caution in isolated environments
- To summarize, I am not responsible for your actions.

## 🏗 Architecture

```
AWS Cloud Environment
|
└── VPC: MalwareLabVPC (10.0.0.0/16)
    |
    +------------------------------------------------------------------------------+
    |                                                                              |
[Management Subnet (10.0.1.0/24)]                                          [Support Subnet (10.0.2.0/24)]
    |                                                                              |
    - Bastion (10.0.1.1, internet access)                                          - Transfer Station  (10.0.2.10, internet access)
    |                                                                              - SIEM (ELK Stack)  (10.0.2.12)
    |                                                                              - Analysis Database  (10.0.2.13)
    |
    |
+---------------------------------------------------+----------------------------------------+
|                                                                                            |
[Static Analysis Subnet (10.0.3.0/24)]                                     [Dynamic Analysis Subnet (10.0.4.0/24)]
|                                                                               |
|- Static Analysis (t3a.medium)                                                 |- FlareVM (light)                       
  * Ghidra                                                                      |- Security Onion 
  * IDA                                                                         |- Remnux
  * Binary Ninja                                                                |- Cuckoo Sandbox || CAPEv2                                                                
                                                                                |- Fake C2 Server (t3.micro, Spot)
```
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

### Cleanup

```
terraform apply -destroy
```

## 🔄 Roadmap
- [ ] Use draw.io or Miro for a better diagram
- [ ] Implement cloud-init for automated tool installation
- [ ] Enhanced security group configurations
- [ ] Add automated reporting capabilities

## 📞 Support
Create an issue :) 

## 📄 License
Not decided yet
