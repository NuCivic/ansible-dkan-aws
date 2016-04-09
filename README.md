DKAN on AWS 
=========

Sets up creating DKAN instances in AWS using CloudFormation. Sets up an instance with ElasticLoadBalancer in front of an AutoScale Group of EC2 webservers that connect to an RDS instance.

This currently includes two roles:

* ``dkan_aws_as_cf`` - CloudFormation template for setting up new instances of a HA DKAN site
* ``dkan_aws_network`` - Creates VPC for instances created by ``dkan_aws_as_cf``


Example Playbook
----------------

This includes two example projects, the cities "Mos Eisley" and "Cloud City".

To spin up the stack-wide VPC:

```
ansible-playbook vpc.yml
```

To spin up instances for the two cities:

```
ansible-playbook instances.yml
```

To change the number of default webservers for "Cloud City", add ``webserver_capicity: 3`` to ``inventory/host_vars/bespin-cloud-city`` and rerun the ``instances.yml`` playbook.  

TODO:
----------------

* run instances
* build up VPC
