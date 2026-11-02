import 'package:flutter/material.dart';
import 'package:belajarflutter/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_typing_uninitialized_variables
  dynamic namauser;

  void _loadUsername() async {
    // Inisialisasi share preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Ambil Username yang sudah tersimpan
    final user = prefs.getString('username');
    if (mounted && namauser != user) {
      namauser = user;
      // Set username on UI
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadUsername();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ), // AppBar
      body: Center(
        child: Text('Ini adalah halaman User $namauser'),
      ), // Center
      drawer: const Sidemenu(),
    ); // Scaffold
  }
}
