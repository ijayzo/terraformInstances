# terraformInstances
-------------
@AWS

Create a User
	Give direct policy for AdminAccess 
	Create Access Key 
		This is the access key and secret key that are hard-coded into connections.tf file. 
	
Once the Instance is created, grab the Public IPv4 DNS.

------------
@GitHub

Create a repo on web 
Go to settings and create a token with all permissions
Copy that token as it will be used for connecting your local machine to your git repos.

------------
@LocalMachine(using RHEL) 

Please have AWS CLI installed on your machine and configured to your AWS account with the *aws configure* command and your AWS user credentials.
	To set up Profiles, update your ~/.aws/config file to look like the file that is named awsconfig on the home dir of this repo. 

(optional) To set up Git
	mkdir <repo>
		name of repo on local machine, can be called diff from repo on git
	cd <repo>
	git remote set-url origin https://<token>@github.com/<username>/<repo>
		username and repo here are the names found on github.com
	git add .
	git commit -m "<message>"
	git push origin main (careful with branched projects)

To setup terraform
	(as root or with sudo)
	dnf install -y yum-utils
	dnf yum-config-manager --add-repo http://rpm.releases.hasicorp.com/RHEL/hashicorp.repo
	dnf install terraform -y

Once you have the tf files configured and you have terraform installed on your machine.
	cd into the directory with your tf files
	terraform init
	terraform plan 
	terraform apply
		will ask for user input.
	Once isntance(s) is/are running, run the following command to ssh into the instance 
		ssh -i <absolute path for the key file, same name gived as input while doing the terraform apply>
	The folder named script in this repo holds a script that is to be copied onto the instance and run on the instance.
		it will show some info of the isntance and the script will also pull and run and/or start a nginx container with name nginx-1. The script will also allow for the change of the first header value. 
 
------------
@TerraformFiles

connections.tf has the access_key = "" and secret_key = "" hard coded.
Running terraform apply will ask for a file name to create a PEM file in the working directory, allowing SSH

profiles used: terraform-runner
	Please look at @LocalMachine section for more details.

------------
To be fixed

	count.index
