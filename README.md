# simple-EKS-cluster-with-Terraform

### About The Project

This small Terraform deployment creates a VPC with 2 public subnets and 2 private subnets and an EKS cluster (version 1.21) with 2 nodes running on the private subnets. Project is using the VPC and EKS modules, and adapted from [Learn Terraform - Provision an EKS Cluster](https://github.com/cmakkaya/EKS-cluster-with-Terraform)

Instance type of the nodes will be t3.medium. Feel free to change it as needed in the eks-cluster.tf file.

This deployment will configure resources in us-east-1 region.

**Warning: You may be charged by AWS to run this deployment.**

## Built With

* Terraform
* EKS

### Prerequisites

This deployment can be deployed to an AWS environment. AWS account is required to run this deployment. Use the following link to create an access key and a secret access key.
- [Managing access keys for IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html)

aws cli, Git, Terraform and kubectl are reqired for this deployment. 

- To install aws cli, go to the [AWS website](https://aws.amazon.com/cli/)

- To install Git, go to the [Git website](https://git-scm.com/downloads).

- To install Terraform, go to the [Terraform Website](https://learn.hashicorp.com/tutorials/terraform/install-cli)

- To install kubectl, go to the [Kubernetes website](https://kubernetes.io/docs/tasks/tools/) to install the kubectl.

Note: If you have already another Kubernetes cluster configured in your local kubeconfig file, it will be a good idea to backup the file. So you can restore it if needed.

### Deployment

1. Clone the repo and go to the deployment directory.

```
git clone https://github.com/cmakkaya/EKS-cluster-with-Terraform.git
cd EKS-cluster-with-Terraform/
```

2. Run aws configure to enter AWS keys on your computer. Choose region as us-east-1.

```
aws configure
```

3. Initialize the working directory.
```
terraform init
```

4. Run the below command to create an execution plan and review it.
```
terraform plan
```

5. Run the below command to execute the plan and enter yes when prompted.
```
terraform apply
```

6. Run the below command to configure the kubectl 
```
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```

8. Run the below command to test your connection to the EKS cluster
```
kubectl get nodes
```


### Troubleshooting

If the step 5 (Terraform apply) fails, run the apply command once again. If it keeps failing save the output logs and reach out to me on Github. 

### Cleanup
1. If the deployment is not needed anymore, run the following command to delete the deployment. Enter yes when prompted.

```
terraform destroy
```

2. If you have a kubeconfig file backup, simply copy it back to default directory $HOME/.kube
