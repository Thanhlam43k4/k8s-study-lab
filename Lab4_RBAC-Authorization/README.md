# Lab: RBAC Authorization (Haven't finished will be updated later)

## Concept
- Role-Based access control (RBAC) is a method of regulating access to computer or network resources based on the roles of individual users within your organization.

- RBAC authorization uses the `rbac.authorization.k8s.io` API group to drive authorization decisions.


- In minikube, to enable RBAC run this command: (By default)

    minikube start --extra-config=apiserver.Authorization.Mode=RBAC



## API Objects

The RBAC API declares four kinds of object : **`Role`**, **`ClusterRoles`**, RoleBinding, and ClusterRoleBinding.


- **`Role`** and **`ClusterRoles`**

- An RBAC **`Role`** or **`ClusterRoles`** contains rules that represent a set of permissions. Permissions are purely additive

- A **`Role`** always sets permissions within a particular namespace; when you create a **`Role`**, you have to specify the namespace it belong in.

- **`ClusterRoles`**, by contrast, is a non-namespaced resource. The resources have different names (**`Role`** and `ClusterRoles`) because a Kubernetes object always has to be either namespaced or not namespaced; it can't be both.

- **`ClusterRoles`** have several uses. You can use a **`ClusterRoles`** to:

    - define permissions on namespaced resources and be granted access within individual namespace(s)
    - define permissions on namespaced resources and be granted access across all namespaces
    - define permissions on cluster-scoped resources 
    
    
-> If you want to define a role within a namespace, use a **`Role`**; if you want to define a role cluster-wide, use a **`ClusterRoles`**.
