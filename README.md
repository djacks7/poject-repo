## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

  -https://github.com/djacks7/project-repo/blob/main/Diagrams/Azure%20Network%20Diagram.png (Diagrams/AzureNetworkDiagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the .yml file may be used to install only certain pieces of it, such as Filebeat.

  https://github.com/djacks7/project-repo/blob/main/Ansible/Elk-Vm%20Configuration
  (Ansible/Elk-VM Configuration)

This document contains the following details:
- Description of the Network topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly reliable, in addition to restricting traffic to the network. The load balancer will protect availability of the network. This JumpBox will also protect the availability of the network because it will be the only device on the network that will accept requests from outside of the network. It will also serve as an Administrative Workstation, to preform any administrative task.  

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
- Filebeat watches for log files/locations and log events 
- Metricbeat records metric and statistical date from the server and services that are running on the server

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
|Jump Box  | Gateway  | 10.0.0.4   | Linux            |
|DVWA–WEB1 | Docker   | 10.0.0.8   | Linux            |
|DVWA-WEB2 | Docker   | 10.0.0.9   | Linux            |
|ELK-SERVER| Elk      | 10.1.0.5   | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
-Personal IP Address

Machines within the network can only be accessed via SSH.
-The JumpBox VM is the only machine that can connect to the ELK-Server via SSH using the Private IP of the server (10.1.0.5)

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | No                  | Personal IP Only     |
| Web 1    | No                  | 10.0.0.4             |
| Web 2    | No                  | 10.0.0.4             |
| Elk      | No                  | 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- The main advantage of automating this configuration is the simplification of the deployment. Creation of playbook allowed for the servers to be deployed using only a few commands. 

The playbook implements the following tasks:
- Creation of a new VM in the LAN. Also, giving this new VM a Private and Public IP address, take note of both. The private IP address will be used to SSH into the server and the Public IP address will be used to access the date from the filebeat and metricbeat services that will be installed after running the playbooks through Kibana.  
- Use the ‘apt’ module to install ‘docker.io’ and ‘pip3’ 
- Use the ‘sysctl’ module to increase the memory on the server
- Download and launch a ‘docker elk’ container using image ‘sebp/elk:761’ and establish the published ports – 5601,9200, and 5044
- Before running this playbook ensure that the ‘host’ file [etc/ansible/hosts] is edited to have your Elk server IP under the group name ‘elk’ 
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/djacks7/project-repo/blob/main/Diagrams/DockerPS.PNG (Diagram/dockerps.png)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- [10.0.0.8, 10.0.0.9] 

I have installed the following Beats on these machines:
- Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:

-Filebeat is a lightweight shipper for forwarding and centralizing log data. Filebeat monitors log files or locations you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing

-Metricbeat collects metrics from the operating system and from services running on the server. Metricbeat then takes the metrics and statistics that it collects and ships them to the output that you specify. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat.yml and metricbeat.yml configuration files to /etc/ansible/files directory.
- Update configuration files to include the IP address of the elk server under elasticsearch and kibana sections [line #1106 and #1806 for filebeat]
- Update the hosts file [/etc/ansible/hosts] to include the Private IP address of the Elk server under group name [elk] and the Private IP addresses for Web 1 and Web 2 VMs under group name [webservers]
- Run the playbook, and navigate to Elk server to check that the installation worked as expected. [use command] 'docker ps'
- Navigate to your browser to verify Kibana is receiving logs
 [use website http://IP-Address-to-Elk-Server:5601/app/kibana]


