
-- Database: sistem_kepegawaian
CREATE DATABASE IF NOT EXISTS sistem_kepegawaian;
USE sistem_kepegawaian;

-- Tabel jabatan
CREATE TABLE jabatan (
    id_jabatan INT AUTO_INCREMENT PRIMARY KEY,
    nama_jabatan VARCHAR(50) NOT NULL
);

-- Tabel departemen
CREATE TABLE departemen (
    id_departemen INT AUTO_INCREMENT PRIMARY KEY,
    nama_departemen VARCHAR(50) NOT NULL
);

-- Tabel karyawan
CREATE TABLE karyawan (
    id_karyawan INT AUTO_INCREMENT PRIMARY KEY,
    nik VARCHAR(20) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan') NOT NULL,
    tanggal_masuk DATE NOT NULL,
    status ENUM('Tetap', 'Kontrak') NOT NULL,
    id_jabatan INT,
    id_departemen INT,
    foto VARCHAR(255),
    FOREIGN KEY (id_jabatan) REFERENCES jabatan(id_jabatan),
    FOREIGN KEY (id_departemen) REFERENCES departemen(id_departemen)
);

-- Tabel data_absensi
CREATE TABLE data_absensi (
    id_absensi INT AUTO_INCREMENT PRIMARY KEY,
    id_karyawan INT,
    tanggal DATE NOT NULL,
    jam_masuk TIME,
    jam_keluar TIME,
    status ENUM('Hadir', 'Sakit', 'Izin', 'Alpha') NOT NULL,
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

-- Tabel cuti
CREATE TABLE cuti (
    id_cuti INT AUTO_INCREMENT PRIMARY KEY,
    id_karyawan INT,
    tanggal_mulai DATE NOT NULL,
    tanggal_selesai DATE NOT NULL,
    jenis_cuti VARCHAR(50) NOT NULL,
    alasan TEXT,
    status ENUM('Menunggu', 'Disetujui', 'Ditolak') DEFAULT 'Menunggu',
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

-- Tabel penilaian_kinerja
CREATE TABLE penilaian_kinerja (
    id_penilaian INT AUTO_INCREMENT PRIMARY KEY,
    id_karyawan INT,
    periode VARCHAR(7) NOT NULL,
    skor_kedisiplinan INT,
    skor_kerjasama INT,
    skor_kinerja INT,
    catatan TEXT,
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

-- Tabel penggajian
CREATE TABLE penggajian (
    id_gaji INT AUTO_INCREMENT PRIMARY KEY,
    id_karyawan INT,
    bulan VARCHAR(6) NOT NULL,
    gaji_pokok INT,
    tunjangan INT,
    potongan INT,
    total_gaji INT,
    tanggal_proses DATE,
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

-- Tabel users
CREATE TABLE users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    level ENUM('Admin', 'Manager') NOT NULL
);
