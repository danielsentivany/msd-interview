#!/bin/bash

set -eou pipefail

CONDA_PREFIX=./.cvenv

if ! source activate ${CONDA_PREFIX} 2>/dev/null; then
    conda env create -f environment.yml -p ${CONDA_PREFIX}
fi

source activate ${CONDA_PREFIX}
conda env update -f environment.yml

ansible-lint -p site.yml
yamllint -f parsable .

# Not part of the task
aws cloudformation deploy                                       \
       --template-file template.yml                             \
       --stack-name dsentivany-msd                              \
       --no-fail-on-empty-changeset                             \
       --parameter-overrides                                    \
            KeyName=dsentivany-msd                              \
            InstanceType=t2.micro                               \
            AMI=ami-000db10762d0c4c05                           \
       --profile dsentivany

ansible-playbook site.yml --tags nginx,httpd
