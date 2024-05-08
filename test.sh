#!/bin/bash

# Read inputs.yaml
sshUserName=$(grep "sshUserName" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')
host1=$(grep "host1" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')
host2=$(grep "host2" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')
host3=$(grep "host3" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')

# Replace values in outputs.yaml
sed -i "s/sshUserName: .*/sshUserName: $sshUserName/" newoutput.yaml
sed -i "s/role: orch/role: orch\n    - host: \"$host1\"/" newoutput.yaml
sed -i "s/role: controlplane/role: controlplane\n    - host: \"$host2\"/" newoutput.yaml
sed -i "s/role: compute/role: compute\n    - host: \"$host3\"/" newoutput.yaml

echo "Replacements done!"
cat newoutput.yaml


