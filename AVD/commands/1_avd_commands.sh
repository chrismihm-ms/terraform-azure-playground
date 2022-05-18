# You can find the installer info for Terraform here:
# https://www.terraform.io/downloads.html

# First we'll start by making sure Terraform is installed and check out the
# help command baked in to the cli.
terraform version

terraform -help

# Terraform follows the terraform <command> <subcommand> syntax
# Options use a single dash whether it's a single character option
# or full word.

# In this module, we are simply trying to get the configuration deployed.
# First we'll copy our file from the base_web_app to a working directory
mkdir AVD
cp ./main.tf ./AVD/main.tf

# Now we can work with the main.tf file in globo_web_app
cd AVD

# Open the main.tf file in your code editor and replace the values 
# for the AWS keys in the config file

# Get logged into Azure and set your subscription
# https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-cloud-shell-powershell?tabs=azure-powershell
az login
az account show
az account list --query "[?user.name=='cmihm@inetcg.com'].{Name:name, ID:id, Default:isDefault}" --output Table
az account set --subscription "30bbbf3b-11a5-4cd9-b149-231eb95ef614"


# !! DO NOT COMMIT THESE TO SOURCE CONTROL !!

# Now we will follow the standard Terraform workflow
terraform init
terraform plan -out avd.tfplan
terraform apply "avd.tfplan"

# Got to the Console and get the Public IP address for the EC2 instance
# and browse to port 80.

# If you are done, you can tear things down to save $$
terraform destroy