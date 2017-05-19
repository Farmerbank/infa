# Provision infrastructural components via Terraform

## Getting started

Rename `terraform.tfvars.sample` to `terraform.tfvars` and enter the AWS credentials. Ask Wian for the credentials
Now you can plan your infrastructure and apply it.

**NOTE: tested with CinQ ICT subscription**

## Import module
```
$ terraform get
```

## Plan your infrastructure
```
$ terraform plan --out=plan/farmerbank.plan --state=state/farmerbank.tfstate
```

## Apply you plan
```
$ terraform apply --state-out=state/farmerbank.tfstate plan/farmerbank.plan
```

## Destroy everything
```
$ terraform plan -destroy --state=state/farmerbank.tfstate --out=plan/farmerbank.plan
$ terraform apply --state-out=state/farmerbank.tfstate plan/farmerbank.plan
```

## Destroy a single resource
```
$ terraform plan -destroy -target=aws_internet_gateway.default --state=state/farmerbank.tfstate --out=plan/farmerbank.plan
$ terraform apply --state-out=state/farmerbank.tfstate plan/farmerbank.plan
```

# Terraform state file

## List resources in the state file

```
$ terraform state list --state=state/farmerbank.tfstate
aws_eip.development
aws_instance.vm01
aws_internet_gateway.default
aws_key_pair.auth
aws_route.internet_access
aws_security_group.allow_rabobank
aws_subnet.develpment
aws_subnet.production
aws_vpc.farmerbank
```

## Remove a single resource from the state file:
```
$ terraform state rm --state=state/farmerbank.tfstate aws_key_pair.auth
```
