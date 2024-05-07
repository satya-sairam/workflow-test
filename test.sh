#!/bin/bash

echo "Hello"

read -r username host1 host2 host3 < "$inputs.yaml"
sed -i "s/sshUserName: .*/sshUserName: $username/" "$newoutput.yaml"


sed -i "/^hosts:/,/^-/ {
    /^- host:/ {
        s/\(\".*\"\)/\"$host1\"/
        n
        s/\(\".*\"\)/\"$host2\"/
        n
        s/\(\".*\"\)/\"$host3\"/
    }
}" "$newoutput.yaml"

echo "Replacement completed successfully."