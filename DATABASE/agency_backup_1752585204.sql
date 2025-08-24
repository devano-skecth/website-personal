

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO admin VALUES("1","admin","$2y$10$AIy0X1Ep6alaHDTofiChGeqq7k/d1Kc8vKQf1JZo0mKrzkkj6M626");



CREATE TABLE `bom_produk` (
  `kode_bom` varchar(100) NOT NULL,
  `kode_bk` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `kebutuhan` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO bom_produk VALUES("B0001","M0001","P0001","nugget","");



CREATE TABLE `customer` (
  `kode_customer` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO customer VALUES("C0002","Rafi Akbar","a.rafy@gmail.com","rafi","$2y$10$/UjGYbisTPJhr8MgmT37qOXo1o/HJn3dhafPoSYbOlSN1E7olHIb.","0856748564");
INSERT INTO customer VALUES("C0003","Nagita Silvana","bambang@gmail.com","Nagita","$2y$10$47./qEeA/y3rNx3UkoKmkuxoAtmz4ebHSR0t0Bc.cFEEg7cK34M3C","087804616097");
INSERT INTO customer VALUES("C0004","Nadiya","nadiya@gmail.com","nadiya","$2y$10$6wHH.7rF1q3JtzKgAhNFy.4URchgJC8R.POT1osTAWmasDXTTO7ZG","0898765432");
INSERT INTO customer VALUES("C0005","adil","adilsantoso10002@gmail.com","admin123","$2y$10$8N6Mz7gPjs/qEWpvVnXnP.yBtxUYnKZgOnesgbFCehryBW1R.BKAG","089676615551");
INSERT INTO customer VALUES("C0006","cinta","cinta1002@gmail.com","Pantek123","$2y$10$gxKBVVefPJtRJ5pPE9ZGQOExnTG8NUTkqwmdsZyE/XqkCLZF/Ei7.","08976616");
INSERT INTO customer VALUES("C0007","cinta1002","cinta1003@gmail.com","cinta1002","$2y$10$sQeoZa/GXv85.3Fap/DSG.h2XHNwiaZJyP00Fl2lnDypijOEZ5bfq","08990179820");



CREATE TABLE `inventory` (
  `kode_bk` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `qty` varchar(200) NOT NULL,
  `satuan` varchar(200) NOT NULL,
  `harga` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO inventory VALUES("M0001","nugget","25","pcs","25000","2025-07-15");



CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `kode_customer` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO keranjang VALUES("16","C0003","P0002","Maryam","5","15000");
INSERT INTO keranjang VALUES("17","C0003","P0003","Kue tart coklat","2","100000");
INSERT INTO keranjang VALUES("0","C0005","P0007","Bakso ayam","5","8000");
INSERT INTO keranjang VALUES("0","C0005","P0001","Roti Sobek","5","10000");



CREATE TABLE `pesanan` (
  `id_order` int(11) NOT NULL,
  `invoice` varchar(200) NOT NULL,
  `kode_customer` varchar(200) NOT NULL,
  `kode_produk` varchar(200) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `nama_bank` varchar(30) NOT NULL,
  `status` varchar(200) NOT NULL,
  `tanggal` date NOT NULL,
  `provinsi` varchar(200) NOT NULL,
  `kota` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `kode_pos` varchar(200) NOT NULL,
  `terima` varchar(200) NOT NULL,
  `tolak` varchar(200) NOT NULL,
  `cek` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO pesanan VALUES("0","INV0001","C0005","P0006","bakso ikan","1","8000","Mandiri","0","2025-01-31","Indonesia","Jambi tanjung jabung barat tebing tinggi","KPR BLOK B IV NO. 16","36556","1","0","1");
INSERT INTO pesanan VALUES("0","INV0002","C0005","P0007","Bakso ayam","1","8000","Mandiri","0","2025-01-31","Indonesia","Jambi tanjung jabung barat tebing tinggi","KPR BLOK B IV NO. 16","36556","1","0","1");
INSERT INTO pesanan VALUES("0","INV0003","C0005","P0007","Bakso ayam","3","8000","Mandiri","0","2025-01-31","Indonesia","Jambi tanjung jabung barat tebing tinggi","KPR BLOK B IV NO. 16","36556","1","0","1");
INSERT INTO pesanan VALUES("0","INV0004","C0005","P0007","Bakso ayam","3","8000","Mandiri","0","2025-01-31","Indonesia","Jambi tanjung jabung barat tebing tinggi","KPR BLOK B IV NO. 16","36556","1","0","1");
INSERT INTO pesanan VALUES("0","INV0005","C0005","P0007","Bakso ayam","5","8000","Nagari","0","2025-01-31","Indonesia","Jambi tanjung jabung barat tebing tinggi","KPR BLOK B IV NO. 16","36556","1","0","1");
INSERT INTO pesanan VALUES("0","INV0006","C0005","P0007","Bakso ayam","10","8000","Mandiri","0","2025-01-31","Indonesia","Jambi tanjung jabung barat tebing tinggi","KPR BLOK B IV NO. 16","36556","1","0","1");
INSERT INTO pesanan VALUES("0","INV0007","C0005","P0007","Bakso ayam","10","8000","Nagari","0","2025-01-31","Indonesia","Jambi tanjung jabung barat tebing tinggi","KPR BLOK B IV NO. 16","36556","1","0","1");
INSERT INTO pesanan VALUES("0","INV0008","C0005","P0007","Bakso ayam","3","8000","Mandiri","0","2025-01-31","Indonesia","Jambi tanjung jabung barat tebing tinggi","KPR BLOK B IV NO. 16","36556","1","0","1");
INSERT INTO pesanan VALUES("0","INV0009","C0007","P0005","bakso ikan","1","8000","Mandiri","0","2025-07-15","sumbarrrrr","bukikkkkk","anakaierrr","123456","1","0","1");
INSERT INTO pesanan VALUES("0","INV0010","C0007","P0008","nugget","5","20000","Mandiri","0","2025-07-15","sumbarrrrrrrrrrr","bukittttttttttt","anakairrrr","123444","1","0","0");



CREATE TABLE `produk` (
  `kode_produk` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  `kebutuhan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO produk VALUES("P0001","nugget","68765284519f8.jpeg","enak
			","25000","");

