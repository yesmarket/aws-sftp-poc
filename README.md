# Overview

I find myself needing to spin up a temporary SFTP server from time to time - either for someone to SFTP files, or as part of a POC at work.

Doing this with Terraform will allow me to spin this up in a few seconds as well as destroy it quickly when no longer needed.

# Deploy

`terraform plan --out=plan.tfplan --var-file=secrets.tfvars`<br/>
`terraform apply "plan.tfplan"`

# Destroy

`terraform destroy --var-file=secrets.tfvars`
