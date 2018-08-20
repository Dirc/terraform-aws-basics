

# Terraform

## Setup

```bash
# Download zip
mkdir /opt/terraform
mv ~/Downloads/terraform*.zip /opt/terraform

# Add to path
vi ~/.bashrc
  export PATH=$PATH:/opt/terraform
source ~/.bashrc

# Verify
terraform --version
```

## Create infra

```bash
# Initialise directory
terraform init

# > Create ec2_example.tf file

# Apply
terraform apply
terraform apply -auto-approve

# Verify
terraform show

# Destroy
terraform destroy
terraform destroy -auto-approve
```

### Seperate credential file
Ref: https://docs.aws.amazon.com/cli/latest/topic/config-vars.html#credentials

Create a `~/.aws/credentials` file in your home directory, containing:

```bash
[default]
aws_access_key_id=
aws_secret_access_key=
```

### Variables file
Ref: https://docs.aws.amazon.com/cli/latest/topic/config-vars.html

Create a `variables.tf` file in your project directory containing:

Note: terraform will load all `*.tf` files.

```hcl-terraform
variable "region" {
  default = "us-east-2"
}
```

Use the variable in your main `.tf` file:

```hcl-terraform
provider "aws" {
  region      = "${var.region}"
}
```


### Add SSH keys - In Progres...
Generate you own key in `~/.ssh/`

```bash
ssh-keygen
```

Add name to `key-pairs.tf` file.

After you create your server, you should be able to ssh into it using:

```bash
ssh ubuntu@PUBLIC_IP
```

Note: This works together with the static `security-group.tf` file.
