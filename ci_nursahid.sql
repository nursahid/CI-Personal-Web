-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Waktu pembuatan: 23. April 2013 jam 04:22
-- Versi Server: 5.5.16
-- Versi PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ci_nursahid`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `w250_accounts`
--

CREATE TABLE IF NOT EXISTS `w250_accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_username` varchar(255) DEFAULT NULL,
  `account_email` varchar(255) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT NULL,
  `account_fullname` varchar(255) DEFAULT NULL,
  `account_birthdate` date DEFAULT NULL,
  `account_avatar` varchar(255) DEFAULT NULL,
  `account_signature` text,
  `account_create` datetime DEFAULT NULL,
  `account_last_login` datetime DEFAULT NULL,
  `account_online_code` varchar(255) DEFAULT NULL COMMENT 'store session code for check dubplicate log in if enabled.',
  `account_status` int(1) NOT NULL DEFAULT '0' COMMENT '0=disable, 1=enable',
  `account_status_text` varchar(255) DEFAULT NULL,
  `account_new_email` varchar(255) DEFAULT NULL,
  `account_new_password` varchar(255) DEFAULT NULL,
  `account_confirm_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `w250_accounts`
--

INSERT INTO `w250_accounts` (`account_id`, `account_username`, `account_email`, `account_password`, `account_fullname`, `account_birthdate`, `account_avatar`, `account_signature`, `account_create`, `account_last_login`, `account_online_code`, `account_status`, `account_status_text`, `account_new_email`, `account_new_password`, `account_confirm_code`) VALUES
(1, 'admin', 'admin@domain.com', '5ab0383413f56451cb0fdeaa6b0b224f334f71d3', '', NULL, NULL, '', '2011-04-20 19:20:04', '2013-04-17 11:45:07', '2121fd07fe152aaf393c40c013562cd4', 1, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `w250_account_level`
--

CREATE TABLE IF NOT EXISTS `w250_account_level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_group_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`level_id`),
  KEY `level_group_id` (`level_group_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `w250_account_level`
--

INSERT INTO `w250_account_level` (`level_id`, `level_group_id`, `account_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `w250_account_level_group`
--

CREATE TABLE IF NOT EXISTS `w250_account_level_group` (
  `level_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) DEFAULT NULL,
  `level_description` text,
  `level_priority` int(5) NOT NULL DEFAULT '1' COMMENT 'lower is more higher priority',
  PRIMARY KEY (`level_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `w250_account_level_group`
--

INSERT INTO `w250_account_level_group` (`level_group_id`, `level_name`, `level_description`, `level_priority`) VALUES
(1, 'Super administrator', 'best for site owner.', 1),
(2, 'Administrator', NULL, 2),
(3, 'Member', 'Just member.', 999);

-- --------------------------------------------------------

--
-- Struktur dari tabel `w250_account_level_permission`
--

CREATE TABLE IF NOT EXISTS `w250_account_level_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_page` varchar(255) NOT NULL,
  `params` text,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `permission_page` (`permission_page`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `w250_account_level_permission`
--

INSERT INTO `w250_account_level_permission` (`permission_id`, `permission_page`, `params`) VALUES
(1, 'account_account', 'a:3:{i:1;a:5:{s:14:"account_manage";s:1:"1";s:11:"account_add";s:1:"1";s:12:"account_edit";s:1:"1";s:14:"account_delete";s:1:"1";s:19:"account_view_logins";s:1:"1";}i:2;a:5:{s:14:"account_manage";s:1:"1";s:11:"account_add";s:1:"0";s:12:"account_edit";s:1:"1";s:14:"account_delete";s:1:"0";s:19:"account_view_logins";s:1:"1";}i:3;a:5:{s:14:"account_manage";s:1:"0";s:11:"account_add";s:1:"0";s:12:"account_edit";s:1:"0";s:14:"account_delete";s:1:"0";s:19:"account_view_logins";s:1:"0";}}'),
(2, 'account_level', 'a:3:{i:1;a:4:{s:20:"account_manage_level";s:1:"1";s:17:"account_add_level";s:1:"1";s:18:"account_edit_level";s:1:"1";s:20:"account_delete_level";s:1:"1";}i:2;a:4:{s:20:"account_manage_level";s:1:"1";s:17:"account_add_level";s:1:"0";s:18:"account_edit_level";s:1:"1";s:20:"account_delete_level";s:1:"0";}i:3;a:4:{s:20:"account_manage_level";s:1:"0";s:17:"account_add_level";s:1:"0";s:18:"account_edit_level";s:1:"0";s:20:"account_delete_level";s:1:"0";}}'),
(3, 'account_permissions', 'a:3:{i:1;a:1:{s:25:"account_manage_permission";s:1:"1";}i:2;a:1:{s:25:"account_manage_permission";s:1:"0";}i:3;a:1:{s:25:"account_manage_permission";s:1:"0";}}'),
(4, 'admin_global_config', 'a:3:{i:1;a:1:{s:20:"admin_website_config";s:1:"1";}i:2;a:1:{s:20:"admin_website_config";s:1:"0";}i:3;a:1:{s:20:"admin_website_config";s:1:"0";}}'),
(5, 'account_admin_login', 'a:3:{i:1;a:1:{s:19:"account_admin_login";s:1:"1";}i:2;a:1:{s:19:"account_admin_login";s:1:"1";}i:3;a:1:{s:19:"account_admin_login";s:1:"0";}}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `w250_account_logins`
--

CREATE TABLE IF NOT EXISTS `w250_account_logins` (
  `account_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `login_ua` varchar(255) DEFAULT NULL,
  `login_os` varchar(255) DEFAULT NULL,
  `login_browser` varchar(255) DEFAULT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_attempt` int(1) NOT NULL DEFAULT '0' COMMENT '0=fail, 1=success',
  `login_attempt_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_login_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data untuk tabel `w250_account_logins`
--

INSERT INTO `w250_account_logins` (`account_login_id`, `account_id`, `login_ua`, `login_os`, `login_browser`, `login_ip`, `login_time`, `login_attempt`, `login_attempt_text`) VALUES
(1, 1, 'Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0', 'Windows', 'Firefox 19.0', '0.0.0.0', '2013-04-17 11:43:50', 0, 'wrong username or password'),
(2, 1, 'Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0', 'Windows', 'Firefox 19.0', '0.0.0.0', '2013-04-17 11:43:54', 0, 'wrong username or password'),
(3, 1, 'Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0', 'Windows', 'Firefox 19.0', '0.0.0.0', '2013-04-17 11:44:08', 0, 'wrong username or password'),
(4, 1, 'Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0', 'Windows', 'Firefox 19.0', '0.0.0.0', '2013-04-17 11:44:27', 0, 'wrong username or password'),
(5, 1, 'Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0', 'Windows', 'Firefox 19.0', '0.0.0.0', '2013-04-17 11:44:39', 0, 'wrong username or password'),
(6, 1, 'Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0', 'Windows', 'Firefox 19.0', '0.0.0.0', '2013-04-17 11:45:07', 1, 'success');

-- --------------------------------------------------------

--
-- Struktur dari tabel `w250_config`
--

CREATE TABLE IF NOT EXISTS `w250_config` (
  `config_name` varchar(255) DEFAULT NULL,
  `config_value` varchar(255) DEFAULT NULL,
  `config_core` int(1) DEFAULT '0' COMMENT '0=no, 1=yes. if config core then please do not delete from db.',
  `config_description` text,
  KEY `config_name` (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `w250_config`
--

INSERT INTO `w250_config` (`config_name`, `config_value`, `config_core`, `config_description`) VALUES
('site_name', 'Nur Sahid Website', 1, 'website name'),
('page_title_separator', ' | ', 1, 'page title separator. eg. site name | page'),
('duplicate_login', 'off', 1, 'allow log in more than 1 place, session? set to on/off to allow/disallow.'),
('allow_avatar', '1', 1, 'set to 1 if use avatar or set to 0 if not use it.'),
('avatar_size', '200', 1, 'set file size in Kilobyte.'),
('avatar_allowed_types', 'gif|jpg|png', 1, 'avatar allowe file types (see reference from codeigniter)\r\neg. gif|jpg|png'),
('avatar_path', 'assets/client/avatar/', 1, 'path to directory for upload avatar'),
('member_allow_register', '1', 1, 'allow users to register'),
('member_verification', '1', 1, 'member verification method.\r\n1 = verify by email\r\n2 = wait for admin verify'),
('site_theme', 'default', 1, 'Default Theme');

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `w250_account_level`
--
ALTER TABLE `w250_account_level`
  ADD CONSTRAINT `w250_account_level_ibfk_1` FOREIGN KEY (`level_group_id`) REFERENCES `w250_account_level_group` (`level_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `w250_account_level_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `w250_accounts` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `w250_account_logins`
--
ALTER TABLE `w250_account_logins`
  ADD CONSTRAINT `w250_account_logins_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `w250_accounts` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE;



--
-- Struktur dari tabel `w250_pages`
--

CREATE TABLE IF NOT EXISTS `w250_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `body` text NOT NULL,
  `template` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Dumping data untuk tabel `w250_pages`
--

INSERT INTO `w250_pages` (`id`, `parent_id`, `title`, `slug`, `order`, `body`, `template`) VALUES
(1, 0, 'Homepage', '', 1, '<p>My Page body here</p>', 'homepage'),
(2, 0, 'About', 'about', 2, '<p>This is about me and my site</p>', 'page'),
(3, 2, 'Contact', 'contact', 4, '<p>Contact page here</p>', 'page'),
(4, 0, 'Artikel', 'arsip-berita', 6, '<p>This is News Articles</p>', 'arsip_berita'),
(5, 2, 'Riwayat', 'riwayat', 3, 'This is news', 'page'),
(6, 0, 'Portofolio', 'arsip-portofolio', 5, '<p>Ini halaman untuk menampilkan portofolio</p>', 'arsip_portofolio');



--
-- Struktur dari tabel `w250_portofolios`
--

CREATE TABLE IF NOT EXISTS `w250_portofolios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `content` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `total_view` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Dumping data untuk tabel `w250_portofolios`
--

INSERT INTO `w250_portofolios` (`id`, `title`, `slug`, `content`, `image`, `total_view`) VALUES
(1, 'Logo SDN Kotaraya', 'logo-sdn-kotaraya', '<p>Proyek pembuatan Logo SD SSN SDN Kotaraya</p>', 'Logo-SDNKotaraya.png', 0),
(2, 'Logo SMK Negeri 1 Mepanga', 'logo-smk-negeri-1-mepanga', '<p>Ini proyek pembuatan logo SMK Negeri 1 Mepanga. Logo dibuat dengan Corel X4</p>', 'logo-smkn_1_Mpg.png', 0),
(3, 'Blangko DP3 Format Excel', 'blangko-dp3-format-excel', '<p>Iseng-iseng bantu tugas Kepala Sekolah dalam membuat DP3 dalam format Excel 2003.</p><p>Cukup isi beberapa form yang telah disediakan, selanjutnya software yang akan melakukan perhitungan dan DP3 siap untuk dicetak dengan kertas F4</p>', 'blangko-dp3.gif', 0),
(4, 'Panduan Membuat Website Mini', 'panduan-membuat-website-mini', '<p>Tutorial gratis untuk membuat website mini dengan menggunakan Frontpage.</p>\r\n\n<p>Dalam tutorial ini pembaca diajak to the point, langsung ke praktisnya. Disusun dengan menggunakan nomor urut untuk mempermudah dalam mempraktekkannya didepan PC.</p>', 'panduan_minisite.jpg', 0),
(5, 'Slide Pembelajaran Multimedia Matematika Bangun Ruang SD', 'slide-pembelajaran-multimedia-matematika-bangun-ruang-sd', '<p>Untuk ikut menyemarakkan Hari Jadi Kab. Parigi Moutong (lupa yang keberapa), pihak kecamatan Mepanga meminta sekolah SDN Kotaraya untuk merekam proses pembelajaran menggunakan multimedia.</p>\r\n\n<p>Nah... ini dia hasil kerja semalaman... sebuah pembelajaran matematika bangun ruang untuk kelas 5 SD.</p>\r\n\n<p>Mohon kritikan dan sarannya... Yang mau unduh silakan klik kategori GRATIS&nbsp;</p>', 'slide_matematika_sd_bangun_ruang.jpg', 0),
(6, 'Manajeman Data Guru dan Siswa dengan PHP', 'manajeman-data-guru-dan-siswa-dengan-php', '<p>Bermula dari kendala menangani siswa mutasi dan permintaan data yang kudu cepet-cepet. Akhirnya ane mencoba buat kecil-kecilan software pendataan data siswa dengan PHP.</p>\r\n\n<p>Rencana kedepan akan ditambahkan modul Guru dan pelaporan bulanan, tahunan.</p>', 'datasiswapro.png', 0),
(7, 'Script Nagaya Affiliate System', 'script-nagaya-affiliate-system', '<p>Script ini pernah ane jual dengan harga super murah yaitu cuman $6 doang.</p>\r\n\n<p>Dan udah ada 2 pembeli dari negeri Jiran.. Setelah saya matiin webnya.. sekitar setahunan.. Iseng-iseng saya cek di Google ternyata ada yang make.. tapi bukan konsumen resmi... alias ilegal.</p>\r\n\n<p>Dari situlah akhirnya saya memutuskan untuk menggratiskan script ini.. Semoga bermanfaat..&nbsp;</p>\r\n\n<p>&nbsp;</p>', 'open-nagaya.jpg', 0),
(8, 'Website Pribadi dengan CodeIgniter', 'website-pribadi-dengan-codeigniter', '<p>Sambil menyelam minum air... sambil belajar langsung bikin website pribadi pake CodeIgniter2.02</p>\r\n\n<p>Dan inilah template yang saya gunakan. Pake HTML5 broo...&nbsp;</p>', 'klimisWeb-shoot.png', 0),
(9, 'Logo Jurusan Tehnik Komputer dan Jaringan', 'logo-jurusan-tehnik-komputer-dan-jaringan', '<p>Ini hasil usaha pembuatan logo jurusan TKJ SMK Negeri 1 Mepanga</p>', 'Logo_Jurusan_TKJ.png', 0),
(10, 'Logo Jurusan Pertanian', 'logo-jurusan-pertanian', '<p>Ini logo Jurusan Agrobisnis Pertanian Hortikultura SMK Negeri 1 Mepanga</p>', 'Logo_Jurusan_PERTANIAN.png', 0),
(11, 'Jurusan Perikanan dan Kelautan', 'jurusan-perikanan-dan-kelautan', '<p>Logo Jurusan Agrobisnis Perikanan dan Kelautan SMK Negeri 1 Mepanga</p>', 'Logo_Jurusan_Perikanan.png', 0),
(12, 'Logo SMP 3 Mepanga', 'logo-smp-3-mepanga', '<p>Setelah seharian muter-muter isi kepala untuk membuat desain yang cocok... AKhirnya terciptalah logo ini. Logo SMP 3 Mepanga atas permintaan dari kepala sekolahnya Bpk Drs. Agustan</p>', 'http://localhost/project/mywebsite/public/uploads/portofolios/100ribu.jpg', 0);



--
-- Struktur dari tabel `w250_blog_articles`
--

CREATE TABLE IF NOT EXISTS `w250_blog_articles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `pubdate` date NOT NULL,
  `body` text NOT NULL,
  `author` varchar(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `w250_blog_articles`
--

INSERT INTO `w250_blog_articles` (`id`, `title`, `slug`, `pubdate`, `body`, `author`, `created`, `modified`) VALUES
(1, 'Halo selamat datang', 'halo-selamat-datang', '2013-03-15', '<p><strong>Hallo selamat datang</strong></p>\r\n<p>selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet selamat selamat slamet</p>\r\n<p>&nbsp;</p>\r\n<p>selamat selamat slamet </p>', '1','2013-03-15 09:37:20', '2013-03-15 14:59:08'),
(2, 'Artikel kedua', 'artikel-kedua', '2013-03-15', '<p>Ini adalah artikel kedua bukan istri kedua Ini adalah artikel kedua bukan istri kedua Ini adalah artikel kedua bukan istri kedua Ini adalah artikel kedua bukan istri kedua Ini adalah artikel kedua bukan istri kedua Ini adalah artikel kedua bukan istri kedua Ini adalah artikel kedua bukan istri kedua Ini adalah artikel kedua bukan istri kedua Ini adalah artikel kedua bukan istri kedua Ini adalah artikel kedua bukan istri kedua Ini adalah artikel kedua bukan istri kedua</p>', '1', '2013-03-15 15:07:43', '2013-03-15 15:07:43'),
(3, 'Gallery CMS using Codeigniter', 'gallery-cms-using-codeigniter', '2013-03-15', '<ol>\r\n<li>GalleryCMS is a free software application built on the CodeIgniter framework.</li>\r\n<li>&nbsp;The GalleryCMS application is licensed under the MIT License.</li>\r\n<li>&nbsp;The CodeIgniter framework is licensed separately.</li>\r\n<li>&nbsp;The CodeIgniter framework license is packaged in this application (license.txt)</li>\r\n</ol>', '1', '2013-03-15 15:18:27', '2013-03-17 17:26:11'),
(4, 'Permission is hereby granted', 'permission-is-hereby-granted', '2013-03-17', '<p>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation&nbsp; files (the "Software"), to deal in the Software without&nbsp; restriction, including without limitation the rights to use,&nbsp; copy, modify, merge, publish, distribute, sublicense, and/or sell&nbsp; copies of the Software, and to permit persons to whom the&nbsp; Software is furnished to do so, subject to the following&nbsp; conditions:<br /><br />&nbsp;The above copyright notice and this permission notice shall be&nbsp; included in all copies or substantial portions of the Software.<br /><br /></p>', '1', '2013-03-17 17:25:10', '2013-03-17 17:25:10');


-- --------------------------------------------------------

--
-- Struktur dari tabel `w250_blog_articles_categories`
--

CREATE TABLE IF NOT EXISTS `w250_blog_articles_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;