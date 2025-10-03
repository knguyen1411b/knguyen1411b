# Cài đặt WSL trên Windows

## Bước 1: Cài đặt WSL

- Chạy lệnh sau trong Command Prompt hoặc PowerShell:

```bash
wsl --install
shutdown /r /t 0
```

- Cài đặt unbuntu

```bash
wsl -l -v
wsl --install -d Ubuntu-22.04
```

## Bước 2: Kiểm tra và dừng phiên bản WSL

- Sử dụng các lệnh sau để liệt kê và dừng phiên bản Ubuntu:

```bash
wsl -t Ubuntu-22.04
```

## Bước 3: Xuất và nhập phiên bản WSL

- Để xuất và nhập phiên bản Ubuntu, sử dụng các lệnh sau:

```bash
wsl --export Ubuntu-24.04 "C:/wsl/Ubuntu-24.04.tar"
wsl --unregister Ubuntu-24.04
wsl --import Ubuntu-24.04 "D:/wsl/Ubuntu-24.04/" "C:/wsl/Ubuntu-24.04.tar"
```

## Bước 4: Cấu hình người dùng mặc định trong WSL

- Mở WSL và chỉnh sửa tệp cấu hình:

```bash
nano /etc/wsl.conf

# Thêm nội dung sau vào tệp:
[user]
default=username
#Thay thế username bằng tên người dùng bạn muốn sử dụng.
```
