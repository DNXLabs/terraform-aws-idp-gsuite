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
<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-idp-gsuite/blob/master/LICENSE) for full details.
