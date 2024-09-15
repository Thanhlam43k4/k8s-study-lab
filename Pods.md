## Understanding why multiple containers are better than one container running multiple processes.


**Scheduling pods to specific nodes**

- Now imagine you want to deploy a new pod that needs a GPU to perform its work. To ask the scheduler to only choose among the nodes that provide a GPU, you'll add a node selector to the pod's YAML. 

## Annotating Pods (Chú thich Pods)

essence: ban chat

- On the other hand, annotations can hold much larger pieces of information and are primarily meant to be used by tools.

- Annotations are also commonly used when introducing new features to Kubernetes. Usually, alpha and beta versions of new features don't introduce any new fields to API objects.

The benefits of using a Replication COntroller 
-   It makes sure a pod is always running by starting a new pod when an existing one goes missing.
-   When a cluster node fails, it creates replacement replicas for all the pods that were running on the failed node.
-   It enables easy horizontal scailing of pods-both manual and automatic.
-   


