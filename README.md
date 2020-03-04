# terraform-aws-idp-gsuite

[![Lint Status](https://github.com/DNXLabs/terraform-aws-idp-gsuite/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-idp-gsuite/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-idp-gsuite)](https://github.com/DNXLabs/terraform-aws-idp-gsuite/blob/master/LICENSE)

This terraform module creates IAM roles federated to GSuite with SAML.

## Usage

```hcl
module "idp_account_roles" {
  source   = "git::https://github.com/DNXLabs/terraform-aws-idp-gsuite.git?ref=0.0.2"
  org_name = "my_organization"
}
```

Deploy this module to your IdP account.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| org\_name | Name for this organization (slug) | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| iam\_role\_admin\_arn | ARN for admin IAM role |
| iam\_role\_read\_only\_arn | ARN for read-only IAM role |

## Authors

Module managed by [Allan Denot](https://github.com/adenot).

## License

Apache 2 Licensed. See LICENSE for full details.
