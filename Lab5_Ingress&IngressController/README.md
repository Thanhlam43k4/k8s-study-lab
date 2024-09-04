# Kubernetes Ingress && Ingress Controller Overview


**What is the Ingress ?**

The Ingress is a Kuberentes resource that lets you configure an HTPT load balancer for applications, SSL termination and name-based virtual hosting. running on Kubernetes, represented by one or more `Services`. Such a load balancer is necessary to deliver those applications to clients outside of the Kubernetes cluster.

**What is the Ingress Controller ?**

The Ingress Controller is an application that runs in a cluster and configures an HTTP load balancer according to Ingress resources.The Load Balancer can be a software load balancer running in the cluster or a hardware or cloud load balancer running externally. Different load balancers require different Ingress Controller Implementations.

In the case of NGINX, the Ingress Controller is deployed in a pods along with the load balancer.