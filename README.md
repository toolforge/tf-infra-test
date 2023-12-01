# Overview

This code can be used to test that we can deploy all the infrastructure that we expect to be able to.

# Usage
The tofu-test.sh script should be referenced from a cron that has write access to /var/lib/prometheus/node.d/

Example:
```
0 0 * * * cd /root/tf-infra-test ; /bin/bash /root/tf-infra-test/tofu-test.sh <eqiad1|codfw1dev>
0 0 * * * systemd-cat -t tf-infra-test /root/tf-infra-test/tofu-test.sh <eqiad1|codfw1dev> # apparently this is the one now (20231201)
```

This can also be run manually by running
```
tofu init
tofu apply -var datacenter=<eqiad1|codfw1dev>
tofu destroy -var datacenter=<eqiad1|codfw1dev>
```

# Tests at time of writing
- VM deploy
- Volume deploy
- Volume attachment to VM
- Trove (MySQL) deploy
- Trove (Mariadb) deploy
- Trove (Postgresql) deploy
- Floating IP allocation
- Floating IP attachment to VM
- Magnum cluster deploy
- Magnum cluster template deploy
- Security group deploy
- Security group attachment to VM
- Prefix puppet hiera deploy
- Web proxy deploy
