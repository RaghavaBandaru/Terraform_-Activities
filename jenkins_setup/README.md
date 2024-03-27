## Step-1: Create Workspace

#### In the windows Open the Git Bash and switch to the directory where scripts can be executed

      Ex: D:\workspace\

## Step-2: Clone the Repo

      $ git clone https://gitlab.com/rns-devops/terraform-jenkins.git

## Step-3: Open the project in atom

      $ cd terraform-jenkins && atom .

## Step-4: in GitBash run the terraform commands

      $ terraform init

      $ terraform fmt

      $ terraform validate

      $ Terraform apply --auto-approve

## Step-5: Login to the Jenkins Master using Mobaxterm

      - Public IP Address of Master

      - UserName: devops

      - Password: devops

      - Verify the Jenkins URL:

            - http://Public_IP_Jenkins_Master:8080

      - Verify the Java Version:

            - $ java -version

      - Verify the Jenkins Process

            - $ ps -ef | grep jenkins

            - $ netstat -nltp
      

## Step-6: Password less configuration between Master to the Slave Node

      1. Collect the Private IP addresses of the Jenkins Slave

          Ex: 172.20.10.85

      2. Check the SSH communication with Password

          $ ssh devops@172.20.10.85

              L> confirm 'yes' and enter password 'devops'        

      3. Copy the Public Key to the Target Nodes

          $ ssh-copy-id devops@172.20.10.85

              L> Enter password 'devops'


      4. Finally re verify the password less authentication

          $ ssh devops@172.20.10.85


## Step-7: Finally work is done, destroy the resources

      $ terraform destroy --auto-approve

----------------------------Jenkins Setup is done------------------------------
