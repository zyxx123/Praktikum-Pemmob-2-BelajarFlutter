// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:belajarflutter/hello_world.dart';
import 'package:belajarflutter/column_widget.dart';
import 'package:belajarflutter/row_widget.dart';
import 'package:belajarflutter/ui/produk_form.dart';
import 'package:belajarflutter/ui/produk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter Pertama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      // Sesuai Modul 2, Anda dapat mengubah 'home' untuk menampilkan latihan yang diinginkan:
      // - const HelloWorld()   (Hal. 18: Hello World)
      // - const ColumnWidget() (Hal. 19: Column Widget)
      // - const RowWidget()    (Hal. 21: Row Widget)
      // - const ProdukForm()   (Hal. 22-24: Form Produk & Detail)
      // - const ProdukPage()   (Hal. 25-26: ListView Data Produk - Hasil Akhir Modul)
      home: const ProdukPage(),
    );
  }
}
