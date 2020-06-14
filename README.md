# COVID CO-OPERATION HACKATHON INFRA
Terraform HCL code to build serverless application for Hackathon

![severless architecture](./images/Serverless Application Architecture.png?raw=true "Optional Title")

# Environment Variables for HCL
By default, the HCL detects AWS credentials set in your environment and uses them to sign requests to AWS. That way you don't need to manage credentials in your applications. The HCL looks for credentials in the following environment variables:

AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY /AWS_SESSION_TOKEN (optional)

The following examples show how you configure the environment variables.

Linux, OS X, or Unix
```
$ export AWS_ACCESS_KEY_ID=YOUR_AKID
$ export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_KEY
$ export AWS_SESSION_TOKEN=TOKEN
$ export AWS_REGION=us-east-1
```
Windows
```
C:> set AWS_ACCESS_KEY_ID=YOUR_AKID
C:> set AWS_SECRET_ACCESS_KEY=YOUR_SECRET_KEY
C:> set AWS_SESSION_TOKEN=TOKEN
C:> set AWS_REGION=us-east-1
```
# Run TERRAFORM 
Commands to run the terraform HCL code

```
$ terraform --version 
$ terraform init
$ terraform plan
$ terraform apply
```

# Provider
```
provider.aws: version = "~> 2.66"
```