# VXT Phong Thủy

Phần mềm học và tra cứu phong thủy chạy trên Windows, hoàn toàn offline, không thu thập dữ liệu.

- **Huyền Không Phi Tinh:** lập tinh bàn, hạ quái và thế quái, cách cục, lưu niên; áp tinh bàn lên ảnh thửa đất.
- **Bát trạch:** cung phi, 8 du niên, Tam yếu (cửa, phòng chủ, bếp), Hoàng tuyền và Bát sát.
- **Bát tự (Tứ trụ):** tiết khí, thập thần, đại vận, luận giải sơ bộ, đổi âm dương lịch, chọn ngày theo lá số.
- **Vật phẩm:** bản đồ bố trí theo tinh bàn, sát khí và cách hóa giải, linh vật, đá theo mệnh.
- **Ôn tập:** thẻ ghi nhớ, luyện lập bàn.

## Tải về

Vào mục **Releases** bên phải trang, tải `VXT_PhongThuy_Setup_x.y.z.exe` rồi chạy. Không cần quyền quản trị.

## Tạo bản cài mới

1. Sửa `app/index.html`.
2. Tạo tag phiên bản, ví dụ `v1.0.1` (trên web: **Releases → Draft a new release → Choose a tag → v1.0.1 → Publish**; hoặc `git tag v1.0.1 && git push --tags`).
3. GitHub Actions tự biên dịch bằng Inno Setup và gắn file `.exe` vào bản Release đó.

Muốn biên dịch trên máy: cài [Inno Setup 6](https://jrsoftware.org/isdl.php), mở `installer/VXT_PhongThuy.iss` và bấm **Compile**. File cài nằm trong thư mục `Output`.

## Cấu trúc

```
app/                 giao diện (index.html, icon.ico)
installer/           kịch bản Inno Setup
.github/workflows/   tự động biên dịch Setup.exe
```

Phần mềm mở bằng nhân Microsoft Edge (có sẵn trên Windows 10/11) ở chế độ cửa sổ ứng dụng; không có Edge thì dùng Chrome.
