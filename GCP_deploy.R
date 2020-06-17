library(googleComputeEngineR)

project = "your_own_google_cloud_project"
gce_global_project(project)


## see gce_list_machinetype() for options of predefined_type
(tag = "kevinwang09/scmerge:latest")

gce_global_zone("us-central1-a") ## Different zones will have different costs
vm1 <- gce_vm(template = "rstudio", ## RStudio based template in deployment
              name = "scmerge", ## Name of the VM in Google Cloud
              disk_size_gb = 50, ## Harddisk space
              predefined_type = "n1-standard-4", ## Machine type
              dynamic_image = tag, ## The tage specified above
              user = "rstudio", ## User name 
              password = Sys.getenv("DOCKER_PWD")) ## Password, set your own or use whatever is stored in system environment variable

## Un-comment the following to push a SSH to Google Cloud to make interactive changes. 
# vm1 = gce_ssh_setup(vm1,
#                     username = "rstudio",
#                     key.pub = "~/.ssh/id_rsa.pub",
#                     key.private = "~/.ssh/id_rsa")
# 
# gce_push_registry(vm1,
#                   save_name = "scmerge:custom",
#                   container_name = "rstudio")
