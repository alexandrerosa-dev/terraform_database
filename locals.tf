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
        mysql {
            
        }
    }
}