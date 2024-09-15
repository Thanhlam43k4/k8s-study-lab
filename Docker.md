# Container Overview

## Main Concepts

### What is a Container?
A container is a standardized unit of software that packages code and its dependencies, ensuring an application runs consistently across different computing environments. Containers are lightweight, portable, and share the host system’s kernel, making them more efficient than traditional virtual machines.

## Traditional Deployments vs Container Deployments

## Traditional Deployments

- **Run all applications on one physical host**: 
  - In traditional deployments, multiple applications run on a single physical host without proper resource sharing mechanisms.
  - This can lead to resource allocation and performance issues between applications.

## Virtual Machines (VM)

- **VM Overview**:
  - Virtual Machines contain a **full operating system (OS)**, libraries, and applications.
  - VMs resolve resource allocation issues by isolating applications within separate environments.
  
- **Drawbacks**:
  - VMs are **heavier** and require more resources due to each having its own OS.
  - **High resource consumption** because the entire operating system needs to be replicated for each VM.

## Container Deployment

- **What is a Container?**
  - Containers are similar to virtual machines, but instead of containing a full OS, they **share the host OS** between applications.
  - Containers are **lightweight** and use fewer resources compared to virtual machines since they share the host system's kernel.

- **Advantages**:
  - Containers are **faster** to start, run, and stop.
  - They require less overhead than virtual machines, making them more efficient for modern cloud and microservice architectures.


### Key Components of Containers:
1. **Container Image**: A read-only blueprint that includes everything needed to run an application: code, libraries, environment variables, and configuration files.
2. **Container Runtime**: Software that runs containers by creating and managing instances from images (e.g., Docker, containerd, CRI-O).
3. **Container Orchestration**: Tools that manage the deployment, scaling, and networking of containers across multiple hosts. Examples include Kubernetes.

## DockerFile

- DockerFile là 1 file text chứa các mô tả tuần tự về cách thức tạo ra 1 Image (nơi chứa các Image Layer).
    FROM (base Image)
    ENV (environment variable)
    RUN (chạy shell command trước kho contaier được tạo ra)
    EXPOSE (mở port từ container đến virtual network)
    CMD (Chạy shell command sau khi container được tạo ra)
    
- Build Image

    ```
    docker image build -t <docker-image-name> . 

- Docker sử dụng theo tiêu chuẩn OCI (Open Container Initiative) cho image format và runtime. OCI là một tiêu chuẩn được quản lý bởi Linux Foundation, với mục tiêu tạo ra một tiêu chuẩn chung cho container images và container runtimes. Docker images hiện tại được tạo ra và tương thức với tiêu chuẩn OCI.

## Container Runtime

1. Container Execution: It launches and stops containers by creating isolated processes.

2. Image Management: Pulls container images from a container registry (like DockerHub) and manages the image cache on the host

3. Resource Isolation: Provides CPU, memory, and I/O isolation to containers using technologies like namespaces and cgroups.

4. Security: Ensures that containers run in a secure, isolated environment, preventing them from interfering with the host system or other containers.

## Popular Container Runtimes

1. Docker: A widely-used container runtime that was intially created in the container ecosystem.

2. containerd: An industry-standard container runtime, used by Docker under the hood. It focuses solely on running containers without the extra orchestration tools Docker includes.

## Persistent data

- Đặc tính của container là không thay đổi, chỉ re-deplop
- Là cách tách phân dữ liệu ra để lưu trữ trên host
- Trong container có 2 cách lưu trữ trên host

  - Volume: Tạo ra vùng nhớ ảo và lưu trữ trên host, định nghĩa vùng nhớ đó tên là gì. Khi tạo 1 vùng nhớ riêng như vậy, thì khi chúng ta xóa hay thay đổi cấu hình để tạo ra 1 container mới thì sẽ không bị ảnh hưởng gì tới vùng nhớ ảo.
  - Bind Mount: Link 1 folder path trên container với 1 thư mục trên host.
### Container Network 

## Bridge Network

- The default network mode is the bridge network. In this mode, containers on the same host can communicate with each other through a virtual network bridge. Docker creates a virtual Ethernet bridge  called `docker0` on the host which connects the containers.

- Không tự động giao tiếp với container trên mạng khác

**Advantages**

- Cách ly mạng giữa các container trên các bridge khác nhau.

- Dễ sử dụng với các ứng dụng đơn giản.

**Disadvantages**

- Các container chỉ có thể giao tiếp với nhau trong cùng một bridge.

- Giao tiếp ra ngoài cần NAT.


## Host Network

**Features**

- Container sử dụng mạng của host(không cách ly mạng).

- Container truy cập trực tiếp vào mạng host và dùng chung địa chỉ IP.

**Advantages**

- Hiệu suất mạng cao hơn vì không cần NAT.

- Phù hợp với các ứng dụng yêu cầu hiệu suất mạng cao.

**Disadvantages**

- Mất tính cô lập mạng giữa container và host

- Nguye cơ bảo mật do container có quyền truy cập vào mạng của host.

## Overlay Network

**Features**

- Mạng cho phép container trên nhiều host khác nhau giao tiếp với nhau.

- Thường dùng trong Docker Swarm hoặc Kubernetes.

- Hỗ trợ giao tiếp giữa các node trong cluster.

**Advantages**

- Phù hợp cho môi trường multi-host.

- Dễ cấu hình khi sử dụng Docker Swarm hoặc Kubernetes.

**Disadvantages**

- Hiệu suất thấp hơn do phụ thuộc vào lớp mạng phủ (overlay)

- Cần cấu hình thêm cho môi trường không Swarm.


## Macv an Network

**Features**

- Mỗi container có địa chỉ MAC riêng

- Container xuất hiện như một thiết bị vật lý trên mạng, giao tiếp trực lý với mạng vật lý.

**Advantages**

- Container có thể giao tiếp trực tiếp với các thiết bị trong mạng vật lý.

- Không cần NAT.

- Hiệu suất cao vì không có lớp ảo hóa mạng.

**Disadvantage**

- Khó cấu hình hơn so với các loại mạng khá.

- Không phù hợp cho tất cả các hạ tầng của mạng.


## Routing giữa các mạng

Docker hỗ trợ việc định tuyến lưu lượng giữa các mạng Docker. Ví dụ, nếu bạn có hai mạng Docker khác nhau và cần container trên mạng này giao tiếp với container trên mạng khác, bạn có thể sử dụng cầu nối (bridge) hoặc cấu hình mạng overlay trong Docker Swarm.

## Định tuyến tới mạng ngoài

Khi container cần truy cập vào mạng bên ngoài (internet), Docker sử dụng NAT để chuyển tiếp lưu lượng từ container qua mạng bridge và ra ngoài. Lưu lượng được định tuyến từ container qua cầu nối (bridge) đến máy chủ Docker và từ đó ra ngoài mạng


## Docker Stats

- You can use the `docker stats` command to live stream a container's runtime metrics.The command suppports CPU, memory usage, memory limit, and network IO metrics.


## Docker compose

- Docker compose là một công cụ hỗ trợ việc định nghĩa và chạy các ứng dụng Docker đa container. Với Docker Compose,bạn có thể cấu hình các dịch vụ, mạng và volumes trong một file cấu hình và sau đó sử dụng một lệnh duy nhất để khởi động hoặc dừng tất cả các container liên quan. 

**Network và Volumes**

- Docker Compose tự động tạo một mạng riêng cho các dịch vụ trong ứng dụng của bạn, cho phép các container giao tiếp với nhau bằng cách sử dụng dịch vụ như hostname.
- Volumes cũng có thể được định nghĩa trong file cấu hình để lưu trữ dữ liệu bền vững.

## CNI Plugins (Calico, Flannel, Weave)

- CNI(Container Network Interface) plugins like Calico, Flannel, and Weave are used primarily in Kubernetes environments to manage networking for containers across multiple hosts. They provide advanced networking features and are suitable for production-grade container orchestration.

  - Scopes: CNI plugins are designed for Kubernetes clusters and handle network connectivity across multiple nodes.
  - Networking: These plugins enable overlay networking, which allows containers running on different nodes to communicate as if they were on the same local network. They also offer features like network policies, service discovery, and IP address management.

--> Essential for managing advanced networking in multi-host or Kubernetes environments, offering features like overlay networking, network policies, and cross-host communication.
