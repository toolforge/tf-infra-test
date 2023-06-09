# Overview

This code can be used to test that we can deploy all the infrastructure that we expect to be able to.

# Usage
```
terraform init
terraform apply
terraform destroy
```

# Tests at time of writing
VM deploy
Volume deploy
Volume attachment to VM
Trove (MySQL) deploy
Trove (Mariadb) deploy
Trove (Postgresql) deploy
Floating IP allocation
Floating IP attachment to VM
Magnum cluster deploy # T333874
Magnum cluster template deploy
Security group deploy
Security group attachment to VM
Prefix puppet hiera deploy
Web proxy deploy
