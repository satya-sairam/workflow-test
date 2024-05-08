# #!/bin/bash

# # Read inputs.yaml
# sshUserName=$(grep "sshUserName" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')
# host1=$(grep "host1" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')
# host2=$(grep "host2" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')
# host3=$(grep "host3" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')

# # Replace values in outputs.yaml
# sed -i "s/sshUserName: .*/sshUserName: $sshUserName/" newoutput.yaml
# sed -i "s/role: orch/role: orch\n    - host: \"$host1\"/" newoutput.yaml
# sed -i "s/role: controlplane/role: controlplane\n    - host: \"$host2\"/" newoutput.yaml
# sed -i "s/role: compute/role: compute\n    - host: \"$host3\"/" newoutput.yaml

# echo "Replacements done!"
# cat newoutput.yaml


#!/bin/bash

# Copy outputs.yaml to replacement.yaml
cp outputs.yaml replacement.yaml

# Read inputs.yaml
sshUserName=$(grep "sshUserName" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')
host1=$(grep "host1" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')
host2=$(grep "host2" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')
host3=$(grep "host3" inputs.yaml | cut -d ':' -f2 | tr -d '[:space:]')

# Replace values in replacement.yaml
if [ -n "$sshUserName" ] || [ -n "$host1" ] || [ -n "$host2" ] || [ -n "$host3" ]; then
    sed -i "s/sshUserName: .*/sshUserName: $sshUserName/" replacement.yaml
    sed -i "s/role: orch/role: orch\n    - host: \"$host1\"/" replacement.yaml
    sed -i "s/role: controlplane/role: controlplane\n    - host: \"$host2\"/" replacement.yaml
    sed -i "s/role: compute/role: compute\n    - host: \"$host3\"/" replacement.yaml

    echo "Replacements done!"
    # Print out the contents of replacement.yaml
    cat replacement.yaml
else
    echo "No values found in inputs.yaml to replace."
fi
