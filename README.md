# ReactApp demo

The app is built and deployed using azure devops and in Azure Cloud.

Azure pipeline is used to provision Infrastructure (ResourceGroup, Azure Container registry, Azure Kuberenetes Cluster)

Azure pipelines are used to build and deploy the app to environments.

for simplicity I used one environment only, but it easily can be expanded to multiple environments by using IaC provided.

Infrastructure as Code is provided using Terraform, Terraform state is managed in remote state Azure backend in a storage account.

*Disclaimer*
*I never worked with java or react applicaiton and I dont have a development background it took me some extratime to understand the application, also thats the reason I wasnt able to split frontend and backend code, and replace in database memory with real database*
## How to use the code provided

**Prerequisites**

1. Azure Account and Subscriptions
2. Azure DevOps Organization
3. Add ServiceConnection in your azure devops organization that link with the azure subscription
4. Make sure that the ServiceConnection created Service prinicpal in Azure AD have enough admin permission (assign it an owner permission)

**Steps to work**
 
1. Create a resource group and storage account, containter, to use for storing terraform state replace tokens below with your inputs. 
    - az login
    - az group create -l <resorucegrouplocation> -n <resourcegroupname>
    - az storage account create -n <storageaccountName> -g <resourcegroupname> -l <resorucegrouplocation> --sku Standard_LRS
    - az storage container create --accountname <storageaccountName> --name <ConatainerName>

2. Save these values in azure devops Variable Group called "TfBackendState" beacause it is used in the pipeline to store the state.
3. Create two new pipelines based on the files (IaC pipeline) /terraform/iac-azure-pipeline.yml and (Application Pipeline) /app/azure-pipeline.yml

4. Run IaC pipeline it provision the infrastructure

5. Run Applicaiton pipeline 

You should now have a running application in Azure Kuberenets cluster

6. To delete all infrastructure, Set Variable "DeleteInfraStructure" to true in the IaC pipeline.

**Things I would do for a real production environment**

- Split frontend and backend deployment (I dont have any knoweldge about Springfire or react)
- Use database mysql and deploy it to kuberenets cluster
- Use Ingress controller in AKS 
- Use custom domain and SSL certificate to launch the application
- Use RBAC role in AKS
- Configure Monitoring and Autoscaling
- Set specs for the running pods