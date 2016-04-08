DKAN AWS AutoScale CloudFormation Role
=========

Sets up creating DKAN instances in AWS using CloudFormation. Sets up an instance with ElasticLoadBalancer in front of an AutoScale Group of EC2 webservers that connect to an RDS instance.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }
