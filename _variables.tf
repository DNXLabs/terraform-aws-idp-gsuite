variable "org_name" {
  description = "Name for this organization (slug)"
}

variable "metadata" {
  description = "Metadata provided by GSuite"
}

variable "clients" {
  type        = "list"
  description = "List of clients (external accounts) that this IDP account will allow switching to"
  default     = []
}

variable "role_max_session_duration" {
  description = "Maximum CLI/API session duration"
  default     = "43200"
}

variable "client_all_admin_role_names" {
  type        = "list"
  description = "List of admin roles used by clients that this account can assume to"
  default     = []
}

variable "extra_roles" {
  type        = "list"
  default     = []
  description = "List of extra roles to create and allow assuming into other accounts"
}
