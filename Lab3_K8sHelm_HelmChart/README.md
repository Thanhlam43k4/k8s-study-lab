<!-- Haven't Finished  -->

Lab: Kuberentes Helm and Helm Charts

Objective: Use helm to manage Kuberentes applications


Steps:

1. Install Helm on your local machine and in your cluster

2. Deploy an application using a Helm Chart

3. Customize the Helm Chart values to modify the deployment

4. Upgrade and roll back the application using Helm commands.


Charts 


Helm uses a packaging format called charts. A chart is a collection of files that describe a related set of kubernetes resouces. A single chart might be used to deploy something simple, like a memcached pod, or something complex, like a full web app stack with HTTP servers, databases, caches, and so on.


Helm Chart là một công cụ phổ biến trong hệ sinh thái kubernetes giúp bạn quản lý các ứng dụng container hóa một cách dễ dàng. Helm hoạt động như một package mananger (trình quản lý gói cho k8s), cho phép bạn định nghĩa, cài đặt và nâng cấp các ứng dụng Kubernetes phức tạp.


1. Chart: 
    - Là một gói bao gồm tất cả các thông tin cần thiết để triển khai  một ứng dụng trong Kubernetes.

    - Chart bao gồm các tệp như là `Chart.yaml`, `values.yaml`, và các manifest templates của kubernetes.

2. Release:
    - Là một phiên bản cụ thể của chart đã được cài đặt trên một cluster Kubernetes. Bạn có thể cập nhật (upgrade) hoặc gỡ bỏ (uninstall) release này khi cần.

3. Repository:
    - Là nơi lưu chữ các chart. Có thể là public hoặc private repository để dễ dàng chia sẻ chart giữa các dự án hoặc nhóm.

4. Templates:
    - `Helm` sử dụng các template (mẫu) để tạo các manifest files như YAML file trong kubernetes. Điều này giúp bạn dễ dàng tái sử dụng và tùy chỉnh cấu hình dựa trên các biến số trong `values.yaml`


Cấu trúc của một `Helm Chart`

-   **Chart.yaml** : File này chứa các metadata về chart (phiên bản, mô tả, tên của chart, v.v);

-   **values.yaml**: File này chứa các giá trị mặc định cho các thông số trong templates.

-   **templates/**: Thư mục chứa các file template mà `Helm` sẽ render ra các manifest Kubernetes như `Deployment, Service, ConfigMap, etc....`

-   **Readme.md**:  File chứa mô tả chi tiết về Chart, các thông tin lưu ý khi sử dụng.



- Trong `Helm` , `release` là một phiên bản cụ thể của một Helm chart được triển khai lên cụm K8s. Mỗi lần sử dụng helm để cài đặt một chart, Helm sẽ tạo ra một release. `Release` là một triển khai độc lập của chart 

- `Hooks` trong `Helm` là một cơ chế cho phép bạn nhúng các hành động tùy chỉnh vào chu trình triển khai, nâng cấp,xóa hoặc rollback của một `Helm release`. Hooks giúp thực thi các tác vụ đặc biệt trước hoặc sau các sự kiện cụ thể trong quá trình quản lý bản phát hành của Helm, ví dụ như khởi chạy một pod trước khi ứng dụng chính được triển khai. 