variable "enviroment" {
  type        = string
  description = "Sigla do ambiente correspondente a implantação"
}

variable "service" {
  type        = string
  description = "Nome do serviço que será provisionado"
}

variable "product" {
  type        = string
  description = "Nome do produto que será provisionado"
}

variable "owner" {
  type        = string
  description = "Nome do time responsável"
}

variable "subnet_ids" {
  type        = list(any)
  description = "Id da subnet utilizada para criar as instâncias do auscaling group"
}

variable "aws_vpc" {
  type        = string
  description = "Nome do produto que será provisionado"
}

variable "engine" {
  type        = string
  description = "Engine do banco de dados"
}

variable "storage" {
  type        = string
  description = "tamanho inicial do disco"
}

variable "db_username" {
  type        = string
  description = "Nome do usuário root no banco de dados"
  sensitive   = true
}

variable "db_password" {
  type        = string
  description = "Senha do usuário root no banco de dados"
  sensitive   = true
}

variable "domain" {
  type        = string
  description = "ID do Directory Active Directory para inscluir a instância no domínio"
}

variable "domain_iam_role_name" {
  type        = string
  description = "Role para acesso ao Directory Active Directory"
}

