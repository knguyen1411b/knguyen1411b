# Checklist setup máy tính Windows

Dùng khi cài máy mới hoặc cài lại Windows để làm việc và lập trình. Đánh dấu từng bước đã hoàn thành; phần môi trường dự án chỉ cài những công cụ cần dùng.

Danh sách link tải ứng dụng: [list-app.md](list-app.md).

## 1. Chuẩn bị trước khi cài lại máy

- [ ] Sao lưu Desktop, Documents, Downloads và dữ liệu ở các ổ đĩa cần giữ.
- [ ] Push code đã commit; sao lưu riêng thay đổi chưa commit và file cấu hình môi trường của dự án.
- [ ] Xuất hoặc đồng bộ bookmarks, cấu hình IDE và terminal.
- [ ] Sao lưu dữ liệu database cần dùng.
- [ ] Kiểm tra có thể mở bản sao lưu trước khi cài lại máy.
- [ ] Chuẩn bị tài khoản đăng nhập và quyền truy cập trình quản lý mật khẩu.

## 2. Windows và driver

- [ ] Hoàn tất Windows Update, khởi động lại và kiểm tra cập nhật lần nữa.
- [ ] Cài driver chipset, đồ họa, Wi-Fi/Bluetooth và âm thanh từ hãng máy hoặc hãng linh kiện.
- [ ] Kiểm tra kết nối mạng, loa, micro, webcam và màn hình ngoài.
- [ ] Đặt múi giờ UTC+7, ngôn ngữ và bố cục bàn phím mong muốn.
- [ ] Bật hiển thị phần mở rộng file trong File Explorer.
- [ ] Cấu hình Windows Hello và thời gian tự khóa màn hình.
- [ ] Kiểm tra Windows Security hoạt động.
- [ ] Nếu dùng mã hóa ổ đĩa, lưu khóa khôi phục vào nơi có thể truy cập khi máy gặp lỗi.

## 3. Ứng dụng sử dụng hằng ngày

- [ ] Cài Chrome, đăng nhập và đồng bộ bookmarks.
- [ ] Cài UniKey, chọn Unicode và kiểu gõ thường dùng.
- [ ] Cài 7-Zip hoặc WinRAR để giải nén.
- [ ] Cài Everything để tìm file.
- [ ] Cài Flow Launcher hoặc PowerToys theo thói quen sử dụng.
- [ ] Cài Discord, Notion và ứng dụng văn phòng nếu cần.
- [ ] Cài Figma, OBS Studio nếu cần thiết kế hoặc quay màn hình.
- [ ] Đặt ứng dụng mặc định cho trình duyệt, PDF, ảnh và video.

## 4. Terminal và editor

- [ ] Cài Windows Terminal, chọn shell mặc định.
- [ ] Cài VS Code và đăng nhập Settings Sync nếu đang sử dụng.
- [ ] Khôi phục settings, keybindings, snippets và theme.
- [ ] Cài extension theo dự án: ESLint, Prettier, Python, Java hoặc WSL.
- [ ] Khôi phục [cấu hình PowerShell](Application/dotfiles/powershell/) sau khi kiểm tra đường dẫn và các công cụ được tham chiếu.
- [ ] Kiểm tra terminal mở bình thường và không báo lỗi profile.

## 5. Git và GitHub

- [ ] Cài Git và GitHub CLI từ [danh sách ứng dụng](list-app.md).
- [ ] Cấu hình tên và email commit; dùng email GitHub hoặc email noreply mong muốn.

Chạy trong PowerShell, thay các giá trị mẫu bằng thông tin của mình:

```powershell
git config --global user.name "Ten cua ban"
git config --global user.email "email@example.com"
git config --global init.defaultBranch main
gh auth login
gh auth status
git config --global --list
```

- [ ] Clone một repository để kiểm tra quyền truy cập.
- [ ] Kiểm tra `.gitignore` của dự án trước khi thêm file cấu hình môi trường.

Tham khảo: [Set up Git — GitHub Docs](https://docs.github.com/en/get-started/git-basics/set-up-git).

## 6. Môi trường lập trình theo dự án

- [ ] Chọn chạy dự án trên Windows hoặc WSL trước khi cài runtime.
- [ ] Cài Node.js đúng phiên bản dự án yêu cầu; nếu chưa có yêu cầu, chọn bản LTS.
- [ ] Cài pnpm hoặc Bun nếu dự án sử dụng; giữ đúng package manager và lockfile của repository.
- [ ] Cài Python nếu cần, tạo virtual environment riêng cho từng dự án.
- [ ] Cài JDK đúng phiên bản dự án Java/Spring Boot yêu cầu.
- [ ] Cài Android Studio và SDK nếu làm Android.
- [ ] Cài Visual Studio cùng workload cần thiết nếu làm .NET hoặc C++.
- [ ] Cài Postman và DBeaver nếu cần kiểm tra API hoặc quản lý database.
- [ ] Cài MySQL/PostgreSQL/SQL Server chỉ khi dự án cần chạy database trên máy.

Kiểm tra các công cụ đã cài trong môi trường chạy dự án:

```powershell
git --version
node --version
npm --version
```

Với các công cụ tùy chọn, kiểm tra thêm `pnpm --version`, `bun --version`, `python --version`, `java -version` và `javac -version`.

Hướng dẫn: [Cài pnpm](https://pnpm.io/installation).

## 7. WSL và Docker nếu cần

- [ ] Cài WSL theo [hướng dẫn Microsoft](https://learn.microsoft.com/en-us/windows/wsl/install).

Trên máy chưa có WSL, mở PowerShell bằng **Run as administrator**:

```powershell
wsl --install
```

- [ ] Khởi động lại máy, mở Ubuntu và tạo tài khoản Linux.
- [ ] Kiểm tra distro chạy WSL 2 bằng `wsl --list --verbose`.
- [ ] Cài Git và runtime cần dùng bên trong WSL nếu chạy dự án tại đó.
- [ ] Cài extension WSL của VS Code và thử mở dự án trong WSL.
- [ ] Cài Docker Desktop theo [hướng dẫn Docker](https://docs.docker.com/desktop/setup/install/windows-install/).
- [ ] Nếu dùng WSL backend, bật integration cho distro làm việc trong Docker Desktop.
- [ ] Mở Docker Desktop, chờ engine sẵn sàng rồi chạy kiểm tra:

```powershell
docker version
docker compose version
docker run --rm hello-world
```

## 8. Khôi phục workspace và kiểm tra cuối

- [ ] Tạo thư mục workspace và clone các repository đang làm.
- [ ] Khôi phục file môi trường từ nơi lưu riêng, đối chiếu với `.env.example` nếu có.
- [ ] Cài dependency theo README và lockfile của từng dự án.
- [ ] Khởi động database hoặc container cần thiết.
- [ ] Chạy ứng dụng, mở trang local và kiểm tra chức năng chính.
- [ ] Chạy lệnh build hoặc test được repository hướng dẫn.
- [ ] Khởi động lại máy và kiểm tra terminal, IDE, mạng vẫn hoạt động.
- [ ] Thiết lập lịch sao lưu dữ liệu làm việc.
- [ ] Ghi lại lỗi gặp khi setup và cách xử lý để dùng cho lần sau.
