---
Prowler
---
POC of [Prowler](https://github.com/toniblyx/prowler) + [Terraform](https://www.terraform.io/).

[Codebuild module](./prowler-codebuild)

# Requirements
- [Prowler](https://github.com/toniblyx/prowler)
- [Terraform](https://www.terraform.io/)

# Setup
1. Clone the project
```bash
git clone git@github.com:dgamboaestrada/prowler-terraform-POC.git
```
2. Enter to the project
```bash
cd prowler-terraform-POC
```
3. Init terraform
```bash
terraform init
```
4. Create AWS resources
```bash
terraform apply
```

# Prowler commands using docker

### Display help
```bash
 docker run -ti --rm --name prowler toniblyx/prowler:latest -help
```

### Display all the checks
```bash
 docker run -ti --rm --name prowler toniblyx/prowler:latest -l
```

Filtering by group
```bash
 docker run -ti --rm --name prowler toniblyx/prowler:latest -l -g glue
```
Where glue is the name of the group to filter.

### Display all the groups
```bash
 docker run -ti --rm --name prowler toniblyx/prowler:latest -L
```

### Run specific checks
```bash
docker run -ti --rm --name prowler --env AWS_ACCESS_KEY_ID --env AWS_SECRET_ACCESS_KEY toniblyx/prowler:latest -c check73
```

Running more than one check.
```bash
 docker run -ti --rm --name prowler --env AWS_ACCESS_KEY_ID --env AWS_SECRET_ACCESS_KEY toniblyx/prowler:latest -c extra73,extra734
```

### Run checks on a specific region
```bash
docker run -ti --rm --name prowler --env AWS_ACCESS_KEY_ID --env AWS_SECRET_ACCESS_KEY toniblyx/prowler:latest -f us-east-1 -c extra760
```

### Saving report
The reports are saving into output folder.

Format supported text (default), mono, html, json, json-asff, junit-xml, csv.
```bash
docker run -ti --rm --name prowler --env AWS_ACCESS_KEY_ID --env AWS_SECRET_ACCESS_KEY --volume "$(pwd)/output":/prowler/output --volume "$(pwd)/junit-reports":/prowler/junit-reports toniblyx/prowler:latest -c extra73,extra734 -M html
```

They can be used combined comma separated.
```bash
docker run -ti --rm --name prowler --env AWS_ACCESS_KEY_ID --env AWS_SECRET_ACCESS_KEY --volume "$(pwd)/output":/prowler/output toniblyx/prowler:latest --volume "$(pwd)/junit-reports":/prowler/junit-reports -c extra73,extra734 -M html,txt,json
```
