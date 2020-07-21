# _Terraform Module : terraform-module-elasticsearch-domain_
_Terraform Module for_ **_AWS Elasticsearch Domain_**

<!--BEGIN STABILITY BANNER-->
---

![_Code : Stable_](https://img.shields.io/badge/Code-Stable-brightgreen?style=for-the-badge&logo=github)

> **_This is a stable example. It should successfully build out of the box_**
>
> _This examples does is built on Construct Libraries marked "Stable" and does not have any infrastructure prerequisites to build._

---
<!--END STABILITY BANNER-->

## _General_

_This module may be used to create_ **_Elasticsearch Domain_** _resources in AWS cloud provider......_

---


## _Prerequisites_

_This module needs_ **_Terraform 0.12.19_** _or newer._
_You can download the latest Terraform version from_ [here](https://www.terraform.io/downloads.html).

_This module deploys aws services details are in respective feature branches._

---

## _Features_

_Below we are able to check the resources that are being created as part of this module call:_

* **_Elasticsearch Domain_**



---

## _Usage_

## _Using this repo_

_To use this module, add the following call to your code:_

## _Example Usage_

### _Basic Usage_

```tf
```


### _Access Policy_

```tf
```

### _Log Publishing to CloudWatch Logs_

```tf
```

### _VPC based ES_

```tf
module "elasticsearch_domain" {
  source = "git::https://github.com/nitinda/terraform-module-aws-elasticsearch-domain.git?ref=master"

  providers = {
    aws = aws.services
  }

  domain_name           = "elasticsearch-domain"
  elasticsearch_version = "6.3"

  cluster_config = {
    instance_type = "m4.large.elasticsearch"
  }

  vpc_options = {
    subnet_ids = [
      module.vpc_subnet_public_1a.id,
      module.vpc_subnet_public_1b.id,
    ]

    security_group_ids = [ module.security_group_es.id ]
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  snapshot_options = {
    automated_snapshot_start_hour = 23
  }

  tags = merge(
    var.common_tags,
    {
      Environment = "prod"
      Name        = "elasticsearch-domain"
    }
  )
}
```


---

## _Argument Reference_

---

_The following arguments are supported:_

---

* **_domain\_name_** _- (Required) Name of the domain._
* **_access\_policies_** _- (Optional) IAM policy document specifying the access policies for the domain._
* **_advanced\_options_** _- (Optional) Key-value string pairs to specify advanced configuration options. Note that the values for these configuration options must be strings (wrapped in quotes) or they may be wrong and cause a perpetual diff, causing Terraform to want to recreate your Elasticsearch domain on every apply._
* **_advanced\_security\_options_** _- (Optional) Options for [fine-grained access control](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/fgac.html). See below for more details._
* **_ebs\_options_** _- (Optional) EBS related options, may be required based on chosen [instance size](https://aws.amazon.com/elasticsearch-service/pricing/). See below._
* **_encrypt\_at\_rest_** _- (Optional) Encrypt at rest options. Only available for [certain instance types](http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/aes-supported-instance-types.html). See below._
* **_node\_to\_node\_encryption_** _- (Optional) Node-to-node encryption options. See below._
* **_cluster\_config_** _- (Optional) Cluster configuration of the domain, see below._
* **_snapshot\_options_** _- (Optional) Snapshot related options, see below._
* **_vpc\_options_** _- (Optional) VPC related options, see below. Adding or removing this configuration forces a new resource ([documentation](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-vpc-limitations))._
* **_log\_publishing\_options_** _- (Optional) Options for publishing slow logs to CloudWatch Logs._
* **_elasticsearch\_version_** _- (Optional) The version of Elasticsearch to deploy. Defaults to 1.5_
* **_domain\_endpoint\_options_** _- (Optional) Domain endpoint HTTP(S) related options. See below._
* **_tags_** _- (Optional) A map of tags to assign to the resource_


---

## _Attributes Reference_
---

_In addition to all arguments above, the following attributes are exported:_

* _**arn** - Amazon Resource Name (ARN) of the domain._
* _**domain\_id** - Unique identifier for the domain._
* _**domain\_name** - The name of the Elasticsearch domain._
* _**endpoint** - Domain-specific endpoint used to submit index, search, and data upload requests._
* _**kibana\_endpoint** - Domain-specific endpoint for kibana without https scheme._

---


### _Usage_

_In order for the variables to be accessed on module level please use the syntax below:_

```tf
module.<module_name>.<output_variable_name>
```

_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
data.terraform_remote_state.<module_name>.<output_variable_name>
```

---

## _Authors_

_Module maintained by Module maintained by the -_ **_Nitin Das_**