import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/prime.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../features/my_invoices/service/invoice_pdf_service.dart';

class PdfPreviewPageArgs {
  final Uint8List? pdfData;
  final bool isFile;
  final bool isNetwork;
  final bool isFilePath;
  final String? networkUrl;
  final String? filePath;
  final bool showDownload;

  PdfPreviewPageArgs({
    this.pdfData,
    this.isFile = false,
    this.isFilePath = false,
    this.isNetwork = false,
    this.filePath,
    this.networkUrl,
    this.showDownload = false,
  })  : assert(!isFile || pdfData != null),
        assert(!isNetwork || networkUrl != null),
        assert(!isFilePath || filePath != null);
}

@RoutePage()
class PdfPreviewPage extends StatefulWidget {
  const PdfPreviewPage({
    Key? key,
    required this.args,
  }) : super(key: key);
  final PdfPreviewPageArgs args;

  @override
  State<PdfPreviewPage> createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getWidget(widget.args),
      floatingActionButton:
      widget.args.showDownload && widget.args.isFile
          ? FloatingActionButton(
        onPressed: () {
          InvoicePdfServices.download(
            widget.args.pdfData!,
          );
        },
        child: const Iconify(
          Prime.download,
          color: Colors.white,
        ),
      )
          : null,
    );
  }

  Widget getWidget(PdfPreviewPageArgs args) {
    if (args.isFile) {
      return SfPdfViewer.memory(
        onDocumentLoaded: onLoaded,
        args.pdfData!,
      );
    } else if (args.isNetwork) {
      return SfPdfViewer.network(
        onDocumentLoaded: onLoaded,
        args.networkUrl!,
      );
    } else if (args.isFilePath) {
      return SfPdfViewer.file(
        onDocumentLoaded: onLoaded,
        File(args.filePath!),
      );
    }
    return const Center(
      child: Text("PDF is invalid"),
    );
  }

  onLoaded(PdfDocumentLoadedDetails details) {
    // loading=false;
    // setState(() {
    //   loading = false;
    // });
  }
}
