#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <number of ConfigSpecs>" >&2
    exit 1
fi

num="$1"

for (( i=0; i<num; i++ )); do
    mkdir kyst-configspec/indexed/${i}
    ( cat <<EOF
apiVersion: edge.kyst.kube/v1alpha1
kind: ConfigSpec
metadata:
  name: test-${i}
  labels:
    purpose: argocd-scalability
spec:
  content:
    - spec 1 line 00000000000000000000000000000000000000000000000000000000000000000000000000000001
    - spec 1 line 00000000000000000000000000000000000000000000000000000000000000000000000000000002
    - spec 1 line 00000000000000000000000000000000000000000000000000000000000000000000000000000003
    - spec 1 line 00000000000000000000000000000000000000000000000000000000000000000000000000000004
    - spec 1 line 00000000000000000000000000000000000000000000000000000000000000000000000000000005
    - spec 1 line 00000000000000000000000000000000000000000000000000000000000000000000000000000006
    - spec 1 line 00000000000000000000000000000000000000000000000000000000000000000000000000000007
    - spec 1 line 00000000000000000000000000000000000000000000000000000000000000000000000000000008
    - spec 1 line 00000000000000000000000000000000000000000000000000000000000000000000000000000009
    - spec 1 line 00000000000000000000000000000000000000000000000000000000000000000000000000000010
EOF
    ) > kyst-configspec/indexed/${i}/${i}.yaml
    
done
