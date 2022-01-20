-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2022 at 01:27 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Universitas Hasanuddin', '2022-01-08 14:43:28', '2022-01-08 14:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `docs`
--

CREATE TABLE `docs` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL DEFAULT 1,
  `types_id` int(11) NOT NULL,
  `docs_name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NIM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` int(11) NOT NULL,
  `stok_buku` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `book_code` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `files` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `docs`
--

INSERT INTO `docs` (`id`, `account_id`, `types_id`, `docs_name`, `author`, `publisher`, `NIM`, `department`, `year`, `stok_buku`, `status`, `book_code`, `files`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Geologi Daerah Batu Karopak Kecamatan Rilau Ale Kab. Bulukumba Provinsi Sulawesi Selatan ', 'Syamsurizal', NULL, ' D61115001', 'TEKNIK GEOLOGI', 2021, 1, 1, 'SKR-2021 SYA            s', NULL, NULL, NULL, NULL),
(2, 1, 1, 'Analisis potensi air tanah menggunakan metode geolistrik daerah bontosunggu desa baruga kecamatan  pajukukang kab bantaeng prov sulsel', 'Asmi Azis Efendy', NULL, NULL, 'TEKNIK GEOLOGI', 2021, 1, 1, 'SKR-2021 EFE            a', NULL, NULL, NULL, NULL),
(3, 1, 1, 'Geologi Daerah Jojjolo dan Studi Provenaance Batupasir Formasi Walanae Kecamatan Bulukumpa Kab. Bulukumba Provinsi Sulawesi Selatan ', 'Muhammad Junaedy Burhan ', NULL, 'D61115309', 'TEKNIK GEOLOGI', 2021, 1, 1, 'SKR-2021 BUR           g', NULL, NULL, NULL, NULL),
(4, 1, 1, 'Analisis Korelasi Mgo DAN SiO2 Terhadap Nikel Laterit Daerah USSU Kecamatan Malili Kabupaten Luwu Timur Provinsi Sulawesi Selatan', 'Mukhaimin ', NULL, 'D61116006', 'TEKNIK GEOLOGI', 2021, 1, 1, 'SKR-2021 MUK          a', NULL, NULL, NULL, NULL),
(5, 1, 1, 'Analisis Perubahan Kadar Bijih Besi (Fe) Laterit Berdasarkan Data Pengeboran, Penambangan, dan Stock Pile Pada Pit Blok 1 Curang, Kecamatan Pulau Sebuku, Kabupaten Kota Baru, Provinsi Kalimantan Selatan', 'Fadli              ', NULL, 'D61116011', 'TEKNIK GEOLOGI', 2021, 1, 1, 'SKR-2021 FAD           a', NULL, NULL, NULL, NULL),
(6, 1, 1, 'Geologi dan Analisis Kestabilan Lereng Daerah Lakahang Kecamatan Tabulahan Kabupaten Mamas Provinsi Sulawesi Barat', 'Muh. Dzulfahmi Rusli ', NULL, 'D61115511', 'TEKNIK GEOLOGI', 2021, 1, 1, 'SKR-2021 RUS           g', NULL, NULL, NULL, NULL),
(7, 1, 1, 'Pengembangan Geowisata Berdasarkan Karakteristik Pantai Menggunakan Data Penginderaan Jauh Daerah Tabjung Bira Kabupaten Bulukumba Provinsi Sulawesi Selatan', 'Muh. Agung Syamsuddin ', NULL, 'D61115307', 'TEKNIK GEOLOGI', 2021, 1, 1, 'SKR-2021 SYA           p', NULL, NULL, NULL, NULL),
(8, 1, 1, 'Studi Mineralisasi Mangan dan Mineral Bijih Ikutannya Pada Daerah Paludda Kabupaten Barru Propinsi Sul Sel', 'Wahyu Fauzi ', NULL, 'D61115508', 'TEKNIK GEOLOGI', 2021, 1, 1, 'SKR-2021 FAU           s', NULL, NULL, NULL, NULL),
(10, 1, 1, 'Rumah Sakit Kanker di Makassar Dengan Pendekatan ', 'Fadillah', NULL, ' D61114508', 'TEKNIK ARSITEKTUR', 2021, 1, 1, 'SKR-2021 FAD            r', NULL, NULL, NULL, NULL),
(11, 1, 1, 'Pasar Industri Kreatif di kota Bandung Dengan Pendekatan Arsitektur Kontemporer', 'Andi Muhammad Fatahillah ', NULL, 'D51115322', 'TEKNIK ARSITEKTUR', 2021, 1, 1, 'SKR-2021 BAT           e', NULL, NULL, NULL, NULL),
(12, 1, 1, 'STREET ART PARK', 'Muhammad Arief ', NULL, 'D51115516', 'TEKNIK ARSITEKTUR', 2021, 1, 1, 'SKR-2021 ARI            s', NULL, NULL, NULL, NULL),
(14, 1, 1, 'Analisis Stabilitas Lereng Berdasarkan Sifat Keteknikan Tanah Residu Pada Area Kebun Kopi Ruas Jalan Tawaeli-Toboli Kota Palu Sulawesi Tengah', 'M Zainul Bahar ', NULL, 'D062182003', 'S2 TEKNIK GEOLOGI', 2021, 1, 1, 'S2-2021 BAH           a', NULL, NULL, NULL, NULL),
(15, 1, 1, 'Simulsi Perbandingn Diameter Coring LDD dan HQ Berdasarkan Hasil Estimiasi Sumber Daya Tertunjuk Nikel Laterit dengan Hasil Produksi Menggunakan Metode Polygon dan Inverse Distance Weingtinng', 'Muhammad bima Abdillah ', NULL, 'D62116301', 'TEKNIK PERTAMBANGAN', 2021, 1, 1, 'SKR-2021 ABD            s', NULL, NULL, NULL, NULL),
(16, 1, 1, 'Estimasi Sumber Daya Terukur Endapan Bijih Nikel Laterit Menggunkan Metode Geostatistik', 'Ulan Batawen ', NULL, 'D62116020', 'TEKNIK PERTAMBANGAN', 2021, 1, 1, 'SKR-2021 BAT           e', NULL, NULL, NULL, NULL),
(17, 1, 1, 'Studi Ekstraksi Nikel Dari Bijih Limonit Menggunakan Asam Oksalat', 'Yunita Sri Sutarni Dapo ', NULL, 'D62116009', 'TEKNIK PERTAMBANGAN', 2021, 1, 1, 'SKR-2021 DAP           s', NULL, NULL, NULL, NULL),
(18, 1, 1, 'Studi Dealuminasi Zeolit  Menggunakan Asam Sitrat Dari Jeruk Nipis (Citrus Aurantifolia Swingle) Bahan Absorben', 'Muhammad Akbar Musseng ', NULL, 'D62116512', 'TEKNIK PERTAMBANGAN', 2021, 1, 1, 'SKR-2021 MUS          s', NULL, NULL, NULL, NULL),
(20, 1, 1, 'Pengaruh Konsentrasi NaCI Terhadap Korosi Kelelahan Pada Aluminium M 5005', 'Imam Adli Agil ', NULL, 'D21115029', 'TEKNIK MESIN', 2021, 1, 1, 'SKR-2021 ADL           p', NULL, NULL, NULL, NULL),
(21, 1, 1, 'Analisis Pengaruh Degradasi Lignin Serat Sabut Kelapa Menggunakan Mediasi Fungsi Terhadap Karakteristik Interlock Serat Matriks', 'Muhammad Try Putra Juli Safitra  ', NULL, 'D21116317', 'TEKNIK MESIN', 2021, 1, 1, 'SKR-2021 SAF            a', NULL, NULL, NULL, NULL),
(22, 1, 1, 'Analisis Performa pompa roda Gigi Terhadap Putaran Dengan Variasi Pembukaan Katup ', 'Hiko Devies Pakiding ', NULL, 'D21116324', 'TEKNIK MESIN', 2021, 1, 1, 'SKR-2021 PAK           a', NULL, NULL, NULL, NULL),
(23, 1, 1, 'Analisis Getaran dan Kebisingan Mesin Diesel Type TV1 Akibat Pengaruh Purifikasi Bahan Bakar', 'La Ode Nuzul Fajrin ', NULL, 'D21116006', 'TEKNIK MESIN', 2021, 1, 1, 'SKR-2021 FAJ            a', NULL, NULL, NULL, NULL),
(24, 1, 1, 'Pengaruh Variasi Penambahan Konsentrasi NaCI Terhadap Perilaku Fatik Korosi Pada Aluminium 7075', 'Cahyadi  Surachman ', NULL, 'D21116024 ', 'TEKNIK MESIN', 2021, 1, 1, 'SKR-2021 SUR           p', NULL, NULL, NULL, NULL),
(25, 1, 1, 'Pengaruh Ariasi Beban Terhadap Korosi Kelelahan Aluminium A15005 Pada Lingkungan N0C1', 'Revansi Junarto', NULL, ' D21116314', 'TEKNIK MESIN', 2021, 1, 1, 'SKR-2021 JUN           p', NULL, NULL, NULL, NULL),
(26, 1, 1, 'Analisis Pengaruh Variasi Rasio Kompresi Terhadap Kinerja Mesin Diesel TV1 Menggunakan Bahan bakar Biodeesel Dengan Temperature 60 C', 'Muhammad Ismail Gosalam ', NULL, 'D21116033', 'TEKNIK MESIN', 2021, 1, 1, 'SKR-2021 GOS          a', NULL, NULL, NULL, NULL),
(27, 1, 1, 'Analisis Ketersediaan air Embung Holtikurtura Kabupaten Maros ', 'Muh Hanif Muharram ', NULL, 'D11116509', 'TEKNIK SIPIL', 2021, 1, 1, 'SKR-2021 MUH          a', NULL, NULL, NULL, NULL),
(28, 1, 1, 'Studi Pengaruh Variasi Tebal Pelat Bton Bertulang Berongga Terhadap kapasitas Lentur', 'Bella Anisha Al hayyu ', NULL, 'D11116317', 'TEKNIK SIPIL', 2021, 1, 1, 'SKR-2021 HAY           s ', NULL, NULL, NULL, NULL),
(29, 1, 1, 'Analisis Bangkitan dan Tarikan Perjalanan  Truk Perusahaan Pengiriman Kargo Udara Bandara Sultan hasanuddin', 'Niels Pasorong  ', NULL, 'D11116305', 'TEKNIK SIPIL', 2021, 1, 1, 'SKR-2021 PAS           a', NULL, NULL, NULL, NULL),
(30, 1, 1, 'Analisis Karakteristik Aliran dan Prgerakan Sedimen Dasar Pada Abutment Jembatan Tipe Wing Wall', 'La Ode muhammad Rizqi ', NULL, 'D11116309', 'TEKNIK SIPIL', 2021, 1, 1, 'SKR-2021 RIZ             a', NULL, NULL, NULL, NULL),
(31, 1, 1, 'Studi Karakteristik Pedestrian Pada Manajemen Lalu Lintas di Kampus Unhas Tamalanrea', 'Rangga Trisaputra Dariman ', NULL, 'D11116320', 'TEKNIK SIPIL', 2021, 1, 1, 'SKR-2021 DAR             s ', NULL, NULL, NULL, NULL),
(32, 1, 1, 'Pemodelan Arus dan Gelombang di Muara Sungai Jeneberang Dengan Aplikasi Mike 21 Application  ', 'Muh. Reysha S. Kasim ', NULL, 'D11115524', 'TEKNIK SIPIL', 2021, 1, 1, 'SKR-2021 KAS           p', NULL, NULL, NULL, NULL),
(33, 1, 1, 'Karakteristik kuat Tarik Modular X-Blok ', 'Fardhu Aslam N.R Artata ', NULL, 'D11116516', 'TEKNIK SIPIL', 2021, 1, 1, 'SKR-2021 ART           k', NULL, NULL, NULL, NULL),
(34, 1, 1, 'Analisis Kapasitas Saluran drainase Kota Pinrang', 'Ahmad Fauzan Rahman ', NULL, 'D11114004', 'TEKNIK SIPIL', 2021, 1, 1, 'SKR-2021 RAH          a', NULL, NULL, NULL, NULL),
(35, 1, 1, 'Analisis Pengaruh Kemiringan Sungai Terhadap Diameter Partikel Sedimen di Sungai Jeneberang', 'Andi Irfansyah Amir ', NULL, 'D11114513', 'TEKNIK SIPIL', 2021, 1, 1, 'SKR-2021 AMI           a', NULL, NULL, NULL, NULL),
(36, 1, 1, 'Pengaruh Penambahan Material Aditif Pada Tanah Terstabilisasi Zeolit Yang Mengalami Siklus Basah Kering', 'Tryanto Chrisma Ratu ', NULL, 'D11116533 ', 'TEKNIK SIPIL', 2021, 1, 1, 'SKR-2021 RAT           p', NULL, NULL, NULL, NULL),
(37, 1, 1, 'Studi Komparasi Siklus Basah Kering Terhadap Nilai Kuat Tekan Tanah Dengan Berbagai Jenis Aditif', 'Gary Michel Sarungu ', NULL, 'D11116302', 'TEKNIK SIPIL', 2021, 1, 1, 'SKR-2021 SAR           s', NULL, NULL, NULL, NULL),
(38, 1, 1, 'Analisis Kesetimbangan massa Sampah Domestik Kmpus ', 'Nur hayyu Alam ', NULL, 'D12116010', 'TEKNIK LINGKUNGAN', 2021, 1, 1, 'SKR-2021 ALA           a', NULL, NULL, NULL, NULL),
(39, 1, 1, 'Pemanfaatan Limbah Carsul PT. Vale Indonesia, TBK Sebagai Koagulan untuk untuk Menurunkan Konsentrasi Chrome Hexavalent Dalam Air Limbah Industri Nikel', 'Muhammad Muzammil Ikmal ', NULL, 'D12116504', 'TEKNIK LINGKUNGAN', 2021, 1, 1, 'SKR-2021 IKM           p', NULL, NULL, NULL, NULL),
(40, 1, 1, 'Pemanfaatan Sisa Pac Dari Limbah PDAM Untuk Mereduksi Kandungan Fosfat Dalam Limbah Laundry', 'Ahmad Burhanuddin ', NULL, 'D12115308', 'TEKNIK LINGKUNGAN', 2021, 1, 1, 'SKR-2021 BUR          p', NULL, NULL, NULL, NULL),
(41, 1, 1, 'Pengaruh Jarak dan Kmiringan Plate Settler Terhadap Efesiensi Penyisihan TSS Pada Reaktor sedimentasi Rectangular', 'Ikhsan Harsa ', NULL, 'D12114305', 'TEKNIK LINGKUNGAN', 2021, 1, 1, 'SKR-2021 HAR          p', NULL, NULL, NULL, NULL),
(42, 1, 1, 'Pengaruh Kemiringan dan diameter Tube Settler Terhadap Penurunan Nilai Kekeruhan dan Efesiensi Penyisihan Tss Pada  Reaktor Sedimentasi Rectangular', 'Andi Nur Qalbih I ', NULL, 'D12114313', 'TEKNIK LINGKUNGAN', 2021, 1, 1, 'SKR-2021 QAL          p', NULL, NULL, NULL, NULL),
(43, 1, 1, 'Studi Perbandingan Estimasi Emisi Gas Rumah Kaca TPA Tamangapa ', 'Ernny Oktaflani Wunanto ', NULL, 'D12116011', 'TEKNIK LINGKUNGAN', 2021, 1, 1, 'SKR-2021 WUN          s', NULL, NULL, NULL, NULL),
(44, 1, 1, 'Studi Potensi Pemanfaatan Limbah Sambut Kelapa Sebagai Pupuk Organik', 'Dewi Yunita Sari ', NULL, 'D12116512', 'TEKNIK LINGKUNGAN', 2021, 1, 1, 'SKR-2021 SAR           s', NULL, NULL, NULL, NULL),
(45, 1, 2021, 'Alterasi dan Mineralisasi Hidrothermal Daerah Mamungaa, Kabupaten Bonebolango Propinsi Gorontalo', 'Djamal Adi Nugroho Uno ', NULL, 'D062191007', 'S2 TEKNIK GEOLOGI', 1, 1, 1, 'S2-2021 UNO          a', NULL, NULL, NULL, NULL),
(46, 1, 2021, 'Analisis Karakteristik Batuan Perangkap Aspal Batu Buton (Asbuton ) Pada Blok Kabungka Tambang C Kabupaten Buton Sulawesi Tenggara', 'Isman Saleh ', NULL, 'D062191002', 'S2 TEKNIK GEOLOGI', 1, 1, 1, 'S2-2021 SAL            a', NULL, NULL, NULL, NULL),
(47, 1, 2021, 'Deteksi Genangan Sampah Pada Permukaan Air Kanal Dengan Menggunakan Metode Deep Learning', 'Artamenia Khairunnisa Eka Amrullah ', NULL, 'D42115508', 'TEKNIK INFORMATIKA', 1, 1, 1, 'SKR-2021 AMR            d', NULL, NULL, NULL, NULL),
(48, 1, 2021, 'Perancangan Sistem Online Monitoring Pembebanan Transformator Distribusi Menggunakan Wemos', 'Adnan Mujahid ', NULL, 'D41116009', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 MUJ          p', NULL, NULL, NULL, NULL),
(49, 1, 2021, 'Perancangan Sistem Monitoring Aliran daya Menggunakan Mikrokontroller', 'Wira Aprianto Ilham ', NULL, 'D41116017', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 ILH            p', NULL, NULL, NULL, NULL),
(50, 1, 2021, 'Rancang Bangun Generator Linier Untuk Konversi Energi Gelombang Air Laut', 'Ahmad Asadul Kadar ', NULL, 'D41116507', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 KAD           r ', NULL, NULL, NULL, NULL),
(51, 1, 2021, 'Studi Potensi Pembangkit Listrik Tenaga Surya Berbasis Aplikasi Geographic Information System (GIS) Studi Kasus ', 'Fadli Alfiansyah ', NULL, 'D41116314', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 ALF            s ', NULL, NULL, NULL, NULL),
(52, 1, 2021, 'Perancangan Kontrol Automatic  Transfer Switch (ATS) Berbasis Programmable Logic Control (PLC) Siemens Simatic S7-300', 'Muh Amri Arfah ', NULL, 'D41116006', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 ARF           p', NULL, NULL, NULL, NULL),
(53, 1, 2021, 'Inverter DC-AC 220-230 VAC Pada Sistem Listrik Hibrid Energi Terbarukan Skala Rumah', 'Muhammad Aswan ', NULL, 'D41116312', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 ASW          i', NULL, NULL, NULL, NULL),
(54, 1, 2021, 'Analisis Losses sistem distribusi 20 KV PT. PLN ULP Panakkukang Penyulang Antang Menggunakan Etap16.0', 'Andi Abdul Azis Mappabeta ', NULL, 'D41114528', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 MAP          a', NULL, NULL, NULL, NULL),
(55, 1, 2021, 'Algoritma Hybrid PSO-BA (HPSOBA) Untuk Penyelesaian Optimal Reactive Power Flow (ORPF) Pada Aplikasi VSC-HVDC', 'Zulfiana Safitri Majid', NULL, NULL, 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 MAJ          a', NULL, NULL, NULL, NULL),
(56, 1, 2021, 'Studi Kontingensi Sistem Interkoneksi Sulbagse', 'A. Anugrah Paranrengi ', NULL, 'D41116310', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 PAR          p', NULL, NULL, NULL, NULL),
(57, 1, 2021, 'Analisis Formulasi Akurasi Posisi Distorsi Pada Efek Frequency Sharing Teknologi 5G', 'Reski Amalia ', NULL, 'D41171010', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 AMA          a', NULL, NULL, NULL, NULL),
(58, 1, 2021, 'Perancangan Jaringan FTTH Menggunakan Aplikasi Optisystem, Tabel BOQ Dan Kurva S', 'Sri Rafika Muhtar ', NULL, 'D41171020', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 MUH          p', NULL, NULL, NULL, NULL),
(59, 1, 2021, 'Kontrol Pengisian Baterai Otomatis Pada Sistem Keamana Rumah Berbasis IOT', 'Syahril Febriansyah ', NULL, 'D41116025', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 FEB            k', NULL, NULL, NULL, NULL),
(60, 1, 2021, 'Pemodelan Simulink Heat Exchanger Pada Alat Boiler Heating Batching Control Trainer(Model:SE 107)', 'Fajri Tawakkal Ali ', NULL, 'D41114030', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 ALI            p', NULL, NULL, NULL, NULL),
(61, 1, 2021, 'Optimisasi Daya Aktif PLTU 2 Sulawesi Utara (Amurang) Mempertimbangkan Emisi', 'Nurul Fadillah ', NULL, 'D41171005', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 FAD          o', NULL, NULL, NULL, NULL),
(62, 1, 2021, 'Sistem Monitoring Volume Underground Tank SPBU Berbasis Mikrokontroler Raspberry PI', 'Siswono      ', NULL, 'D41114021', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 SIS             s', NULL, NULL, NULL, NULL),
(63, 1, 2021, 'Pengembangan Teknologi Smart Hybrid Reader Untuk Sistem Smart Campus Unhas', 'Cahya Rezky Prihatmoko ', NULL, 'D41116013', 'TEKNIK ELEKTRO', 1, 1, 1, 'SKR-2021 PRI            p', NULL, NULL, NULL, NULL),
(64, 1, 2021, 'Prototipe Sistem Pendingin (Freezer) Ikan Berbasis Energi Surya (Photovoltic) Pada Kapal Nelayan', 'Juarni ', NULL, 'D33114008', 'TEKNIK SISTEM PERKAPALAN', 1, 1, 1, 'SKR-2021 JUA           P           ', NULL, NULL, NULL, NULL),
(65, 1, 2021, 'Desain Sistem Pendingin Penyimpanan Ikan Berbasis Energi Surya', 'Nurmainnah ', NULL, 'D33114003', 'TEKNIK SISTEM PERKAPALAN', 1, 1, 1, 'SKR-2021 NUR             d', NULL, NULL, NULL, NULL),
(66, 1, 0, 'Rekayasa  Perangkat Lunak (Buku I', 'Roger S. Pressman', 'Yogyakarta: Andi, 2002', NULL, NULL, 2002, 4, 1, '005.1/PRE', NULL, NULL, NULL, NULL),
(67, 1, 0, 'Rangkaian listrik Jilid Pertama', 'Budiono Mismail', 'Bandung: ITB,  1995', NULL, NULL, 1995, 4, 1, '537.6 / MIS', NULL, NULL, NULL, NULL),
(68, 1, 0, 'Roh dan citra kota: Peran perancangan kota sebagai kebijakan public', 'Bambang Heryanto', 'Sidoarjo :Brillian International, 2011', NULL, NULL, 2011, 4, 1, '711.4/HER', NULL, NULL, NULL, NULL),
(69, 1, 0, 'Rahasia mudah menguasai photoshop', 'MADCOMS', 'Yogyakarta: Andi, 2012', NULL, NULL, 2012, 1, 1, '006.69/MAD', NULL, NULL, NULL, NULL),
(70, 1, 0, 'Riset Operasi dalam pendekatan algoritmis', 'Jong Jek Siang', 'Yogyakarta: Andi, 2011', NULL, NULL, 2011, 2, 1, '003 / SIA', NULL, NULL, NULL, NULL),
(71, 1, 0, 'Rangkaian Lisitrik', 'Mohamad Ramdhani', 'Bandung : Erlangga, 2008', NULL, NULL, 2008, 2, 1, '537.6 / RAM', NULL, NULL, NULL, NULL),
(72, 1, 0, 'Robot Vision : Teknik membangun robot cerdas masa depan', 'Widodo Budiharto, Djoko Purwanto', 'Yogyakarta: Andi, 2012', NULL, NULL, 2012, 1, 1, '629.892 / BUD', NULL, NULL, NULL, NULL),
(73, 1, 0, 'Rekayasa Perangkat Lunak : Terstruktur dan berorientasi objek', 'Rosa A.S dan M. Shalahuddin', 'bandung : informatika, 2018', NULL, NULL, 2018, 3, 1, '005.1 / ROS', NULL, NULL, NULL, NULL),
(74, 1, 0, 'Reformasi perkotaan : mencegah wilayah Urban menjadi human Zoo', 'Eko Budihardjo', 'Jakarta: Kompas Media Nusantara,2014', NULL, NULL, 2014, 1, 1, '338.9 /BUD', NULL, NULL, NULL, NULL),
(75, 1, 0, 'Rekayasa Hidrologi, edisi 1 revisi', 'Lily Montarcih Limantara', 'Yogyakarta : Andi, 2018', NULL, NULL, 2018, 3, 1, '551.48 / LIM', NULL, NULL, NULL, NULL),
(76, 1, 0, 'Rekayasa Sistem manufaktur : memahami proses manufaktur untuk mendukung implementasi proyek six sigma lebih efektif', 'Saluddin', 'Jakarta : Mitra Wacana Media, 2016', NULL, NULL, 2016, 2, 1, '658.5/SAL', NULL, NULL, NULL, NULL),
(77, 1, 0, 'Rangkaian listrik ', 'H. Sianipar', 'Bandung: Rekayasa Sains. 2015', NULL, NULL, 2015, 1, 1, '537 / SIA', NULL, NULL, NULL, NULL),
(78, 1, 0, 'Reading strategis: materials for english MKU for International Use Only', '', 'Makassar9/17/2019  English Departemen, 2008', NULL, NULL, 2008, 1, 1, '372.4 / REA', NULL, NULL, NULL, NULL),
(79, 1, 0, 'Releproteksi : prinsip dan aplikasi', 'Hendra Martha Yudha', 'Fak. Teknik Univ. Sriwijaya', NULL, NULL, 2020, 1, 1, '693.898 /YUD', NULL, NULL, NULL, NULL),
(80, 1, 0, 'Restorasi Sungai : River Restoration', 'Agus Maryono', 'Yogyakarta: UGM, 2018', NULL, NULL, 2018, 3, 1, '628.112 / MAR', NULL, NULL, NULL, NULL),
(81, 1, 0, 'Riset Operasi edisi ke 2', 'Sri Mulyono', 'Jakarta:Mitra Wacana Media, 2017', NULL, NULL, 2017, 1, 1, '001.424 / MUL', NULL, NULL, NULL, NULL),
(82, 1, 0, 'Rekayasa Lalu-Lintas edisi ke-2', 'Leksmono Suryo Putranto', 'Jakarta: Indek, 2019', NULL, NULL, 2019, 1, 1, '627.701 / PUT', NULL, NULL, NULL, NULL),
(83, 1, 0, 'Rekayasa Gambut. Briket batubara dan sampah organik: Usaha memanfaatkan sumberdaya alam yang terpinggirkan', 'Sukandarrumidi', 'Yogyakarta: Gadjah Mada Univ. Press, 2009', NULL, NULL, 2009, 2, 1, '662.623 / SUK', NULL, NULL, NULL, NULL),
(84, 1, 0, 'Reparasi sistem pendinginan mesin mobil  edisi revisi', 'Daryanto', 'Jakarta: Bumi Aksara, 2019', NULL, NULL, 2019, 2, 1, '629.277.2 / DAR', NULL, NULL, NULL, NULL),
(85, 1, 0, 'Rangka Atap Baja Ringan untuk semua', 'Iden Wildensyah', 'Bandung: Alfabeta, 2013', NULL, NULL, 2013, 1, 1, '695 / WIL', NULL, NULL, NULL, NULL),
(86, 1, 0, 'Riset Operasi : Teori dan aplikasi untuk pengambilan keputusan', 'Mohamad Wahdi', 'Yogyakarta: CAPS, 2011', NULL, NULL, 2011, 1, 1, '330 / WAH', NULL, NULL, NULL, NULL),
(87, 1, 0, 'Riset operasi : untuk pengambilan keputusan edisi Revisi', 'Johannes Supranto', 'Jakarta: Univ. Indoensia, 2014', NULL, NULL, 2014, 1, 1, '658.403.4/SUP', NULL, NULL, NULL, NULL),
(88, 1, 0, 'Rekayasa Perangkat Lunak', 'Janner Simarmata', 'Yogyakarta: Andi, 2010', NULL, NULL, 2010, 1, 1, '005.1 / SIM', NULL, NULL, NULL, NULL),
(89, 1, 0, 'Robotika Modern : Teori + implermentasi  (edisi revisi', 'Widodo Budiharto, Djoko Purwanto', 'Yogyakarta: Andi, 2010', NULL, NULL, 2010, 2, 1, '629.892 /BUD', NULL, NULL, NULL, NULL),
(90, 1, 0, 'Rangkaian listrik edisi kedua', 'Joseph A. Edminister', 'Jakarta: Erlangga, 1984', NULL, NULL, 1984, 1, 1, '537 / EDM', NULL, NULL, NULL, NULL),
(91, 1, 0, 'Rekayasa Pondasi Teori dan penyelesaian soal', 'Bambang Surendro', 'Yogyakarta : Graha Ilmu. 2015', NULL, NULL, 2015, 1, 1, '624.107.6 / SUR', NULL, NULL, NULL, NULL),
(92, 1, 0, 'Rangkaian listrik', 'Cekman Cekdin, Taufik Barlian', 'Yogyakarta : Andi, 2013', NULL, NULL, 2013, 1, 1, '621.381.5 / CEK', NULL, NULL, NULL, NULL),
(93, 1, 0, 'Reliability Centred Maintenance', 'Hadi Pranoto', 'Yogyakarta:  Mitra Wacana Media, 2015', NULL, NULL, 2015, 1, 1, '620.004 / PRA', NULL, NULL, NULL, NULL),
(94, 1, 0, 'Robotika modern : Teori & implementasi (edisi revisi', 'Widodo Budiharto', 'Yogyakarta: Andi, 2014', NULL, NULL, 2014, 1, 1, '629.892 / BUD', NULL, NULL, NULL, NULL),
(95, 1, 0, 'Refregeration & air conditioning', 'Wilbert F. Stoecker, Jerold W. Jones', 'Mc.Graw-Hill Book Company, 1982', NULL, NULL, 1982, 1, 1, '621.5\'6', NULL, NULL, NULL, NULL),
(96, 1, 0, 'Ruang dalam arsitektur edisi ketiga, revisi', 'Cornelis Van De Ven', 'Jakarta : Gramedia Pustaka Utama, 1991', NULL, NULL, 1991, 1, 1, '720 / VEN', NULL, NULL, NULL, NULL),
(97, 1, 0, 'Reformasi pengelolaan sumber daya air ', 'Agus Maryono', 'Yogyakarta: Gadjah Mada Univ. Press, 2017', NULL, NULL, 2017, 1, 1, NULL, NULL, NULL, NULL, NULL),
(98, 1, 0, 'Robotika modern  : Teori dan implementari (edisi baru', 'Widodo Buidhardi', 'Yogyakarta : Andi, 2914', NULL, NULL, 2014, 1, 1, '629.892/ WID', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_01_01_000001_create_password_resets_table', 1),
(2, '2020_01_01_000002_create_failed_jobs_table', 1),
(3, '2020_01_01_000003_create_accounts_table', 1),
(4, '2020_01_01_000004_create_users_table', 1),
(5, '2021_03_07_022736_create_docs_table', 1),
(6, '2021_08_28_163110_create_types_table', 1),
(7, '2021_08_29_151054_create_reports_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `docs_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doc_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `account_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(0, 1, 'BUKU TEKNIK', '2022-01-20 12:26:00', NULL, NULL),
(1, 1, 'TUGAS AKHIR', '2022-01-20 12:26:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `first_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NIM` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `photo_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `account_id`, `first_name`, `last_name`, `NIM`, `department`, `email`, `password`, `owner`, `status`, `photo_path`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'John', 'Doe', NULL, NULL, 'johndoe@example.com', '$2y$10$G0r4Qdbljdce7tP3p//f.ucZ6eFyPl5hmjRImdSYqsxBOA.gZ6kyS', 1, 0, NULL, 'RwqzKwCWM1', '2022-01-08 14:43:32', '2022-01-08 14:43:32', NULL),
(2, 1, 'Rusty', 'DuBuque', NULL, NULL, 'herman68@example.org', '$2y$10$m55eG0hhQEDHOgl4Scmv/euHY0ieQGmXYPKzSiylmb5CXc0An9Bu6', 0, 0, NULL, 'TwviviPoFs', '2022-01-08 14:43:33', '2022-01-08 14:43:33', NULL),
(3, 1, 'Edwin', 'Hodkiewicz', NULL, NULL, 'thalia.konopelski@example.com', '$2y$10$B51mSAayxKKverDIAXOKyeICc5RPtKmbUuvWfoT6LMxzsbEYDfR/O', 0, 0, NULL, 'mwy9sVV4Ib', '2022-01-08 14:43:33', '2022-01-08 14:43:33', NULL),
(4, 1, 'America', 'Upton', NULL, NULL, 'destinee.fay@example.com', '$2y$10$1SgGxYcGaTJvdmRO3QAv/OGf4d/pMCvX25H9o4Fm32.jA8FDMZZcW', 0, 0, NULL, '7lxRcXpe8v', '2022-01-08 14:43:34', '2022-01-08 14:43:34', NULL),
(5, 1, 'Rick', 'Graham', NULL, NULL, 'camila97@example.com', '$2y$10$m7q.Sc8reqdgER8Jc0Uic.jTymyA9xQJaxxIIAFc.Y4ojyoCCYNyG', 0, 0, NULL, 'HhSTuDJoUF', '2022-01-08 14:43:35', '2022-01-08 14:43:35', NULL),
(6, 1, 'German', 'Fadel', NULL, NULL, 'kari87@example.net', '$2y$10$l22.dS8ADkxoN/AT032AX.Ks413bsSU12.CodA1/8cw1WYY4KarJu', 0, 0, NULL, 'QRRh0GJKp4', '2022-01-08 14:43:35', '2022-01-08 14:43:35', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `docs`
--
ALTER TABLE `docs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docs_account_id_index` (`account_id`),
  ADD KEY `docs_types_id_index` (`types_id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_account_id_index` (`account_id`),
  ADD KEY `reports_docs_id_index` (`docs_id`),
  ADD KEY `reports_users_id_index` (`users_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_account_id_index` (`account_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_account_id_index` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `docs`
--
ALTER TABLE `docs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
