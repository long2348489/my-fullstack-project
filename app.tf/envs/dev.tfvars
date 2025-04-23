
env_prefix                             = "dev"
vpc_name                               = "dev_env"
cidrvpc                                = "10.0.0.0/16"
enable_nat_gateway                     = true
single_nat_gateway                     = true
enable_dns_hostnames                   = true
create_database_subnet_group           = true
create_database_subnet_route_table     = true
create_database_internet_gateway_route = true
enable_flow_log                        = true
create_flow_log_cloudwatch_iam_role    = true
create_flow_log_cloudwatch_log_group   = true
eks_config = {
  cluster_name                                   = "tamtmveks"
  cluster_version                                = "1.30"
  min_size                                       = 3
  max_size                                       = 9
  eks_managed_node_group_defaults_instance_types = ["t2.medium", "t2.large"]
  instance_type                                  = "t2.medium"
  instance_types                                 = ["t2.medium", "t2.large"]
  manage_aws_auth_configmap                      = true
  endpoint_public_access                         = true
  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::539247450054:user/eks-ops"
      username = "eks-ops"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::539247450054:user/devops"
      username = "devops"
      groups   = ["system:masters"]
    },
  ]
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"],
  eks_cw_logging                       = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}
vm-config = {
  vm1 = {
    instance_type = "t2.small",
    tags = {
      "ext-name" = "vm2"
      "funct"    = "purpose test"
    }
  },
  vm2 = {
    instance_type = "t2.medium",
    tags          = {}
  }
}
bastion_definition = {
  "bastion" = {
    associate_public_ip_address = false
    bastion_ami                 = "ami-00b94073831733d2e"
    bastion_instance_class      = "t2.micro"
    bastion_monitoring          = true
    bastion_name                = "bastion"
    bastion_public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7mknUTxwgmWbi2dgMxHvA8/Ajgul4b9tOMKkV9jxtnAgxceOMaRzw5Pn1lTRHLWf1XA7Bhanyxx7DuvExyv90S7FCklh32wS/krPdBgHJdhQR118ET1FVxN+XU1ZNwRIwnozlivei1xoFZttjx14jzlGXh2i8oC06XwuDlVgf2JPngtT2a542y5qY43+MdLmT0mzbYfzi3KXkcbW7+zcP065/yHkUj1uL/dFyCvtSnYfVh6b/JjhbNsUINSQCkNHu7s2nuldmZC0yFvbfHs50ZQ+M4361Agcb/st94S9PYCcCe7TI+JG9s7nM3Oyad7yf3LjSaFnZJ/LX7SFsnPnhsGuMhLD1wp5i5vBoyH3roDqF/LjyN6V6XiNWpBz+9bEtVTmwSdqqU9V+pQmoWlHLt0jhMzuPVfTlViHj7Sy+QfKRYDuWicP8ikODSCImTjpinufypvXhjNhIYDLmPdD+kUc0LdSZqZFFR4w3KdJu6miGQOsqFwgwo4mh1xCMIoE=root@Boo"
    trusted_ips                 = ["58.187.120.129/32"]
    user_data_base64            = null
    ext-tags = {
      "fucnt" = "demo-tf"
    }
  }
}
cluster_endpoint_public_access = true

api_gateways = {
  "rest_weather" = {
    aws_api_gateway_rest_api_name        = "rest-489-simple"
    aws_api_gateway_rest_api_description = "porpose for test the rest 489"
    api_gateway_protocol                 = "HTTP"
    authorizers                          = {}
    allow_methods                        = ["POST", "GET"]
    allow_origins                        = ["*"]
    allow_headers                        = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    fail_on_warnings                     = false
    create_domain_name                   = false
    routes = {
      "GET /" = {
        integration = {
          type   = "HTTP_PROXY"
          uri    = "https://max-weather.free.beeceptor.com"
          method = "GET"
        }
      }
    }
    ext-tags = {
      "fucnt" = "demo-tf"
    }
  }
}
