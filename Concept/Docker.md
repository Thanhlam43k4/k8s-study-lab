# Tổng Quan về Container

## Khái Niệm Chính



### Các Thành Phần Chính của Container:
1. **Container Image**: Một blueprint read-only bao gồm tất cả các yếu tố cần thiết để chạy một ứng dụng: mã nguồn, thư viện, biến môi trường, và tệp cấu hình.
2. **Container Runtime**: Phần mềm chạy các container bằng cách tạo và quản lý các phiên bản từ các image (ví dụ: Docker, containerd, CRI-O).
3. **Container Orchestration**: Các công cụ quản lý việc triển khai, mở rộng, và kết nối mạng của các container trên nhiều máy chủ. Ví dụ bao gồm Kubernetes.

## Dockerfile

- Dockerfile là một tệp văn bản chứa các mô tả tuần tự về cách tạo ra một Image (nơi chứa các Image Layer).
    - `FROM` (base Image)
    - `ENV` (biến môi trường)
    - `RUN` (chạy lệnh shell trước khi container được tạo ra)
    - `EXPOSE` (mở cổng từ container đến mạng ảo)
    - `CMD` (chạy lệnh shell sau khi container được tạo ra)
    
- Xây Dựng Image

    ```bash
    docker image build -t <docker-image-name> .
    ```

- Docker sử dụng theo tiêu chuẩn OCI (Open Container Initiative) cho định dạng image và runtime. OCI là một tiêu chuẩn được quản lý bởi Linux Foundation, nhằm tạo ra một tiêu chuẩn chung cho container images và container runtimes. Docker images hiện tại được tạo ra và tương thích với tiêu chuẩn OCI.

## Triển Khai Truyền Thống So với Triển Khai Container

### Triển Khai Truyền Thống

- **Chạy tất cả ứng dụng trên một máy chủ vật lý**:
  - Trong các triển khai truyền thống, nhiều ứng dụng chạy trên một máy chủ vật lý mà không có các cơ chế chia sẻ tài nguyên hợp lý.
  - Điều này có thể dẫn đến các vấn đề về phân bổ tài nguyên và hiệu suất giữa các ứng dụng.

### Máy Ảo (VM)

- **Tổng Quan về VM**:
  - Máy ảo chứa một **hệ điều hành (OS)** đầy đủ, thư viện và ứng dụng.
  - Máy ảo giải quyết vấn đề phân bổ tài nguyên bằng cách cách ly các ứng dụng trong các môi trường riêng biệt.
  
- **Nhược Điểm**:
  - Máy ảo **nặng hơn** và yêu cầu nhiều tài nguyên hơn do mỗi máy ảo có hệ điều hành riêng.
  - **Tiêu tốn tài nguyên cao** vì toàn bộ hệ điều hành cần được sao chép cho mỗi máy ảo.

## Triển Khai Container

- **Container là gì?**
  - Container tương tự như máy ảo, nhưng thay vì chứa một hệ điều hành đầy đủ, chúng **chia sẻ hệ điều hành của máy chủ** giữa các ứng dụng.
  - Container là **nhẹ hơn** và sử dụng ít tài nguyên hơn so với máy ảo vì chúng chia sẻ kernel của hệ thống máy chủ.

- **Ưu Điểm**:
  - Container khởi động, chạy và dừng **nhanh hơn**.
  - Chúng yêu cầu ít overhead hơn so với máy ảo, làm cho chúng hiệu quả hơn cho môi trường đám mây hiện đại.
  - Container không bao gồm hệ điều hành của riêng mình. Thay vào đó, chúng dựa vào Kernel của hệ thống máy chủ để quản lý các cuộc gọi hệ thống, tài nguyên phần cứng, và giao tiếp giữa các tiến trình.
  - Kernel Linux cung cấp sự cách ly giữa các container bằng cách sử dụng một tính năng gọi là "namespace". Mỗi container có cái nhìn riêng biệt về các tài nguyên hệ thống, chẳng hạn như hệ thống tệp, giao diện mạng, ID tiến trình.
  
- **Cô Lập Ứng Dụng**:

  - Container Sandbox: Trong môi trường container, mỗi container hoạt động trong một "sandbox" riêng biệt, tách biệt với các container khác và hệ điều hành chủ. Điều này giúp giảm thiểu rủi ro và bảo vệ hệ thống chủ khỏi các vấn đề như lỗ hổng bảo mật hoặc lỗi trong ứng dụng.
  
- **Namespace**

  - Mỗi container có môi trường thực thi riêng biệt theo các namespace:
    - PID namespace
    - Network namespace
    - Mount namespace
    - UTS namespace

- **Cgroups**

  - Docker sử dụng Cgroups (control groups) để giới hạn việc sử dụng tài nguyên hệ thống (CPU và I/O) giữa các container.

- Mạng Overlay cho phép các container giao tiếp bằng cách ánh xạ các địa chỉ IP qua các nút khác nhau. Mỗi container được gán một địa chỉ IP duy nhất trong mạng overlay, và Docker xử lý việc định tuyến các gói giữa các nút, cho phép kết nối liền mạch.

## Container Runtime

1. **Thực Thi Container**: Khởi chạy và dừng các container bằng cách tạo các tiến trình cách ly.
2. **Quản Lý Image**: Kéo các container images từ một container registry (như DockerHub) và quản lý bộ nhớ cache của image trên máy chủ.
3. **Cách Ly Tài Nguyên**: Cung cấp cách ly CPU, bộ nhớ và I/O cho các container bằng cách sử dụng các công nghệ như namespaces và cgroups.
4. **Bảo Mật**: Đảm bảo rằng các container chạy trong một môi trường an toàn, cách ly, ngăn ngừa chúng can thiệp vào hệ thống máy chủ hoặc các container khác.

## Các Container Runtimes Phổ Biến

1. **Docker**: Một container runtime phổ biến được tạo ra trong hệ sinh thái container.
2. **containerd**: Một container runtime chuẩn công nghiệp, được Docker sử dụng dưới lớp, tập trung vào việc chạy container mà không có các công cụ orchestration bổ sung như Docker.

## Persistent Data

- Đặc tính của container là không thay đổi, chỉ tái triển khai.
- Là cách tách phân dữ liệu ra để lưu trữ trên máy chủ.
- Trong container có 2 cách lưu trữ trên máy chủ:

  - **Volume**: Tạo ra vùng nhớ ảo và lưu trữ trên máy chủ, định nghĩa vùng nhớ đó tên là gì. Khi tạo một vùng nhớ riêng như vậy, khi xóa hay thay đổi cấu hình để tạo ra một container mới thì sẽ không bị ảnh hưởng gì tới vùng nhớ ảo.

    *Ví dụ*

    ```bash
    docker run -d \
          --name my-container \
          -v my-volume:/data \
          nginx
    ```
    
  - **Bind Mount**: Liên kết một thư mục trên container với một thư mục trên máy chủ.

    *Ví dụ*

    ```bash
    docker run -d \
         --name my-nginx \
         -v /path/to/nginx.conf:/etc/nginx/nginx.conf \
         nginx
    ```
### Container Network 

## Bridge Network

- Chế độ mạng mặc định là bridge network. Trong chế độ này, các container trên cùng một máy chủ có thể giao tiếp với nhau qua một bridge mạng ảo. Docker tạo ra một bridge Ethernet ảo gọi là `docker0` trên máy chủ để kết nối các container.

- Không tự động giao tiếp với container trên mạng khác

**Ưu Điểm**

- Cách ly mạng giữa các container trên các bridge khác nhau.
- Dễ sử dụng với các ứng dụng đơn giản.

**Nhược Điểm**

- Các container chỉ có thể giao tiếp với nhau trong cùng một bridge.
- Giao tiếp ra ngoài cần NAT.

## Host Network

**Tính Năng**

- Container sử dụng mạng của máy chủ (không cách ly mạng).
- Container truy cập trực tiếp vào mạng máy chủ và dùng chung địa chỉ IP.

**Ưu Điểm**

- Hiệu suất mạng cao hơn vì không cần NAT.
- Phù hợp với các ứng dụng yêu cầu hiệu suất mạng cao.

**Nhược Điểm**

- Mất tính cách ly mạng giữa container và máy chủ.
- Nguy cơ bảo mật vì container có quyền truy cập vào mạng của máy chủ.

## Overlay Network

**Tính Năng**

- Mạng cho phép container trên nhiều máy chủ khác nhau giao tiếp với nhau.
- Thường dùng trong Docker Swarm hoặc Kubernetes.
- Hỗ trợ giao tiếp giữa các nút trong cluster.

**Ưu Điểm**

- Phù hợp cho môi trường multi-host.
- Dễ cấu hình khi sử dụng Docker Swarm hoặc Kubernetes.

**Nhược Điểm**

- Hiệu suất thấp hơn do phụ thuộc vào lớp mạng phủ (overlay).
- Cần cấu hình thêm cho môi trường không Swarm.

## Macvlan Network

**Tính Năng**

- Mỗi container có địa chỉ MAC riêng.
- Container xuất hiện như một thiết bị vật lý trên mạng, giao tiếp trực tiếp với mạng vật lý.

**Ưu Điểm**

- Container có thể giao tiếp trực tiếp với các thiết bị trong mạng vật lý.
- Không cần NAT.
- Hiệu suất cao vì không có lớp ảo hóa mạng.

**Nhược Điểm**

- Khó cấu hình hơn so với các loại mạng khác.
- Không phù hợp cho tất cả các hạ tầng mạng.

## Định Tuyến Giữa Các Mạng

Docker hỗ trợ việc định tuyến lưu lượng giữa các mạng Docker. Ví dụ, nếu bạn có hai mạng Docker khác nhau và cần container trên mạng này giao tiếp với container trên mạng khác, bạn có thể sử dụng cầu nối (bridge) hoặc cấu hình mạng overlay trong Docker Swarm.

## Định Tuyến Tới Mạng Ngoài

Khi container cần truy cập vào mạng bên ngoài (internet), Docker sử dụng NAT để chuyển tiếp lưu lượng từ container qua mạng bridge và ra ngoài. Lưu lượng từ container được chuyển đến máy chủ Docker và sau đó được chuyển tiếp qua mạng vật lý của máy chủ.

  

## Docker Stats

- Bạn có thể sử dụng lệnh `docker stats` để theo dõi trực tiếp các chỉ số hiệu suất của container. Lệnh này hỗ trợ các chỉ số như CPU, bộ nhớ sử dụng, giới hạn bộ nhớ và lưu lượng mạng.

## Docker Compose

- Docker Compose là một công cụ hỗ trợ việc định nghĩa và chạy các ứng dụng Docker đa container. Với Docker Compose, bạn có thể cấu hình các dịch vụ, mạng và volumes trong một tệp cấu hình và sau đó sử dụng một lệnh duy nhất để khởi động hoặc dừng tất cả các container liên quan.

  **Mạng và Volumes**

  - Docker Compose tự động tạo một mạng riêng cho các dịch vụ trong ứng dụng của bạn, cho phép các container giao tiếp với nhau bằng cách sử dụng dịch vụ như hostname.
  - Volumes cũng có thể được định nghĩa trong tệp cấu hình để lưu trữ dữ liệu bền vững.

## CNI Plugins (Calico, Flannel, Weave)

- Các plugin CNI (Container Network Interface) như Calico, Flannel và Weave chủ yếu được sử dụng trong các môi trường Kubernetes để quản lý mạng cho các container trên nhiều máy chủ. Chúng cung cấp các tính năng mạng nâng cao và phù hợp với các hệ thống orchestrator container sản xuất.

  - **Phạm vi:** Các plugin CNI được thiết kế cho các cluster Kubernetes và xử lý kết nối mạng giữa nhiều nút.
  - **Mạng:** Các plugin này cho phép mạng overlay, giúp các container chạy trên các nút khác nhau có thể giao tiếp như thể chúng ở trên cùng một mạng cục bộ. Chúng cũng cung cấp các tính năng như chính sách mạng, phát hiện dịch vụ và quản lý địa chỉ IP.

  --> Cần thiết để quản lý mạng nâng cao trong môi trường multi-host hoặc Kubernetes, cung cấp các tính năng như mạng overlay, chính sách mạng và giao tiếp giữa các host.