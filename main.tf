# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module "aft" {
  source = "git@github.com:levinineiasi/lz-terraform-aws-control_tower_account_factory.git?ref=1.10.4-1"
#  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory.git?ref=1.10.4"
  ct_management_account_id    = var.ct_management_account_id
  log_archive_account_id      = var.log_archive_account_id
  audit_account_id            = var.audit_account_id
  aft_management_account_id   = var.aft_management_account_id
  ct_home_region              = var.ct_home_region
  tf_backend_secondary_region = var.tf_backend_secondary_region

  vcs_provider                                  = "github"
  account_request_repo_name                     = "${var.github_username}/lz-terraform-aft-account-request"
  account_provisioning_customizations_repo_name = "${var.github_username}/lz-terraform-aft-account-provisioning-customizations"
  global_customizations_repo_name               = "${var.github_username}/lz-terraform-aft-global-customizations"
  account_customizations_repo_name              = "${var.github_username}/lz-terraform-aft-account-customizations"

  aft_vpc_endpoints = false
}
