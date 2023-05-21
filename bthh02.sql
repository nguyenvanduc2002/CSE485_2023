-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 21, 2023 lúc 06:32 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bthh02`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendance`
--

CREATE TABLE `attendance` (
  `ID_ThamDu` varchar(10) NOT NULL,
  `Ngay` date NOT NULL,
  `ID_KhoaHoc` varchar(10) NOT NULL,
  `MaSV` varchar(10) NOT NULL,
  `TrangThai` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attendance`
--

INSERT INTO `attendance` (`ID_ThamDu`, `Ngay`, `ID_KhoaHoc`, `MaSV`, `TrangThai`) VALUES
('T1', '2023-05-02', 'K_01', '20510656', 'muộn học 2 lần'),
('T2', '2023-05-02', 'K_01', '20510657', 'muộn học 2 lần'),
('T3', '2023-05-02', 'K_01', '20510659', 'muộn học 2 lần'),
('T4', '2023-05-02', 'K_01', '20510686', 'muộn học 2 lần');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baocao`
--

CREATE TABLE `baocao` (
  `id_baocao` bigint(11) NOT NULL,
  `ID_KhoaHoc` varchar(50) NOT NULL,
  `MaSV` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giangvien`
--

CREATE TABLE `giangvien` (
  `ID_GiangVien` varchar(10) NOT NULL,
  `id_quyen` bigint(20) DEFAULT NULL,
  `TenGV` varchar(50) NOT NULL,
  `Email_GV` varchar(20) NOT NULL,
  `SDT_GV` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giangvien`
--

INSERT INTO `giangvien` (`ID_GiangVien`, `id_quyen`, `TenGV`, `Email_GV`, `SDT_GV`) VALUES
('12', 1, 'vũ mai  hương', 'vumaihuong@gmail.com', '0128463945'),
('13', 2, 'vũ thị quỳnh', 'vuthiquynh@gmail.com', '0128463945'),
('14', 2, 'vũ quỳnh trang', 'vuquynhtrang@gmail.c', '0128463945'),
('15', 2, 'đào thế vũ', 'daothevu@gmail.com', '0128463945'),
('16', 2, 'trần thế đại', 'tranthedai@gmail.com', '0128463945');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoahoc`
--

CREATE TABLE `khoahoc` (
  `ID_KhoaHoc` varchar(10) NOT NULL,
  `HocKy` varchar(10) NOT NULL,
  `GiaiDoan` int(20) NOT NULL,
  `Ma_KhoaHoc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khoahoc`
--

INSERT INTO `khoahoc` (`ID_KhoaHoc`, `HocKy`, `GiaiDoan`, `Ma_KhoaHoc`) VALUES
('K_01', 'HK1', 2, 'KhoaHoc1'),
('K_02', 'HK2', 2, 'KhoaHoc2'),
('K_03', 'HK3', 2, 'KhoaHoc3'),
('K_04', 'HK4', 2, 'KhoaHoc2'),
('K01', 'HK1', 1, 'KhoaHoc1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lophoc`
--

CREATE TABLE `lophoc` (
  `ID_LopHoc` varchar(10) NOT NULL,
  `ID_KhoaHoc` varchar(10) NOT NULL,
  `ID_GiangVien` varchar(10) NOT NULL,
  `ThoiGianHoc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lophoc`
--

INSERT INTO `lophoc` (`ID_LopHoc`, `ID_KhoaHoc`, `ID_GiangVien`, `ThoiGianHoc`) VALUES
('L01', 'K01', '12', '2023-05-10'),
('L02', 'K01', '12', '2023-05-10'),
('L04', 'K01', '14', '2023-05-10'),
('L05', 'K01', '13', '2023-05-10'),
('L07', 'K01', '12', '2023-05-10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `ID_NguoiDung` varchar(10) NOT NULL,
  `Ten_NguoiDung` varchar(50) NOT NULL,
  `MatKhau` varchar(50) NOT NULL,
  `VaiTro` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`ID_NguoiDung`, `Ten_NguoiDung`, `MatKhau`, `VaiTro`) VALUES
('N01', 'vũ ngọc anh', '1234567', 'sinh vien'),
('N02', 'vũ mai hương', '1234567', 'giang vien'),
('N03', 'vũ thị quỳnh', '1234567', 'giang vien'),
('N04', 'vũ thị trang', '1234567', 'giang vien'),
('N05', 'phạm văn thuấn', '1234567', 'sinh vien');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phanquyen`
--

CREATE TABLE `phanquyen` (
  `id` int(11) NOT NULL,
  `tenquyen` varchar(255) DEFAULT NULL,
  `ghichu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phanquyen`
--

INSERT INTO `phanquyen` (`id`, `tenquyen`, `ghichu`) VALUES
(1, 'admin', 'quản trị viên hệ thống'),
(2, 'sinh vien', 'sinh viên '),
(3, 'giảng viên', 'giảng viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `MaSV` varchar(10) NOT NULL,
  `id_quyen` bigint(20) DEFAULT NULL,
  `HoTen` varchar(50) NOT NULL,
  `NgaySinh` date NOT NULL,
  `Email` varchar(50) NOT NULL,
  `QueQuan` varchar(50) NOT NULL,
  `ID_KhoaHoc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sinhvien`
--

INSERT INTO `sinhvien` (`MaSV`, `id_quyen`, `HoTen`, `NgaySinh`, `Email`, `QueQuan`, `ID_KhoaHoc`) VALUES
('20510656', 1, 'vũ ngọc anh', '2013-05-14', 'vungocanh@gmail.com', 'thai binh', 'K_01'),
('20510657', 1, 'phạm văn thuấn', '2013-05-14', 'phamvanthuan@gmail.com', 'thai binh', 'K_01'),
('20510659', 1, 'vũ văn trường', '2013-08-14', 'vuvantruongh@gmail.com', 'thai binh', 'K_01'),
('20510686', 1, 'đinh ngọcthanh', '2013-05-14', 'dinhngocthanh@gmail.com', 'thai binh', 'K_01');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`ID_ThamDu`),
  ADD KEY `ID_KhoaHoc` (`ID_KhoaHoc`),
  ADD KEY `MaSV` (`MaSV`);

--
-- Chỉ mục cho bảng `baocao`
--
ALTER TABLE `baocao`
  ADD PRIMARY KEY (`id_baocao`),
  ADD KEY `fk_MaSV` (`MaSV`),
  ADD KEY `fk_ID_KhoaHoc` (`ID_KhoaHoc`);

--
-- Chỉ mục cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD PRIMARY KEY (`ID_GiangVien`);

--
-- Chỉ mục cho bảng `khoahoc`
--
ALTER TABLE `khoahoc`
  ADD PRIMARY KEY (`ID_KhoaHoc`);

--
-- Chỉ mục cho bảng `lophoc`
--
ALTER TABLE `lophoc`
  ADD PRIMARY KEY (`ID_LopHoc`),
  ADD KEY `ID_KhoaHoc` (`ID_KhoaHoc`),
  ADD KEY `ID_GiangVien` (`ID_GiangVien`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`ID_NguoiDung`);

--
-- Chỉ mục cho bảng `phanquyen`
--
ALTER TABLE `phanquyen`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`MaSV`),
  ADD KEY `ID_KhoaHoc` (`ID_KhoaHoc`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `baocao`
--
ALTER TABLE `baocao`
  MODIFY `id_baocao` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phanquyen`
--
ALTER TABLE `phanquyen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`ID_KhoaHoc`) REFERENCES `khoahoc` (`ID_KhoaHoc`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`MaSV`) REFERENCES `sinhvien` (`MaSV`);

--
-- Các ràng buộc cho bảng `baocao`
--
ALTER TABLE `baocao`
  ADD CONSTRAINT `fk_ID_KhoaHoc` FOREIGN KEY (`ID_KhoaHoc`) REFERENCES `khoahoc` (`ID_KhoaHoc`),
  ADD CONSTRAINT `fk_MaSV` FOREIGN KEY (`MaSV`) REFERENCES `sinhvien` (`MaSV`);

--
-- Các ràng buộc cho bảng `lophoc`
--
ALTER TABLE `lophoc`
  ADD CONSTRAINT `lophoc_ibfk_1` FOREIGN KEY (`ID_KhoaHoc`) REFERENCES `khoahoc` (`ID_KhoaHoc`),
  ADD CONSTRAINT `lophoc_ibfk_2` FOREIGN KEY (`ID_GiangVien`) REFERENCES `giangvien` (`ID_GiangVien`);

--
-- Các ràng buộc cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`ID_KhoaHoc`) REFERENCES `khoahoc` (`ID_KhoaHoc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
