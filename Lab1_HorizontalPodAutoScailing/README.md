# Horizontal Pod Autoscaling (HPA) Lab

## Overview
In this lab, we will configure the Horizontal Pod Autoscaler (HPA) to automatically adjust the number of pods in a Kubernetes deployment based on CPU utilization. The lab involves deploying a simple application, setting up HPA, generating load, and observing the scaling behavior.

## Objectives
- Deploy a sample application in Kubernetes.
- Configure the HPA to scale the application pods based on CPU usage.
- Generate load on the application to test the autoscaling feature.
- Monitor and verify the scaling actions of HPA.

## Prerequisites
- A running Kubernetes cluster.
- Kubernetes command-line tool (`kubectl`) installed and configured to communicate with your cluster.
- Basic understanding of Kubernetes concepts such as Deployments, Services, and Pods.

## Lab Steps

### 1. Deploy a Microservice Application

1.1 **Create a Deployment:**
   - Deploy a simple microservice application with a defined resource request and limit.

1.2 **Expose the Deployment:**
   - Create a Kubernetes Service to expose the `Frontend` deployment.
    
   - Create a ingress to expose externally `Frontend Service` using a domain name `webapp-tlam.cloud`.

1.3 **Addons Metrics server**
   -   I use Minikube for test/dev environment so i use command:
            
                minikube addons enable metrics-server

   -   Metrics-Server Pod in minikube

   <img align = "center" alt = "coding" width = "600" src = "https://blogger.googleusercontent.com/img/a/AVvXsEjeDfFvG4jlRM8Z1Z47N6jKE3aHGowghBU6tsYY-DdbXDOgcv0RpxXVajXepB1AHfKfjv-f46ZHmO6W3tQ-jYQEKNQcql_cEbBFJE8q2588EqEEEzNC1AZBg3V8KJNTDm-zzL6GmFK6v5Wl1BbyS3BR9AfAfttoESjekFR8A6pwGgUFqoGOnqvuGXcLGXXF">  
   
### 2. Configure Horizontal Pod Autoscaler

2.1 **Set Up HPA:**
   - Configure HPA to monitor the CPU usage of the `Frontend` pods and scale the number of replicas between 1 and 10 based on the average CPU utilization.

   - By short command:

            kubectl autoscale deployment frontend-deploy --cpu-percent=50 --min=1 --max=5

   - By Manifest File

   <img align = "center" alt = "coding" width = "600" src = "https://blogger.googleusercontent.com/img/a/AVvXsEhF1xnqXcP5I5RHQRRwFMiziHcFWhF8A6xvyK6dgvepC3PHtiFgiA5mzmZuRL2tePr2iWKT7mmn0EEB4wBaV1KfJ00VpNlaKJq9LhOKPzjdoGnA1FfmV3NhRuj56HOA_yXXRaq1d34c0zycU0qMmWtmh_3hVgrbZQkBTaz6Jyy4Rho_oFz69mVRJFpqZymh">
   
### 3. Generate Load to Trigger Scaling

3.1 **Load Generation:**
   - Generate traffic to the `Frontend` application to simulate a real-world workload.

   - To do this, you'll start a different Pod to act as a client. The container within the client Pod runs in an infinite loop, sending queries to the frontend service.

   - Run this in a separate terminal so that the load generation continues and you can carry on with the rest of the steps
      
         kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://
         frontend-svc; done"


            docker run -it --rm busybox:1.28 /bin/sh -c "while sleep 0.01; do wget -q -O- http://3.113.17.92; done"


3.2 **Monitor HPA and Scaling:**
   - Monitor the HPA metrics and the number of pods to observe how the system scales up or down in response to the load.

   -After Load Generator Active ( Scale Up From 1 Pod -> 2 Pods)
   
   <img align = "center" alt = "coding" width = "600" src = "https://blogger.googleusercontent.com/img/a/AVvXsEhjlKEEK4HR_8GKHNEWl5s0-z5KMBdiiO8D3O8kc8GOBnhXGBjYm3SyTNFqmqf63pbWz3fEcrO5DYFf-VcUYnBaMGSD7u8z2psZQj4Xeo3FHlzU_SQAtdXB5yqzlz0IPyaApkdDQSaLHDKeG4C7pn7vkVaqFGvAN7SqN97CasPMAnESsvlfZh_e0MdR5jOp">

   -After Load Generator Deactive and Cooldown Time (Scale Down From 2 Pods -> 1 Pod)

   <img align = "center" alt = "coding" width = "600" src = "https://blogger.googleusercontent.com/img/a/AVvXsEic9FLCE-rBHlmiQ2qUYx0zWYqePG7oYcHSzkJZ-HaX864d6sBs-9qhPUtPZNTsJwZpDcV2OrL7QS23Xbf11IFKO8FhytodzcvgelzzsopiXFAvZu4FlHOMSb7oEoq2no9DyAKmkGs4OFvM2kS533Lx1xRgFA1DcFcRXuFSIGo8bhUJkoNRzRzAzHwWjZcU">

## Expected Outcomes
- The number of pods in the NGINX deployment should increase as CPU usage rises and decrease when the load is reduced.
- You will observe the HPA's decision-making process through `kubectl` commands, which show how the pod count changes in response to CPU usage.

## Cleanup
After completing the lab, clean up the resources to avoid unnecessary charges and clutter in your cluster:
- Delete the HPA, Deployment, and Service.
- Remove any load generator pods used during the lab.


## Conclusion
This lab provides hands-on experience with configuring and observing Horizontal Pod Autoscaling in Kubernetes. By understanding how HPA works and interacts with your applications, you can better design and manage scalable and resilient applications in your Kubernetes clusters.
