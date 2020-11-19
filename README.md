# tekton-cli-install
Installing the OpenShift Pipelines Operator using the CLI

##Procedure

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
$ oc apply -f sub.yaml
```
The Red Hat OpenShift Pipelines Operator is now installed in the default target namespace openshift-operators.
