# Lab: Implementing Network Policies in Kubernetes

## Objective

This lab aims to secure inter-pod communication within a Kubernetes cluster using Network Policies. You will create and apply three Network Policies to control traffic between different components of your application, ensuring that only allowed communication paths are open.

## Prerequisites

- A running Kubernetes cluster.
- `kubectl` configured to interact with your cluster.
- Basic understanding of Kubernetes concepts, including Pods, Deployments, Services, and Network Policies.

## Lab Steps

### 1. Deploy a Sample Application

Deploy a sample application with multiple components (frontend and backend). Ensure that each component is exposed via a Service to facilitate communication.

### 2. Create Network Policies

Create and apply the following Network Policies to control traffic within your cluster:

- **`allowIngressFrontend`**: This policy allows inbound traffic to the frontend pods from specific sources. It ensures that only authorized sources can access the frontend service.

- **`allowFrontendtoBackend`**: This policy permits traffic from the frontend pods to the backend pods. It ensures that the frontend service can communicate with the backend service on the appropriate port.

- **`allowInterconnect`**: This policy allows communication between backend pods and any other specified pods or services within the cluster. It can be used to control and restrict internal pod-to-pod traffic as required.

### 3. Test the Network Policies

Verify that the Network Policies are working as expected:

- **Test Allowed Communication**: Use a test pod to check if traffic is correctly allowed according to the policies. Ensure that the frontend can access the backend and that any other allowed communications are functioning.

- **Test Denied Communication**: Use a separate test pod to verify that traffic not permitted by the policies is blocked. Ensure that unauthorized communication paths are indeed restricted.

### 4. Clean Up

After testing, clean up the resources created during the lab to maintain a tidy cluster environment.

## Conclusion

In this lab, you successfully implemented and tested Network Policies in Kubernetes. By applying the `allowIngressFrontend`, `allowFrontendtoBackend`, and `allowInterconnect` policies, you have secured inter-pod communication and ensured that only the intended traffic is allowed in your cluster.
