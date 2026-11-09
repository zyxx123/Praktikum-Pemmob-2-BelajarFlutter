// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:belajarflutter/ui/produk_page.dart';
import 'package:belajarflutter/ui/login_page.dart';
import 'package:belajarflutter/ui/registrasi_page.dart';
import 'package:belajarflutter/ui/produk_form.dart';
import 'package:belajarflutter/ui/produk_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      // Modul 4 (CRUD Module Flutter Bagian 1):
      // - ProdukPage()     (Hal. 42: List Produk, Form Tambah/Ubah, Detail, Delete)
      // - LoginPage()      (Hal. 36: Halaman Login & Link Registrasi)
      // - RegistrasiPage() (Hal. 33: Halaman Registrasi)
      home: ProdukPage(),
    );
  }
}
