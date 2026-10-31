import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:belajarflutter/hello_world.dart';
import 'package:belajarflutter/column_widget.dart';
import 'package:belajarflutter/row_widget.dart';
import 'package:belajarflutter/ui/produk_form.dart';
import 'package:belajarflutter/ui/produk_page.dart';

void main() {
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
}
