# OverView
Role-based access control (RBAC) is a method of regulating access to computer or network resources based on the roles of individual users within your organization. 

RBAC authorization uses the `rbac.authorization.k8s.io` API group to drive authorization decisions, allowing you to dynamically configure policies through the Kuberenetes API.

To enable RBAC, start the API server with the --authorization-mode flag set to a comma-separated list that includes RBAC.

# API objects 

The RBAC API declares four kinds of Kubernetes objects: Role, ClusterRole, RoleBinding and ClusterRoleBinding.


# Role and ClusterRole

An RBAC Role or ClusterRole contains rules that represent a set of permissions. permissions are purely additive.

If you want to define a role within a namespace, use a Role; if you want to define a role cluster-wide, use a ClusterRole.

# RoleBinding and ClusterRoleBinding

A role binding grants the permissions defined in a role to a user or set of users. It holds a list of subjects(users, groups, or service accounts), and a reference to the role being granted. A `RoleBinding` grants permissions within a specific namespace whereas a `ClusterRoleBinding grants that access cluster-wide`.

