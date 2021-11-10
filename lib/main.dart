import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    generatePDF() async {
      final pw.Document pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Column(
            // mainAxisAlignment: pw.MainAxisAlignment.center,
            // crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Center(child: pw.Text('Comprovante de registro')),
              pw.SizedBox(height: 10),
              pw.Text('20-11-09 14:37:06.000'),
              pw.SizedBox(height: 20),
              pw.Container(
                width: 300,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Método',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('Manual'),
                  ],
                ),
              ),
              pw.Container(
                width: 300,
                child: pw.Divider(),
              ),
              pw.Container(
                width: 300,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Data',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('09/11/2021'),
                  ],
                ),
              ),
              pw.Container(
                width: 300,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Hora',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('07:36'),
                  ],
                ),
              ),
              pw.Container(
                width: 300,
                child: pw.Divider(),
              ),
              pw.Container(
                width: 300,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Nome',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('Erick Ximenes'),
                  ],
                ),
              ),
              pw.Container(
                width: 300,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('CPF',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('000.000.000-00'),
                  ],
                ),
              ),
              pw.Container(
                width: 300,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Empresa',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('OXMED'),
                  ],
                ),
              ),
              pw.Container(
                width: 300,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('CNPJ',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('03.597.899/0001-60'),
                  ],
                ),
              ),
              pw.Container(
                width: 300,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Dispositivo',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('SM J810M'),
                  ],
                ),
              ),
              pw.Container(
                width: 300,
                child: pw.Divider(),
              ),
              pw.SizedBox(height: 10),
              pw.Center(
                child: pw.Text('Ponto registrado pelo App Ponto.',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ),
              pw.Text('Cunha & Tavares Contabilidade S/S',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('03.597.899/0001-60',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 15),
              pw.Text('ID do registro: ' + '5d64a654d4d4a'),
            ],
          ),
          //!
        ),
      );

      final temp = await getTemporaryDirectory();
      final path = '${temp.path}/exampel.pdf';
      File(path).writeAsBytesSync(await pdf.save());

      await Share.shareFiles([path], text: 'PDF Teste');
    }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("PDF"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: generatePDF,
            child: Text(
              "call",
              style: TextStyle(fontFamily: 'Helvetica'),
            ),
          ),
        ),
      ),
    ));
  }
}
