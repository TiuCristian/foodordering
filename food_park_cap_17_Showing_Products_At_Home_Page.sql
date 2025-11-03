-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 03, 2025 at 09:57 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_park`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `delivery_area_id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `delivery_area_id`, `first_name`, `last_name`, `email`, `phone`, `address`, `type`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Ion', 'Popa', 'popaion@gmail.com', '0788999555', 'Strada test nr. 204', 'home', '2025-09-19 08:22:42', '2025-09-19 10:20:39'),
(2, 2, 2, 'Ion', 'Popa', 'popaionwork@gmail.com', '0788999555', 'street work address test nr. 203', 'office', '2025-09-19 10:16:42', '2025-09-19 10:16:42');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `show_at_home` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `show_at_home`, `created_at`, `updated_at`) VALUES
(1, 'Burger', 'burger', 1, 1, NULL, NULL),
(2, 'Sandwich', 'sandwich', 1, 1, NULL, NULL),
(3, 'Taco', 'taco', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_areas`
--

CREATE TABLE `delivery_areas` (
  `id` bigint UNSIGNED NOT NULL,
  `area_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_delivery_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_delivery_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_fee` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_areas`
--

INSERT INTO `delivery_areas` (`id`, `area_name`, `min_delivery_time`, `max_delivery_time`, `delivery_fee`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Downtown', '15', '30', 0, 1, '2025-09-19 11:21:57', '2025-09-19 11:21:57'),
(2, 'North Side', '20', '45', 7.5, 1, '2025-09-19 11:21:57', '2025-09-19 11:21:57'),
(3, 'South Side', '25', '50', 5, 1, '2025-09-19 11:21:57', '2025-09-19 11:21:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_09_19_103006_create_delivery_areas_table', 1),
(6, '2025_09_19_105030_create_addresses_table', 1),
(7, '2025_10_14_074346_create_sliders_table', 2),
(10, '2025_10_30_101420_create_why_choose_us_table', 3),
(11, '2025_10_30_101628_create_section_titles_table', 3),
(12, '2025_10_31_082919_create_categories_table', 4),
(15, '2025_10_31_104618_create_products_table', 5),
(16, '2025_11_03_074734_create_product_galleries_table', 6),
(17, '2025_11_03_092632_create_product_sizes_table', 7),
(19, '2025_11_03_093311_create_product_options_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('tiucrs@gmail.com', '$2y$12$2nV5/AtMYgzzwLSHJ0/uL.ntg5sWemVAMUCDySpE52BzwDEthUr.S', '2025-10-06 10:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `offer_price` double NOT NULL DEFAULT '0',
  `quantity` int NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_at_home` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `thumb_image`, `category_id`, `short_description`, `long_description`, `price`, `offer_price`, `quantity`, `sku`, `show_at_home`, `status`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(6, 'Dal Makhani Paneer 1', 'dal-makhani-paneer', '/uploads/media_6904ab8e80230.jpg', 3, 'Lightly smoked and minced pork tenderloin topped', '<div class=\"tab-pane fade show active\" id=\"pills-home\" role=\"tabpanel\" aria-labelledby=\"pills-home-tab\" tabindex=\"0\">\r\n                                <div class=\"menu_det_description\">\r\n                                    <p>Ipsum dolor, sit amet consectetur adipisicing elit. Doloribus consectetur\r\n                                        ullam in? Beatae, dolorum ad ea deleniti ratione voluptatum similique omnis\r\n                                        voluptas tempora optio soluta vero veritatis reiciendis blanditiis architecto.\r\n                                        Debitis nesciunt inventore voluptate tempora ea incidunt iste, corporis, quo\r\n                                        cumque facere doloribus possimus nostrum sed magni quasi, assumenda autem!\r\n                                        Repudiandae nihil magnam provident illo alias vero odit repellendus, ipsa nemo\r\n                                        itaque. Aperiam fuga, magnam quia illum minima blanditiis tempore. vero\r\n                                        veritatis reiciendis blanditiis architecto. Debitis nesciunt inventore voluptate\r\n                                        tempora ea incidunt iste, corporis, quo cumque facere doloribus possimus nostrum\r\n                                        sed magni quasi</p>\r\n                                    <ul><li>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Doloribus\r\n                                            consectetur ullam in</li><li>Dolor sit amet consectetur adipisicing elit. Earum itaque nesciunt.</li><li>Corporis, quo cumque facere doloribus possimus nostrum sed magni quasi.</li><li>Reiciendis blanditiis architecto. Debitis nesciunt inventore voluptate\r\n                                            tempora ea.</li><li>Incidunt iste, corporis, quo cumque facere doloribus possimus\r\n                                            nostrum sed magni quasi</li><li>Architecto. Debitis nesciunt inventore voluptate tempora ea incidunt iste\r\n                                            corporis.</li><li>Earum itaque nesciunt dolor laudantium placeat sed velit aspernatur.</li><li>Laudantium placeat sed velit aspernatur, nobis quos quibusdam distinctio\r\n                                            voluptatum.</li></ul>\r\n                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum itaque nesciunt\r\n                                        dolor laudantium placeat sed velit aspernatur, nobis quos quibusdam distinctio\r\n                                        voluptatum officia vel sapiente enim, reprehenderit impedit beatae molestias\r\n                                        dolorum. A laborum consectetur sed quis exercitationem optio consequatur, unde\r\n                                        neque est odit, pariatur quae incidunt quasi dolorem nihil aliquid ut veritatis\r\n                                        porro eaque cupiditate voluptatem vel ad! Asperiores, praesentium. sit amet\r\n                                        consectetur adipisicing elit. Doloribus consectetur ullam in? Beatae, dolorum ad\r\n                                        ea deleniti ratione voluptatum similique omnis voluptas tempora optio soluta</p>\r\n\r\n                                    <ul><li>Reiciendis blanditiis architecto. Debitis nesciunt inventore voluptate\r\n                                            tempora ea.</li><li>Incidunt iste, corporis, quo cumque facere doloribus possimus\r\n                                            nostrum sed magni quasi</li><li>Architecto. Debitis nesciunt inventore voluptate tempora ea incidunt iste\r\n                                            corporis.</li><li>Earum itaque nesciunt dolor laudantium placeat sed velit aspernatur.</li><li>Laudantium placeat sed velit aspernatur, nobis quos quibusdam distinctio\r\n                                            voluptatum.</li></ul>\r\n                                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Doloribus consectetur\r\n                                        ullam in? Beatae, dolorum ad ea deleniti ratione voluptatum similique omnis\r\n                                        voluptas tempora optio soluta vero veritatis reiciendis blanditiis architecto.\r\n                                        Debitis nesciunt inventore voluptate tempora ea incidunt iste, corporis, quo\r\n                                        cumque facere doloribus possimus nostrum sed magni quasi, assumenda autem!\r\n                                        Repudiandae nihil magnam provident illo alias vero odit repellendus, ipsa nemo\r\n                                        itaque. Aperiam fuga, magnam quia illum minima blanditiis tempore.</p>\r\n                                </div>\r\n                            </div><p></p>', 12, 30, 11, '11', 0, 0, 'Dal Makhani Paneer', 'Dal Makhani Paneer', '2025-10-31 10:29:02', '2025-10-31 11:59:43'),
(7, 'Hyderabadi biryani', 'hyderabadi-biryani', '/uploads/media_6904b4b555abc.jpg', 2, 'Lightly smoked and minced pork tenderloin topped', '<p>Lightly smoked and minced pork tenderloin topped lorem ipsum dolost sit amet&nbsp;lorem ipsum dolost sit ametlorem ipsum dolost sit ametlorem ipsum dolost sit ametlorem ipsum dolost sit ametlorem ipsum dolost sit ametlorem ipsum dolost sit ametlorem ipsum dolost sit ametlorem ipsum dolost sit ametlorem ipsum dolost sit amet</p>', 15, 35, 11, '11', 0, 0, 'Hyderabadi biryani', 'Hyderabadi biryani lorem ipsum', '2025-10-31 11:08:05', '2025-10-31 11:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_galleries`
--

CREATE TABLE `product_galleries` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_galleries`
--

INSERT INTO `product_galleries` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(2, 7, '/uploads/media_69086f4ed3946.jpeg', '2025-11-03 07:01:02', '2025-11-03 07:01:02'),
(3, 7, '/uploads/media_69086f5dedd87.jpeg', '2025-11-03 07:01:17', '2025-11-03 07:01:17'),
(4, 7, '/uploads/media_690872ee9575b.jpeg', '2025-11-03 07:16:30', '2025-11-03 07:16:30'),
(5, 6, '/uploads/media_6908737ed6f24.jpg', '2025-11-03 07:18:54', '2025-11-03 07:18:54'),
(6, 6, '/uploads/media_69087389398ba.jpg', '2025-11-03 07:19:05', '2025-11-03 07:19:05'),
(7, 6, '/uploads/media_690873952d481.jpg', '2025-11-03 07:19:17', '2025-11-03 07:19:17');

-- --------------------------------------------------------

--
-- Table structure for table `product_options`
--

CREATE TABLE `product_options` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`id`, `product_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(2, 6, 'Cola', 2, '2025-11-03 07:52:23', '2025-11-03 07:52:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `product_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 6, 'large', 10, '2025-11-03 07:51:01', '2025-11-03 07:51:01');

-- --------------------------------------------------------

--
-- Table structure for table `section_titles`
--

CREATE TABLE `section_titles` (
  `id` bigint UNSIGNED NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_titles`
--

INSERT INTO `section_titles` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'why_choose_top_title', 'why choose us', NULL, '2025-10-30 10:39:22'),
(2, 'why_choose_main_title', 'why choose us', NULL, '2025-10-30 10:39:22'),
(3, 'why_choose_sub_title', 'Objectively pontificate quality models before intuitive information. Dramatically recaptiualize multifunctional materials.', NULL, '2025-10-30 10:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `offer`, `title`, `sub_title`, `short_description`, `button_link`, `status`, `created_at`, `updated_at`) VALUES
(5, '/uploads/media_6903365f30381.jpg', '35%', 'Eat healthy. Stay healthy.', 'Fast Food & Restaurants', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsum fugit minima\r\n                                            et debitis ut distinctio optio qui voluptate natus.', 'Shop Now', 1, '2025-10-30 07:41:54', '2025-10-30 11:27:55'),
(6, '/uploads/media_6903332aaa9a1.jpg', '35%', 'Different spice for a Different taste', 'Fast Food & Restaurants', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsum fugit minima\r\n                                            et debitis ut distinctio optio qui voluptate natus.', 'shop now', 1, '2025-10-30 07:43:06', '2025-10-30 11:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/uploads/default_user.jpg',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `avatar`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '/uploads/default_user.jpg', 'Admin', 'tiucrs@gmail.com', 'admin', '2025-09-19 11:05:10', '$2y$10$CiW4BdpLEsB6bG0cxUa5AeoJpx6TcjfA.xBpnbW13LYRvYJGPtbX6', NULL, '2025-09-19 11:05:10', '2025-09-19 11:05:10'),
(2, '/uploads/media_68cd60962464d.jpg', 'User', 'tiugeorgecristian@gmail.com', 'user', '2025-09-19 11:05:10', '$2y$10$h8fL/Uu4lvye7o6f90/b7e7SR5nY/uDb6Zc4AaEkuDx4F1yP9kV5O', NULL, '2025-09-19 11:05:10', '2025-09-19 10:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `why_choose_us`
--

CREATE TABLE `why_choose_us` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `why_choose_us`
--

INSERT INTO `why_choose_us` (`id`, `icon`, `title`, `short_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'fas fa-percent', 'discount voucher', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est, debitis expedita .', 1, '2025-10-30 10:55:58', '2025-10-30 11:17:55'),
(2, 'fas fa-award', 'fresh healthy foods', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est, debitis expedita .', 1, '2025-10-30 11:18:45', '2025-10-30 11:33:11'),
(3, 'fas fa-shipping-fast', 'fast serve on table', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est, debitis expedita .', 1, '2025-10-30 11:19:35', '2025-10-30 11:33:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`),
  ADD KEY `addresses_delivery_area_id_foreign` (`delivery_area_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_areas`
--
ALTER TABLE `delivery_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_galleries`
--
ALTER TABLE `product_galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_galleries_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_options_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sizes_product_id_foreign` (`product_id`);

--
-- Indexes for table `section_titles`
--
ALTER TABLE `section_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `why_choose_us`
--
ALTER TABLE `why_choose_us`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `delivery_areas`
--
ALTER TABLE `delivery_areas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_galleries`
--
ALTER TABLE `product_galleries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_options`
--
ALTER TABLE `product_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `section_titles`
--
ALTER TABLE `section_titles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `why_choose_us`
--
ALTER TABLE `why_choose_us`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_delivery_area_id_foreign` FOREIGN KEY (`delivery_area_id`) REFERENCES `delivery_areas` (`id`),
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_galleries`
--
ALTER TABLE `product_galleries`
  ADD CONSTRAINT `product_galleries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_options`
--
ALTER TABLE `product_options`
  ADD CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
