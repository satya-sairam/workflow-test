#!/bin/bash

# Read inputs.yaml
sshUserName=$(grep "sshUserName" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')
host1=$(grep "host1" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')
host2=$(grep "host2" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')
host3=$(grep "host3" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')

# Replace values in outputs.yaml and store in a variable
replaced_yaml=$(sed "s/sshUserName: .*/sshUserName: $sshUserName/" newoutput.yaml)
replaced_yaml=$(echo "$replaced_yaml" | sed "s/role: orch/role: orch\n    - host: \"$host1\"/")
replaced_yaml=$(echo "$replaced_yaml" | sed "s/role: controlplane/role: controlplane\n    - host: \"$host2\"/")
replaced_yaml=$(echo "$replaced_yaml" | sed "s/role: compute/role: compute\n    - host: \"$host3\"/")

# Echo the replaced YAML content stored in the variable
echo "$replaced_yaml"

echo "Replacements done!"

