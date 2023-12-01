#!/bin/bash

cd $(dirname "$0")

tofu init

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

if tofu apply -var datacenter=${datacenter} -auto-approve; then
   tf_apply=0
else
   tf_apply=1
fi

cat << EOF > /var/lib/prometheus/node.d/tofu-apply.prom
# HELP tofu_apply 0 if successful
# TYPE tofu_apply untyped
tofu_apply ${tf_apply}
EOF

if tofu destroy -var datacenter=${datacenter} -auto-approve; then
   tf_destroy=0
else
   tf_destroy=1
fi

cat << EOF > /var/lib/prometheus/node.d/tofu-destroy.prom
# HELP tofu_destroy 0 if successful
# TYPE tofu_destroy untyped
tofu_destroy ${tf_destroy}
EOF
