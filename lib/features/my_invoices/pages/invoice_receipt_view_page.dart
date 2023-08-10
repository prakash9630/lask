import 'dart:typed_data';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

@RoutePage()
class InvoiceReceiptViewPage extends StatelessWidget {
  const InvoiceReceiptViewPage({Key? key,required this.data}) : super(key: key);

   final Uint8List data;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.memory(data)
    );
  }

}
