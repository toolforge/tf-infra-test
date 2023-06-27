#!/bin/bash

terraform init

if terraform apply -auto-approve; then
   tf_apply=0
else
   tf_apply=1
fi

cat << EOF > /var/lib/prometheus/node.d/terraform-apply.prom
# HELP terraform_apply 0 if successful
# TYPE terraform_apply untyped
terraform_apply ${tf_apply}
EOF

if terraform destroy -auto-approve; then
   tf_destroy=0
else
   tf_destroy=1
fi

cat << EOF > /var/lib/prometheus/node.d/terraform-destroy.prom
# HELP terraform_destroy 0 if successful
# TYPE terraform_destroy untyped
terraform_destroy ${tf_destroy}
EOF
