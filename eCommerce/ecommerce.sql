-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2021 at 07:18 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add contact', 8, 'add_contact'),
(30, 'Can change contact', 8, 'change_contact'),
(31, 'Can delete contact', 8, 'delete_contact'),
(32, 'Can view contact', 8, 'view_contact'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add customer', 10, 'add_customer'),
(38, 'Can change customer', 10, 'change_customer'),
(39, 'Can delete customer', 10, 'delete_customer'),
(40, 'Can view customer', 10, 'view_customer'),
(41, 'Can add order', 11, 'add_order'),
(42, 'Can change order', 11, 'change_order'),
(43, 'Can delete order', 11, 'delete_order'),
(44, 'Can view order', 11, 'view_order'),
(45, 'Can add shipping address', 12, 'add_shippingaddress'),
(46, 'Can change shipping address', 12, 'change_shippingaddress'),
(47, 'Can delete shipping address', 12, 'delete_shippingaddress'),
(48, 'Can view shipping address', 12, 'view_shippingaddress'),
(49, 'Can add order item', 13, 'add_orderitem'),
(50, 'Can change order item', 13, 'change_orderitem'),
(51, 'Can delete order item', 13, 'delete_orderitem'),
(52, 'Can view order item', 13, 'view_orderitem'),
(53, 'Can add contact us', 14, 'add_contactus'),
(54, 'Can change contact us', 14, 'change_contactus'),
(55, 'Can delete contact us', 14, 'delete_contactus'),
(56, 'Can view contact us', 14, 'view_contactus');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$sfwZH83KvzFW$EFJxNIPqH0TdCaSX+fPANntuJjwK3jO8yqlv5lP+bHc=', '2021-04-20 08:42:47.378484', 0, 'paruhang', '', '', 'angdembeparuhang@gmail.com', 0, 1, '2021-04-20 08:41:29.708303'),
(2, 'pbkdf2_sha256$216000$P29CjkfdSqEP$gZP/5vZM+UOlJgMdiGh6nlh6K05YEGL0y36P6tzTXQ4=', '2021-04-20 10:19:23.507021', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2021-04-20 08:44:08.795510'),
(3, 'pbkdf2_sha256$216000$5b7nws5FcW1n$XISsaR552UTosCBRxnezXLCjo63LVSrIxpVlKNqSAJU=', '2021-04-20 10:09:09.319542', 0, 'customerone', '', '', 'cus@gmail.com', 0, 1, '2021-04-20 09:02:43.878624'),
(4, 'pbkdf2_sha256$216000$xRD9a6HQoIRa$bYshTiD5o8rXlqKAHvFQYcowGzp7KhFl9/XlXTu72UY=', '2021-04-20 10:18:37.047272', 0, 'wang', '', '', 'wang@gmail.com', 0, 1, '2021-04-20 10:18:29.067190');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart_category`
--

CREATE TABLE `cart_category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `date_created` datetime(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_category`
--

INSERT INTO `cart_category` (`id`, `name`, `slug`, `date_created`) VALUES
(1, 'table', 't', '2021-04-20 08:48:28.935356'),
(2, 'Sofa', 'sofa1slug', '2021-04-20 13:24:51.945641'),
(3, 'Chair', '#ChairSlug', '2021-04-20 13:25:22.100319');

-- --------------------------------------------------------

--
-- Table structure for table `cart_contact`
--

CREATE TABLE `cart_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `date_created` datetime(6),
  `street` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_contact`
--

INSERT INTO `cart_contact` (`id`, `name`, `email`, `address`, `phone`, `date_created`, `street`) VALUES
(1, 'paruhang', 'paruhanglimbu5@gmail.com', 'Madhyapur Thimi 44600', '+9779860903054', '2021-04-20 09:10:27.531226', '9000');

-- --------------------------------------------------------

--
-- Table structure for table `cart_contactus`
--

CREATE TABLE `cart_contactus` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(250) NOT NULL,
  `subject` varchar(550) NOT NULL,
  `message` longtext DEFAULT NULL,
  `date_created` datetime(6),
  `label` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart_customer`
--

CREATE TABLE `cart_customer` (
  `id` int(11) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_customer`
--

INSERT INTO `cart_customer` (`id`, `email`, `user_id`, `username`) VALUES
(1, 'cus@gmail.com', 3, 'paruhang');

-- --------------------------------------------------------

--
-- Table structure for table `cart_order`
--

CREATE TABLE `cart_order` (
  `id` int(11) NOT NULL,
  `date_ordered` datetime(6) DEFAULT NULL,
  `transaction_id` varchar(200) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_order`
--

INSERT INTO `cart_order` (`id`, `date_ordered`, `transaction_id`, `customer_id`) VALUES
(1, '2021-04-17 14:02:25.000000', 'qwerty', 3),
(2, '2021-04-20 09:37:42.467796', NULL, 2),
(3, '2021-04-20 10:18:43.364123', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `cart_orderitem`
--

CREATE TABLE `cart_orderitem` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_orderitem`
--

INSERT INTO `cart_orderitem` (`id`, `quantity`, `date_added`, `order_id`, `product_id`) VALUES
(2, 8, '2021-04-20 09:37:42.482759', 2, 3),
(3, 7, '2021-04-20 09:45:41.868469', 2, 4),
(5, 1, '2021-04-20 10:08:25.772082', 1, 3),
(6, 1, '2021-04-20 10:08:26.466231', 1, 4),
(7, 1, '2021-04-20 10:18:43.369124', 3, 3),
(8, 1, '2021-04-20 10:18:44.290190', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `cart_product`
--

CREATE TABLE `cart_product` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `discounted_price` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(50) NOT NULL,
  `label` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date_created` datetime(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_product`
--

INSERT INTO `cart_product` (`id`, `name`, `slug`, `price`, `discounted_price`, `description`, `status`, `label`, `image`, `category_id`, `date_created`) VALUES
(3, 'Sofa On Sale', '#sofa', 444, 0, 'Sofa On Sale', 'In Stock', 'Sale Product', 'sale2.jpg', 2, '2021-04-20 09:00:27.606878'),
(4, 'Sofa On Sale', '@sofa', 123, 0, 'On Sale!', 'In Stock', 'Sale Product', 'sale1.jpg', 2, '2021-04-20 09:45:35.633993'),
(5, 'sofa on sale', '#sofa!', 123, 0, 'this is a sofa', 'In Stock', 'Sale Product', 'sale3.jpg', 2, '2021-04-20 13:22:17.124494'),
(6, 'Chair One', 'chaironeslug', 1000, 0, 'Chair one', 'In Stock', 'New Product', 'chair1.jpg', 3, '2021-04-20 13:26:48.843689'),
(7, 'Chair Two', 'chairtwoslug', 1000, 0, 'This Chair Two', 'In Stock', 'New Product', 'chair2.jpg', 3, '2021-04-20 13:27:24.960603'),
(8, 'Chair Three', 'chairthreeslug', 1000, 0, 'This is chair three', 'In Stock', 'New Product', 'chari4_mtkww3Z.jpg', 3, '2021-04-20 13:27:58.328620'),
(9, 'Chair Four', 'chiarfourslug', 1000, 0, 'This is chair four', 'In Stock', 'New Product', 'chair6.jpg', 3, '2021-04-20 13:28:41.999624'),
(10, 'Table One', 'tableone', 1000, 0, 'This is a table', 'In Stock', 'Hot Product', 'table2.jpg', 1, '2021-04-20 13:32:41.443855');

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippingaddress`
--

CREATE TABLE `cart_shippingaddress` (
  `id` int(11) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `zipcode` varchar(200) DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-04-20 09:00:50.032474', '2', 'sofa421', 3, '', 9, 2),
(2, '2021-04-20 09:00:50.035468', '1', 'edesk', 3, '', 9, 2),
(3, '2021-04-20 09:09:28.771067', '1', 'qwerty', 1, '[{\"added\": {}}]', 11, 2),
(4, '2021-04-20 09:09:40.453773', '1', 'OrderItem object (1)', 1, '[{\"added\": {}}]', 13, 2),
(5, '2021-04-20 09:10:06.290534', '1', 'paruhang', 1, '[{\"added\": {}}]', 10, 2),
(6, '2021-04-20 09:10:27.532218', '1', 'paruhang', 1, '[{\"added\": {}}]', 8, 2),
(7, '2021-04-20 09:45:35.635988', '4', 'asdfasdfs paruhang', 1, '[{\"added\": {}}]', 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'cart', 'category'),
(8, 'cart', 'contact'),
(14, 'cart', 'contactus'),
(10, 'cart', 'customer'),
(11, 'cart', 'order'),
(13, 'cart', 'orderitem'),
(9, 'cart', 'product'),
(12, 'cart', 'shippingaddress'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-04-20 08:37:18.811155'),
(2, 'auth', '0001_initial', '2021-04-20 08:37:18.936793'),
(3, 'admin', '0001_initial', '2021-04-20 08:37:19.179320'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-04-20 08:37:19.238171'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-04-20 08:37:19.244145'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-04-20 08:37:19.324928'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-04-20 08:37:19.369856'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-04-20 08:37:19.391750'),
(9, 'auth', '0004_alter_user_username_opts', '2021-04-20 08:37:19.401728'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-04-20 08:37:19.471550'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-04-20 08:37:19.473534'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-04-20 08:37:19.479516'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-04-20 08:37:19.494476'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-04-20 08:37:19.513425'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-04-20 08:37:19.564288'),
(16, 'auth', '0011_update_proxy_permissions', '2021-04-20 08:37:19.585233'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-04-20 08:37:19.605179'),
(18, 'cart', '0001_initial', '2021-04-20 08:37:19.703914'),
(19, 'cart', '0002_auto_20210322_1131', '2021-04-20 08:37:19.778714'),
(20, 'cart', '0003_product_date_created', '2021-04-20 08:37:19.797665'),
(21, 'cart', '0004_auto_20210416_2311', '2021-04-20 08:37:19.805642'),
(22, 'cart', '0005_category_date_created', '2021-04-20 08:37:19.842549'),
(23, 'cart', '0006_customer_order_orderitem_shippingaddress', '2021-04-20 08:37:19.981179'),
(24, 'cart', '0007_auto_20210418_2136', '2021-04-20 08:37:20.225520'),
(25, 'cart', '0008_auto_20210418_2232', '2021-04-20 08:37:20.231503'),
(26, 'cart', '0009_remove_category_image', '2021-04-20 08:37:20.244469'),
(27, 'cart', '0010_auto_20210419_2135', '2021-04-20 08:37:20.306303'),
(28, 'cart', '0011_auto_20210419_2139', '2021-04-20 08:37:20.360158'),
(29, 'cart', '0012_auto_20210419_2146', '2021-04-20 08:37:20.395460'),
(30, 'cart', '0013_auto_20210420_1130', '2021-04-20 08:37:20.481230'),
(31, 'cart', '0014_auto_20210420_1305', '2021-04-20 08:37:20.551044'),
(32, 'cart', '0015_contactus_slug', '2021-04-20 08:37:20.628836'),
(33, 'cart', '0016_remove_contactus_slug', '2021-04-20 08:37:20.641802'),
(34, 'cart', '0017_auto_20210420_1407', '2021-04-20 08:37:20.728569'),
(35, 'sessions', '0001_initial', '2021-04-20 08:37:20.754535'),
(36, 'cart', '0018_auto_20210420_1522', '2021-04-20 09:37:32.117291');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cart_category`
--
ALTER TABLE `cart_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `cart_contact`
--
ALTER TABLE `cart_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_contactus`
--
ALTER TABLE `cart_contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_customer`
--
ALTER TABLE `cart_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_order`
--
ALTER TABLE `cart_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_order_customer_id_c205ee6a_fk_auth_user_id` (`customer_id`);

--
-- Indexes for table `cart_orderitem`
--
ALTER TABLE `cart_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_orderitem_order_id_bfb4d452_fk_cart_order_id` (`order_id`),
  ADD KEY `cart_orderitem_product_id_7e8cb6d7_fk_cart_product_id` (`product_id`);

--
-- Indexes for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `cart_product_category_id_9c9d42c0_fk_cart_category_id` (`category_id`);

--
-- Indexes for table `cart_shippingaddress`
--
ALTER TABLE `cart_shippingaddress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_shippingaddress_customer_id_d55e98c4_fk_cart_customer_id` (`customer_id`),
  ADD KEY `cart_shippingaddress_order_id_4233251b_fk_cart_order_id` (`order_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_category`
--
ALTER TABLE `cart_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_contact`
--
ALTER TABLE `cart_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_contactus`
--
ALTER TABLE `cart_contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_customer`
--
ALTER TABLE `cart_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_order`
--
ALTER TABLE `cart_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_orderitem`
--
ALTER TABLE `cart_orderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart_product`
--
ALTER TABLE `cart_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart_shippingaddress`
--
ALTER TABLE `cart_shippingaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart_customer`
--
ALTER TABLE `cart_customer`
  ADD CONSTRAINT `cart_customer_user_id_a1e0b54a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart_order`
--
ALTER TABLE `cart_order`
  ADD CONSTRAINT `cart_order_customer_id_c205ee6a_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart_orderitem`
--
ALTER TABLE `cart_orderitem`
  ADD CONSTRAINT `cart_orderitem_order_id_bfb4d452_fk_cart_order_id` FOREIGN KEY (`order_id`) REFERENCES `cart_order` (`id`),
  ADD CONSTRAINT `cart_orderitem_product_id_7e8cb6d7_fk_cart_product_id` FOREIGN KEY (`product_id`) REFERENCES `cart_product` (`id`);

--
-- Constraints for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `cart_product_category_id_9c9d42c0_fk_cart_category_id` FOREIGN KEY (`category_id`) REFERENCES `cart_category` (`id`);

--
-- Constraints for table `cart_shippingaddress`
--
ALTER TABLE `cart_shippingaddress`
  ADD CONSTRAINT `cart_shippingaddress_customer_id_d55e98c4_fk_cart_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `cart_customer` (`id`),
  ADD CONSTRAINT `cart_shippingaddress_order_id_4233251b_fk_cart_order_id` FOREIGN KEY (`order_id`) REFERENCES `cart_order` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
