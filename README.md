# MSD interview task

## Result

Result of the task can be viewed [at the following page](https://ec2-18-206-236-43.compute-1.amazonaws.com/?refresh=5s).
Code for the task can be found [in the following GitHub repository](https://github.com/danielsentivany/msd-interview).

## How to deploy - step by step

### Prerequisites

- aws credentials in `~/.aws/credentials`:
```
[default]
aws_access_key_id = < YOUR_KEY_ID >
aws_secret_access_key = < YOUR_SECRET_KEY >

[dsentivany]
aws_access_key_id = < ADMIN_KEY_ID >
aws_secret_access_key = < ADMIN_SECRET_KEY >
```
- aws region set in `~/.aws/config`:
```
[default]
region = us-east-1

[profile dsentivany]
region = us-east-1
```
- git
- miniconda3

### How to fix conda

To fix the newest version of conda, ou need to follow
[this guide](https://github.com/conda/conda/issues/8186).

### Deployment and configuration

Both deployment and configuration are 100% automated. It is simply enough
to do the following:
- Clone the repository
```bash
git clone https://github.com/danielsentivany/msd-interview.git
```
- Run the deployment script
```bash
./deploy.sh
```
This script creates new AWS stack (not part of the task), deploys needed components,
configures them. Deployment includes linting.

## Implemented items

### Web server is installed on the machine

More than completed, nginx role is included in the task.

### Forward all traffic from http to https

Done using self-signed certificate. It is not possible to obtain a free one
for Amazon hosted site.

### Server can be accessible from your local computer using hostname not just ip

Done. Server is accessible both via Amazon hostname and public IP.

### Web page shows IP of the machine and whether numbers are odd or even

It shows the IP address as a virtual host.

### Web page shows current date

This entry is clearly visible on the site.

### Web page shows current time

This entry is clearly visible on the site.

### Web page shows usage of CPU of the machine

CPU usage is shown and updated.

### Service management is configured (start, stop, restart, status)

The service used is httpd, it comes with systemd service management.
Supervisord was not used to handle this.
