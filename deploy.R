library(googleComputeEngineR)

project = "scpworkshop"
gce_global_project(project)


## see gce_list_machinetype() for options of predefined_type
(tag = "gcr.io/scpworkshop/scmerge_docker:latest")


gce_global_zone("us-central1-a")
vm1 <- gce_vm(template = "rstudio",
              name = "scmerge",
              disk_size_gb = 50,
              predefined_type = "n1-standard-2",
              dynamic_image = tag,
              user = "rstudio",
              password = Sys.getenv("DOCKER_PWD"))

vm1 = gce_ssh_setup(vm1,
                    username = "rstudio",
                    key.pub = "~/.ssh/id_rsa.pub",
                    key.private = "~/.ssh/id_rsa")

gce_push_registry(vm1,
                  save_name = "seg:melanoma",
                  container_name = "rstudio")
