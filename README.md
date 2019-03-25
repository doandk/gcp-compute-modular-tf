# GCP-Compute-Modular

## Directory Tree

- instances-alpha
  - pubkey
    - [user].pub {user public key}
  - script 
    - startup-script.sh {using initial script after creating the instances}
  - main.tf {main file, describe the spec of the instance (machine type, zone, storage, network, tag etc)}
  - backend.tf {backend used to store terraform state (eg. local or on cloud storage)}
  - provider.tf {cloud provider detail (default region, credentials and project)}
  - .terraform {terraform state which will be uploaded to google-storage}

- modules
  ## private only
  - compute-engine-private
    - main.tf {main template for instances details}
    - outputs.tf {outputs after finish}
    - variables.tf {variable list and default value}
  
  ## using public ip
  - compute-engine-public
    - main.tf {main template for instances details}
    - outputs.tf {outputs after finish}
    - variables.tf {variable list and default value}
