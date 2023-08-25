#!/bin/bash

terraform init

if [ "${1}" = 'eqiad1' ]
then
  datacenter=${1}
elif [ "${1}" = 'codfw1dev' ]
then
  datacenter=${1}
else
  echo "Please enter datacenter."
  echo "Usage:"
  echo "${0} <eqiad1|codfw1dev>"
  exit
fi

if terraform apply -var datacenter=${datacenter} -auto-approve; then
   tf_apply=0
else
   tf_apply=1
fi

cat << EOF > /var/lib/prometheus/node.d/terraform-apply.prom
# HELP terraform_apply 0 if successful
# TYPE terraform_apply untyped
terraform_apply ${tf_apply}
EOF

if terraform destroy -var datacenter=${datacenter} -auto-approve; then
   tf_destroy=0
else
   tf_destroy=1
fi

cat << EOF > /var/lib/prometheus/node.d/terraform-destroy.prom
# HELP terraform_destroy 0 if successful
# TYPE terraform_destroy untyped
terraform_destroy ${tf_destroy}
EOF
