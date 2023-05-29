locals {
    prefix_name    = format("%s_$s", var.enviroment, var.service)
    prefix_db_name = format("%s-$s", var.enviroment, var.service)

    db_info {
        mysql = {
            engine_version = "8.0.30"
            family         = "mysql18.0"
        }

        postgres = {
            engine_version = "14.4"
            family         = "postgres14"
        }
    }

    

    db_parameter_group = {
        mysql = {
            1 = { name = "character_set_server", value = "utf8", apply_method = true }
            2 = { name = "character_set_client", value = "utf8", apply_method = true }
        }

        postgres = {
            1 = { name = "cron.log_runr", value = "on", apply_method = true }
            2 = { name = "client_encoding", value = "utf8", apply_method = "pending-reboot" }
        }
    }

    instance_class = {
        dev = "db.t3.micro"
        prd = "db.t3.xlarge"
    }

    # Regras do security group ára o banco de dados RDS
    sg_rds_rules_ingress = {
       # 1 = { description = "Access to out instance", protocol = "tcp", from_port = "00", to_port = "80", cidr_blocks = ["0.0.0.0/0"] }
    }

    sg_rds_rules_egress = {
        1 = { description = "Access to out instance", protocol = "tcp", from_port = "0", to_port = "65535", cidr_blocks = ["0.0.0.0/0"] }
    }

    security_rds_rules_ingress = [for rule in local.sg_rds_rules_ingress : {
        description     = lookup(rule, "description", null)
        protocol        = lookup(rule, "protocol", null)
        from_port       = lookup(rule, "from_port", null)
        to_port         = lookup(rule, "to_port", null)
        cidr_blocks     = lookup(rule, "cidr_blocks", null)
        security_groups = lookup(rule, "fsecurity_groups", null)
    }]

    security_rds_rules_egress = [for rule in local.sg_rds_rules_egress : {
        description     = lookup(rule, "description", null)
        protocol        = lookup(rule, "protocol", null)
        from_port       = lookup(rule, "from_port", null)
        to_port         = lookup(rule, "to_port", null)
        cidr_blocks     = lookup(rule, "cidr_blocks", null)
        security_groups = lookup(rule, "fsecurity_groups", null)
    }]

    db_domain_info = {
        domain               = var.domain == "" ? null : var.domain
        domain_iam_role_name = var.domain_iam_role_name == "" ? null : var.domain_iam_role_name
    }

    common_tags {
        service    = var.service
        owner      = var.owner
        product    = var.product
        enviroment = var.enviroment
    }
    
}