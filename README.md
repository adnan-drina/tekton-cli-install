# tekton-cli-install
Installing the OpenShift Pipelines Operator using the CLI

Ensure that the pipeline operator exists in the channel catalog.
```shell script
oc get packagemanifests -n openshift-marketplace | grep pipelines
```

Query the available channels for pipeline operator
```shell script
oc get packagemanifest -o jsonpath='{range .status.channels[*]}{.name}{"\n"}{end}{"\n"}' -n openshift-marketplace openshift-pipelines-operator-rh
```

Discover whether the operator can be installed cluster-wide or in a single namespace
```shell script
oc get packagemanifest -o jsonpath='{range .status.channels[*]}{.name}{" => cluster-wide: "}{.currentCSVDesc.installModes[?(@.type=="AllNamespaces")].supported}{"\n"}{end}{"\n"}' -n openshift-marketplace openshift-pipelines-operator-rh
```

Check the pipeline operator information for additional details
```shell script
oc describe packagemanifests/openshift-pipelines-operator-rh -n openshift-marketplace
```

## Procedure

- Create a Subscription object YAML file to subscribe a namespace to the Red Hat OpenShift Pipelines Operator, for example, sub.yaml:

**Example Subscription**

```yaml
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: openshift-pipelines-operator
  namespace: openshift-operators
spec:
  channel:  <channel name> #Specify the channel name from where you want to subscribe the Operator
  name: openshift-pipelines-operator-rh #Name of the Operator to subscribe to.
  source: redhat-operators #Name of the CatalogSource that provides the Operator.
  sourceNamespace: openshift-marketplace #Namespace of the CatalogSource. Use openshift-marketplace for the default OperatorHub CatalogSources.
```

-   Create the Subscription object:

```bash
$ oc apply -f tekton-sub.yaml
```
The Red Hat OpenShift Pipelines Operator is now installed in the default target namespace openshift-operators.
