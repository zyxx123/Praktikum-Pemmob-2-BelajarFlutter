import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:belajarflutter/hello_world.dart';
import 'package:belajarflutter/column_widget.dart';
import 'package:belajarflutter/row_widget.dart';
import 'package:belajarflutter/ui/produk_form.dart';
import 'package:belajarflutter/ui/produk_page.dart';
import 'package:belajarflutter/login_page.dart';
import 'package:belajarflutter/home_page.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
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

  testWidgets('Test ProdukForm and navigate to ProdukDetail', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProdukForm()));
    expect(find.text('Form Produk'), findsOneWidget);

    // Fill the fields
    await tester.enterText(find.widgetWithText(TextField, 'Kode Produk'), 'A001');
    await tester.enterText(find.widgetWithText(TextField, 'Nama Produk'), 'Laptop Asus');
    await tester.enterText(find.widgetWithText(TextField, 'Harga'), '7500000');

    // Tap button Simpan
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    // Verify ProdukDetail is displayed
    expect(find.text('Detail Produk'), findsOneWidget);
    expect(find.text('Kode Produk : A001'), findsOneWidget);
    expect(find.text('Nama Produk : Laptop Asus'), findsOneWidget);
    expect(find.text('Harga Produk : 7500000'), findsOneWidget);
  });

  testWidgets('Test ProdukPage', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProdukPage()));
    expect(find.text('List Data Produk'), findsOneWidget);
    expect(find.text('Kulkas'), findsOneWidget);
    expect(find.text('Playstation'), findsOneWidget);
    expect(find.text('Radio'), findsOneWidget);
    expect(find.text('30000'), findsNWidgets(3));
  });

  testWidgets('Test LoginPage login success', (WidgetTester tester) async {
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

  testWidgets('Test LoginPage login failure', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    await tester.enterText(find.widgetWithText(TextField, 'Masukkan Username'), 'wrong');
    await tester.enterText(find.widgetWithText(TextField, 'Masukkan Password'), 'wrong');

    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    expect(find.text('Username dan Password Salah'), findsOneWidget);
  });

  testWidgets('Test HomePage with Sidemenu and AboutPage', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'username': 'admin'});
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    await tester.pumpAndSettle();

    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Ini adalah halaman User admin'), findsOneWidget);

    // Open drawer
    final ScaffoldState state = tester.firstState(find.byType(Scaffold));
    state.openDrawer();
    await tester.pumpAndSettle();

    expect(find.text('Sidemenu'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);

    // Tap About in drawer
    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();

    expect(find.text('About Page'), findsOneWidget);
    expect(find.text('Ini adalah halaman About'), findsOneWidget);
  });
}
