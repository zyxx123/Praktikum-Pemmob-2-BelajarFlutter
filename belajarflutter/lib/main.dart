// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:belajarflutter/login_page.dart';
import 'package:belajarflutter/home_page.dart';
import 'package:belajarflutter/about_page.dart';
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
      title: 'Flutter Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      // Modul 3 (Routes, Side Menu, Login & Local Storage):
      // - const LoginPage()
      // Modul 2:
      // - const ProdukPage()
      // - const ProdukForm()
      // - const ColumnWidget()
      // - const RowWidget()
      // - const HelloWorld()
      home: const LoginPage(),
    );
  }
}
