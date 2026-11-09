import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:belajarflutter/hello_world.dart';
import 'package:belajarflutter/column_widget.dart';
import 'package:belajarflutter/row_widget.dart';
import 'package:belajarflutter/model/produk.dart';
import 'package:belajarflutter/model/login.dart';
import 'package:belajarflutter/model/registrasi.dart';
import 'package:belajarflutter/ui/produk_form.dart';
import 'package:belajarflutter/ui/produk_page.dart';
import 'package:belajarflutter/ui/login_page.dart' as ui_login;
import 'package:belajarflutter/ui/registrasi_page.dart';
import 'package:belajarflutter/login_page.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('Test Models fromJson', () {
    final login = Login.fromJson({
      'code': 200,
      'status': true,
      'data': {
        'token': 'secret_token',
        'user': {'id': 1, 'email': 'admin@gmail.com'}
      }
    });
    expect(login.code, 200);
    expect(login.status, true);
    expect(login.token, 'secret_token');
    expect(login.userID, 1);
    expect(login.userEmail, 'admin@gmail.com');

    final reg = Registrasi.fromJson({
      'code': 200,
      'status': true,
      'data': 'Registrasi Berhasil',
    });
    expect(reg.code, 200);
    expect(reg.status, true);
    expect(reg.data, 'Registrasi Berhasil');

    final prod = Produk.fromJson({
      'id': 10,
      'kode_produk': 'B001',
      'nama_produk': 'Laptop',
      'harga': 12000000,
    });
    expect(prod.id, 10);
    expect(prod.kodeProduk, 'B001');
    expect(prod.namaProduk, 'Laptop');
    expect(prod.hargaProduk, 12000000);
  });

  testWidgets('Test RegistrasiPage and validation', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RegistrasiPage()));
    expect(find.text('Registrasi'), findsWidgets);

    // Test validation empty
    await tester.tap(find.widgetWithText(ElevatedButton, 'Registrasi'));
    await tester.pumpAndSettle();
    expect(find.text('Nama harus diisi minimal 3 karakter'), findsOneWidget);
    expect(find.text('Email harus diisi'), findsOneWidget);
    expect(find.text('Password harus diisi minimal 6 karakter'), findsOneWidget);

    // Fill valid
    await tester.enterText(find.widgetWithText(TextFormField, 'Nama'), 'Budi');
    await tester.enterText(find.widgetWithText(TextFormField, 'Email'), 'budi@gmail.com');
    await tester.enterText(find.widgetWithText(TextFormField, 'Password'), '123456');
    await tester.enterText(find.widgetWithText(TextFormField, 'Konfirmasi Password'), '123456');

    await tester.tap(find.widgetWithText(ElevatedButton, 'Registrasi'));
    await tester.pumpAndSettle();
    expect(find.text('Nama harus diisi minimal 3 karakter'), findsNothing);
  });

  testWidgets('Test Modul 4 LoginPage and navigate to RegistrasiPage', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ui_login.LoginPage()));
    expect(find.text('Login'), findsWidgets);
    expect(find.text('Registrasi'), findsOneWidget);

    // Tap link Registrasi
    await tester.tap(find.text('Registrasi'));
    await tester.pumpAndSettle();
    expect(find.byType(RegistrasiPage), findsOneWidget);
  });

  testWidgets('Test ProdukPage, ProdukDetail, Edit, and Delete', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProdukPage()));
    expect(find.text('List Produk'), findsOneWidget);
    expect(find.text('Kamera'), findsOneWidget);
    expect(find.text('Kulkas'), findsOneWidget);
    expect(find.text('Mesin Cuci'), findsOneWidget);

    // Tap on Kamera to open ProdukDetail
    await tester.tap(find.text('Kamera'));
    await tester.pumpAndSettle();
    expect(find.text('Detail Produk'), findsOneWidget);
    expect(find.text('Kode : A001'), findsOneWidget);
    expect(find.text('Nama : Kamera'), findsOneWidget);
    expect(find.text('Harga : Rp. 5000000'), findsOneWidget);

    // Tap EDIT button to open ProdukForm in Update mode
    await tester.tap(find.text('EDIT'));
    await tester.pumpAndSettle();
    expect(find.text('UBAH PRODUK'), findsOneWidget);
    expect(find.text('UBAH'), findsOneWidget);

    // Go back to Detail
    await tester.pageBack();
    await tester.pumpAndSettle();

    // Tap DELETE button and verify AlertDialog
    await tester.tap(find.text('DELETE'));
    await tester.pumpAndSettle();
    expect(find.text('Yakin ingin menghapus data ini?'), findsOneWidget);
    expect(find.text('Ya'), findsOneWidget);
    expect(find.text('Batal'), findsOneWidget);

    // Tap Batal
    await tester.tap(find.text('Batal'));
    await tester.pumpAndSettle();
    expect(find.text('Yakin ingin menghapus data ini?'), findsNothing);
  });

  testWidgets('Test ProdukForm Tambah Produk mode', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProdukForm()));
    expect(find.text('TAMBAH PRODUK'), findsOneWidget);
    expect(find.text('SIMPAN'), findsOneWidget);

    // Test validation
    await tester.tap(find.text('SIMPAN'));
    await tester.pumpAndSettle();
    expect(find.text('Kode Produk harus diisi'), findsOneWidget);
    expect(find.text('Nama Produk harus diisi'), findsOneWidget);
    expect(find.text('Harga harus diisi'), findsOneWidget);
  });

  testWidgets('Test HelloWorld widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HelloWorld()));
    expect(find.text('Belajar Flutter'), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);
  });

  testWidgets('Test ColumnWidget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ColumnWidget()));
    expect(find.text('Widget Column'), findsOneWidget);
    expect(find.text('Kolom 1'), findsOneWidget);
    expect(find.text('Kolom 2'), findsOneWidget);
    expect(find.text('Kolom 3'), findsOneWidget);
    expect(find.text('Kolom 4'), findsOneWidget);
  });

  testWidgets('Test RowWidget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RowWidget()));
    expect(find.text('Widget Row'), findsOneWidget);
    expect(find.text('Row 1'), findsOneWidget);
    expect(find.text('Row 2'), findsOneWidget);
    expect(find.text('Row 3'), findsOneWidget);
    expect(find.text('Row 4'), findsOneWidget);
  });

  testWidgets('Test Modul 3 LoginPage and HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));
    expect(find.text('Login'), findsWidgets);

    await tester.enterText(find.widgetWithText(TextField, 'Masukkan Username'), 'admin');
    await tester.enterText(find.widgetWithText(TextField, 'Masukkan Password'), 'admin');

    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    expect(find.text('Anda Berhasil Login'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.text('Home Page'), findsOneWidget);
  });
}
