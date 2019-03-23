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
