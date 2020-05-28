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

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_all\_admin\_role\_names | List of admin roles used by clients that this account can assume to | `list(string)` | `[]` | no |
| clients | List of clients (external accounts) that this IDP account will allow switching to | `list(string)` | `[]` | no |
| extra\_roles | List of extra roles to create and allow assuming into other accounts | `list(string)` | `[]` | no |
| metadata | Metadata provided by GSuite | `any` | n/a | yes |
| org\_name | Name for this organization (slug) | `any` | n/a | yes |
| role\_max\_session\_duration | Maximum CLI/API session duration | `string` | `"43200"` | no |

## Outputs

| Name | Description |
|------|-------------|
| iam\_role\_admin\_arn | ARN for admin IAM role |
| iam\_role\_read\_only\_arn | ARN for read-only IAM role |

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-idp-gsuite/blob/master/LICENSE) for full details.
