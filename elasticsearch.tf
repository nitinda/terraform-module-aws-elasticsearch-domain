resource "aws_elasticsearch_domain" "elasticsearch_domain" {
  domain_name      = var.domain_name
  access_policies  = var.access_policies
  advanced_options = var.advanced_options

  dynamic "advanced_security_options" {
    for_each = var.advanced_security_options == {} ? [] : [var.advanced_security_options]
    content {
      enabled                        = advanced_security_options.value.enabled
      internal_user_database_enabled = lookup(advanced_security_options.value, "internal_user_database_enabled", null)

      dynamic "master_user_options" {
        for_each = lookup(advanced_security_options.value, "master_user_options", []) == [] ? [] : [lookup(advanced_security_options.value, "master_user_options", [])]
        content {
          master_user_arn      = lookup(master_user_options.value, "master_user_arn", null)
          master_user_name     = lookup(master_user_options.value, "master_user_name", null)
          master_user_password = lookup(master_user_options.value, "master_user_password", null)
        }
      }
    }
  }

  dynamic "ebs_options" {
    for_each = var.ebs_options == {} ? [] : [var.ebs_options]
    content {
      ebs_enabled = ebs_options.value.ebs_enabled
      iops        = lookup(ebs_options.value, "iops", null)
      volume_size = lookup(ebs_options.value, "volume_size", null)
      volume_type = lookup(ebs_options.value, "volume_type", null)
    }
  }

  dynamic "encrypt_at_rest" {
    for_each = var.encrypt_at_rest == {} ? [] : [var.encrypt_at_rest]
    content {
      enabled    = encrypt_at_rest.value.enabled
      kms_key_id = lookup(encrypt_at_rest.value, "kms_key_id", null)
    }
  }

  dynamic "node_to_node_encryption" {
    for_each = var.node_to_node_encryption == {} ? [] : [var.node_to_node_encryption]
    content {
      enabled = node_to_node_encryption.value.enabled
    }
  }

  dynamic "cluster_config" {
    for_each = var.cluster_config == {} ? [] : [var.cluster_config]
    content {
      dedicated_master_count   = lookup(cluster_config.value, "dedicated_master_count", null)
      dedicated_master_enabled = lookup(cluster_config.value, "dedicated_master_enabled", null)
      dedicated_master_type    = lookup(cluster_config.value, "dedicated_master_type", null)
      instance_count           = lookup(cluster_config.value, "instance_count", null)
      instance_type            = lookup(cluster_config.value, "instance_type", null)
      warm_count               = lookup(cluster_config.value, "warm_count", null)
      warm_enabled             = lookup(cluster_config.value, "warm_enabled", null)
      warm_type                = lookup(cluster_config.value, "warm_type", null)
      zone_awareness_enabled   = lookup(cluster_config.value, "zone_awareness_enabled", null)

      dynamic "zone_awareness_config" {
        for_each = lookup(cluster_config.value, "zone_awareness_config", []) == [] ? [] : [lookup(icluster_config.value, "zone_awareness_config", [])]
        content {
          availability_zone_count = lookup(zone_awareness_config.value, "availability_zone_count", null)
        }
      }
    }
  }

  dynamic "snapshot_options" {
    for_each = var.snapshot_options == {} ? [] : [var.snapshot_options]
    content {
      automated_snapshot_start_hour = snapshot_options.value.automated_snapshot_start_hour
    }
  }

  dynamic "vpc_options" {
    for_each = var.vpc_options == {} ? [] : [var.vpc_options]
    content {
      security_group_ids = lookup(vpc_options.value, "security_group_ids", null)
      subnet_ids         = lookup(vpc_options.value, "subnet_ids", null)
    }
  }

  dynamic "log_publishing_options" {
    for_each = var.log_publishing_options == {} ? [] : [var.log_publishing_options]
    content {
      cloudwatch_log_group_arn = log_publishing_options.value.cloudwatch_log_group_arn
      enabled                  = lookup(log_publishing_options.value, "enabled", null)
      log_type                 = log_publishing_options.value.log_type
    }
  }

  elasticsearch_version = var.elasticsearch_version

  dynamic "domain_endpoint_options" {
    for_each = var.domain_endpoint_options == {} ? [] : [var.domain_endpoint_options]
    content {
      enforce_https       = domain_endpoint_options.value.enforce_https
      tls_security_policy = lookup(domain_endpoint_options.value, "tls_security_policy", null)
    }
  }

  tags = var.tags
}

