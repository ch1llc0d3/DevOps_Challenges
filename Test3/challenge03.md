Coding Challenge: Basic Infrastructure Provisioning
Problem Statement:

You are tasked with setting up a basic infrastructure for a web application on AWS using Terraform. The infrastructure should include the following components:

    Virtual Private Cloud (VPC):
        Create a VPC with a CIDR block of your choice.
        Include two public subnets and two private subnets.
        Configure appropriate route tables and associations.

    Web Server Instances:
        Launch two EC2 instances to act as web servers.
        Use the latest Amazon Linux 2 AMI.
        Place the instances in the private subnets.
        Allow incoming traffic on port 80 (HTTP) only from alb

    Load Balancer:
        Set up an Application Load Balancer (ALB) to distribute traffic to the web servers.
        Configure the ALB to listen on port 80.

    Security Groups:
        Define security groups for the web servers and the ALB with necessary ingress and egress rules.

    Outputs:
        Output the DNS name of the ALB.