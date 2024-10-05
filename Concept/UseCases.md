## Use Cases of Kubernetes in Production


### UseCase1
- Để gỡ bỏ một node trong cụm K8s production mà không gây downtime, bạn cần thực hiện theo các bước có cấu trúc để đảm bảo các `Pod` trên node đó được di chuyển sang node khác một cách an toàn. Dưới đây là quy trình thực hiện:


B1: `Cordon` các Node để ngăn chặn các Pod mới được lập lịch trên node này.

  - Sử dụng lệnh `cordon` để đánh dấu node là unscheduable tức là không cho phép các Pod mới được triển khai lên node này, nhưng các Pod hiện tại vẫn hoạt động.

```bash
kubectl cordon <node-name>
```

B2: `Drain` node để di chuyển giữa các Pod ra khỏi node

  - Sử dụng lệnh `drain` để di chuyển các Pod đang chạy trên node sang các node khác trong cụm. Lệnh này đảm bảo rằng các Pod được tái triển khai (reschedule) lên các node khác một cách an toàn.

```bash
kubectl drain <node-name> --ignore-daemonsets --delete-emptydir-data
```
B3: Kiểm tra lại Pod trên các Node khác


B4: Xóa Node khỏi cụm 

```bash
kubeclt delete node <node-name>
```