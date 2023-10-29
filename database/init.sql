-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th10 29, 2023 lúc 04:24 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4
SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
    time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

--
-- Cơ sở dữ liệu: `ecom_web_demo`
--
-- --------------------------------------------------------
--
-- Cấu trúc bảng cho bảng `cart`
--
CREATE TABLE `cart` (
    `cart_id` int(11) NOT NULL,
    `user_id` int(11) DEFAULT NULL,
    `product_id` int(11) DEFAULT NULL,
    `quantity` int(11) DEFAULT NULL,
    `price` decimal(10, 2) DEFAULT NULL,
    `product_name` varchar(255) DEFAULT NULL,
    `product_img` varchar(255) DEFAULT NULL,
    `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
    `additional_info` text DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Cấu trúc bảng cho bảng `categories`
--
CREATE TABLE `categories` (
    `category_id` int(11) NOT NULL,
    `category_name` varchar(255) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--
INSERT INTO
    `categories` (`category_id`, `category_name`)
VALUES
    (1, 'Nam'),
    (2, 'Nữ'),
    (3, 'Trẻ em'),
    (4, 'Siêu sale tháng 11'),
    (5, 'Lifestyle'),
    (6, 'Về chúng tôi');

-- --------------------------------------------------------
--
-- Cấu trúc bảng cho bảng `orders`
--
CREATE TABLE `orders` (
    `order_id` int(11) NOT NULL,
    `user_id` int(11) DEFAULT NULL,
    `total_amount` decimal(10, 2) DEFAULT NULL,
    `order_status` varchar(255) DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Cấu trúc bảng cho bảng `order_details`
--
CREATE TABLE `order_details` (
    `id` int(11) NOT NULL,
    `order_id` int(11) DEFAULT NULL,
    `product_id` int(11) DEFAULT NULL,
    `quantity` int(11) DEFAULT NULL,
    `price` decimal(10, 2) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Cấu trúc bảng cho bảng `products`
--
CREATE TABLE `products` (
    `product_id` int(11) NOT NULL,
    `product_img` text NOT NULL,
    `product_desc` text NOT NULL,
    `product_brand` varchar(255) NOT NULL,
    `product_name` varchar(255) NOT NULL,
    `product_color` varchar(50) NOT NULL,
    `product_size` varchar(10) NOT NULL,
    `product_price` double NOT NULL,
    `product_quantity` int(11) NOT NULL,
    `category_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--
INSERT INTO
    `products` (
        `product_id`,
        `product_img`,
        `product_desc`,
        `product_brand`,
        `product_name`,
        `product_color`,
        `product_size`,
        `product_price`,
        `product_quantity`,
        `category_id`
    )
VALUES
    (
        2,
        'https://pubcdn.ivymoda.com/files/product/thumab/1600/2023/10/23/00e3f24fcf1482b9d54302d8b05ffcb5.jpg',
        'Thiết kế tôn vinh vẻ đẹp nhẹ nhàng, trang nhã những vẫn đủ để tạo ấn tượng quyến rũ giúp nàng tỏa sáng, mẫu áo sơ mi cổ đổ là một lựa chọn cho các sự kiện quan trọng hay các dịp đặc biệt. \r\n\r\nÁo sơ mi được làm từ chất liệu lụa, mềm mịn và tạo nên sự sang trọng. Dáng cổ đổ đặc biệt, tăng điểm nhấn thời trang, khoe trọn phần xương quai xanh quyến rũ. \r\n\r\nThông tin mẫu:\r\n\r\nChiều cao: 167 cm\r\n\r\nCân nặng: 50 kg\r\n\r\nSố đo 3 vòng: 83-65-93 cm\r\n\r\nMẫu mặc size M\r\n\r\nLưu ý: Màu sắc sản phẩm thực tế sẽ có sự chênh lệch nhỏ so với ảnh do điều kiện ánh sáng khi chụp và màu sắc hiển thị qua màn hình máy tính/ điện thoại.',
        'Ivymoda',
        'Áo Sơ Mi Lụa Cổ Đổ',
        'Cam nhạt',
        'M',
        950000,
        10,
        2
    );

-- --------------------------------------------------------
--
-- Cấu trúc bảng cho bảng `product_images`
--
CREATE TABLE `product_images` (
    `image_id` int(11) NOT NULL,
    `href_value` text NOT NULL,
    `product_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--
INSERT INTO
    `product_images` (`image_id`, `href_value`, `product_id`)
VALUES
    (
        1,
        'https://pubcdn.ivymoda.com/files/product/thumab/1600/2023/10/20/8a2241d4a39c3760bc7d6c9a29d82551.jpg',
        2
    ),
    (
        2,
        'https://pubcdn.ivymoda.com/files/product/thumab/1600/2023/10/20/abb878faa6f78076c1e003a84ec625b3.jpg',
        2
    ),
    (
        3,
        'https://pubcdn.ivymoda.com/files/product/thumab/1600/2023/10/20/c65cdec2a0357da640930c32a7f13dce.jpg',
        2
    );

-- --------------------------------------------------------
--
-- Cấu trúc bảng cho bảng `rates`
--
CREATE TABLE `rates` (
    `rate_id` int(11) NOT NULL,
    `rate_value` int(11) NOT NULL,
    `product_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `rates`
--
INSERT INTO
    `rates` (`rate_id`, `rate_value`, `product_id`)
VALUES
    (1, 5, 2),
    (2, 4, 2);

-- --------------------------------------------------------
--
-- Cấu trúc bảng cho bảng `shipping_addresses`
--
CREATE TABLE `shipping_addresses` (
    `id` int(11) NOT NULL,
    `user_id` int(11) DEFAULT NULL,
    `recipient_name` varchar(255) DEFAULT NULL,
    `street_address` varchar(255) DEFAULT NULL,
    `city` varchar(255) DEFAULT NULL,
    `state` varchar(255) DEFAULT NULL,
    `postal_code` varchar(20) DEFAULT NULL,
    `country` varchar(255) DEFAULT NULL,
    `phone_number` varchar(20) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Cấu trúc bảng cho bảng `users`
--
CREATE TABLE `users` (
    `user_id` int(11) NOT NULL,
    `username` varchar(100) NOT NULL,
    `email` varchar(100) NOT NULL,
    `password` varchar(255) NOT NULL,
    `fullname` varchar(255) NOT NULL,
    `role` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--
INSERT INTO
    `users` (
        `user_id`,
        `username`,
        `email`,
        `password`,
        `fullname`,
        `role`
    )
VALUES
    (
        5,
        'admin',
        'admin@gmail.com',
        '$2y$10$f0qAzSGAKrW6LfyFv7Gl9OF0qNCCxkC6EDmkJ.0SKJm7kVDk9oAZq',
        'Nguyen Tien Dat',
        1
    );

--
-- Chỉ mục cho các bảng đã đổ
--
--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE
    `cart`
ADD
    PRIMARY KEY (`cart_id`),
ADD
    KEY `user_id` (`user_id`),
ADD
    KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE
    `categories`
ADD
    PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE
    `orders`
ADD
    PRIMARY KEY (`order_id`),
ADD
    KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE
    `order_details`
ADD
    PRIMARY KEY (`id`),
ADD
    KEY `order_id` (`order_id`),
ADD
    KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE
    `products`
ADD
    PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE
    `product_images`
ADD
    PRIMARY KEY (`image_id`),
ADD
    KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `rates`
--
ALTER TABLE
    `rates`
ADD
    PRIMARY KEY (`rate_id`);

--
-- Chỉ mục cho bảng `shipping_addresses`
--
ALTER TABLE
    `shipping_addresses`
ADD
    PRIMARY KEY (`id`),
ADD
    KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE
    `users`
ADD
    PRIMARY KEY (`user_id`),
ADD
    UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--
--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE
    `cart`
MODIFY
    `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE
    `categories`
MODIFY
    `category_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 7;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE
    `orders`
MODIFY
    `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE
    `order_details`
MODIFY
    `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE
    `products`
MODIFY
    `product_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE
    `product_images`
MODIFY
    `image_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT cho bảng `rates`
--
ALTER TABLE
    `rates`
MODIFY
    `rate_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT cho bảng `shipping_addresses`
--
ALTER TABLE
    `shipping_addresses`
MODIFY
    `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE
    `users`
MODIFY
    `user_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 6;

--
-- Các ràng buộc cho các bảng đã đổ
--
--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE
    `cart`
ADD
    CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
ADD
    CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE
    `orders`
ADD
    CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE
    `order_details`
ADD
    CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
ADD
    CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE
    `product_images`
ADD
    CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `shipping_addresses`
--
ALTER TABLE
    `shipping_addresses`
ADD
    CONSTRAINT `shipping_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;