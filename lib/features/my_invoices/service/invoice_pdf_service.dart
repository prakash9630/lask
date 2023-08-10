// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' as fl;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_filex/open_filex.dart';
import 'package:flutter/services.dart';
import '../model/invoice_model.dart';
import 'package:path_provider/path_provider.dart';

import '../repo/invoice_repo.dart';

class InvoicePdfServices {


  // static Future<Uint8List> generateResume(
  //     AppLocalizations l10n, {
  //       required InvoicePdfModel model,
  //       r
  //     }) async {
  //   final doc = Document(title: 'My Invoice', author: model.authorName);
  //   final logo = MemoryImage(
  //     (await rootBundle.load(AssetPath.logoWithTitle)).buffer.asUint8List(),
  //   );
  //
  //   doc.addPage(
  //     MultiPage(
  //       pageTheme: PageTheme(
  //         theme: ThemeData(
  //           defaultTextStyle: TextStyle(
  //             fontSize: 14,
  //             color: PdfColor.fromHex("434343"),
  //           ),
  //         ),
  //       ),
  //       build: (Context context) => [
  //         Row(
  //           children: [
  //             Image(logo, height: 64),
  //             Spacer(),
  //             Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               children: [
  //                 Text(
  //                   l10n.lawyerInvoice,
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 16,
  //                   ),
  //                 ),
  //                 SizedBox(height: 12),
  //                 Text(
  //                   "${l10n.date}: ${DateFormat("y/MM/dd").format(model.date)}",
  //                   style: TextStyle(
  //                     fontSize: 13,
  //                     color: PdfColor.fromHex("808080"),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 30),
  //         Text(
  //           model.companyName,
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //             color: PdfColor.fromHex("3366DD"),
  //           ),
  //         ),
  //
  //         SizedBox(height: 12),
  //         _richText(
  //           label: '${l10n.email} :',
  //           value: ' ${model.email}',
  //         ),
  //         SizedBox(height: 12),
  //         _richText(
  //           label: '${l10n.phoneNumber} :',
  //           value: ' ${model.phoneNumber}',
  //         ),
  //         SizedBox(height: 30),
  //         _richText(
  //           label: 'Client Invoice / Receipt n. -',
  //           value: '#857357',
  //           labelColor: PdfColor.fromHex("434343"),
  //           valueColor: PdfColor.fromHex("FF4237")
  //
  //         ),
  //         SizedBox(height: 30),
  //         Text(
  //           "${l10n.to},",
  //         ),
  //         SizedBox(height: 12),
  //         Text(
  //           model.to,
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         SizedBox(height: 12),
  //         _richText(
  //           label: "Reference n- ",
  //           value: model.dataList.first.refrenceNo,
  //           labelFontWeight: FontWeight.bold,
  //           valueFontWeight: FontWeight.bold,
  //           labelColor: PdfColor.fromHex("434343"),
  //         ),
  //         SizedBox(height: 20),
  //         _buildTable(l10n, model),
  //         SizedBox(height: 35),
  //         Text(
  //           "Note- ",
  //           style: TextStyle(
  //             decoration: TextDecoration.underline,
  //             fontWeight: FontWeight.bold,
  //             color: PdfColor.fromHex("434343"),
  //           ),
  //         ),
  //         SizedBox(height: 10),
  //         _richText(
  //           label: "Your lawyer is ",
  //           value: model.dataList.first.lawyerName,
  //           valueFontWeight: FontWeight.bold,
  //           labelColor: PdfColor.fromHex("434343"),
  //         ),
  //         SizedBox(height: 10),
  //         _richText(
  //           label: "Lawyer License Number: ",
  //           value: model.lawyerLicenseNo,
  //           valueFontWeight: FontWeight.bold,
  //           labelColor: PdfColor.fromHex("434343"),
  //         ),
  //         SizedBox(height: 20),
  //         Text(
  //           l10n.payAttention,
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //             color: PdfColor.fromHex("ff4237"),
  //           ),
  //         ),
  //         SizedBox(height: 10),
  //         Text(
  //           model.description,
  //         ),
  //
  //         SizedBox(height: 20),
  //         Text(
  //           model.endingGreeting,
  //         ),
  //         SizedBox(height: 20),
  //         Text(
  //           "Lisbon",
  //         ),
  //         SizedBox(height: 10),
  //         Text(
  //           "24/04/2023",
  //           style: TextStyle(color: PdfColor.fromHex("808080"))
  //         ),
  //       ],
  //     ),
  //   );
  //   return doc.save();
  // }

  // static Table _buildTable(AppLocalizations l10n, InvoicePdfModel model) {
  //   return Table(
  //     columnWidths: {
  //       1: const IntrinsicColumnWidth(flex: 1),
  //     },
  //     border: const TableBorder(
  //       horizontalInside: BorderSide(
  //         color: PdfColors.white,
  //       ),
  //       verticalInside: BorderSide(
  //         color: PdfColors.white,
  //       ),
  //     ),
  //     children: [
  //       TableRow(
  //         decoration: BoxDecoration(
  //           color: PdfColor.fromHex('3366DD'),
  //           borderRadius: const BorderRadius.vertical(
  //             top: Radius.circular(
  //               10.0,
  //             ),
  //           ),
  //         ),
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.all(12),
  //             child: Text(
  //               l10n.sn,
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: PdfColors.white,
  //                 fontSize: 12,
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(12),
  //             child: Text(
  //               l10n.particular,
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: PdfColors.white,
  //                 fontSize: 12,
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(12),
  //             child: Text(
  //               l10n.feeAmountEuro,
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: PdfColors.white,
  //                 fontSize: 12,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       ...List.generate(
  //         model.dataList.length,
  //             (index) {
  //           var data = model.dataList[index];
  //           return TableRow(
  //             decoration: BoxDecoration(
  //               color: PdfColor.fromHex('F1F4FD'),
  //             ),
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(12),
  //                 child: Text(
  //                   "${index + 1}",
  //                   style: const TextStyle(
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(12),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text("Lawyer / Solicitor online Information, Suggestion and Advice.",
  //                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)
  //                     ),
  //                     // SizedBox(
  //                     //   height: 10,
  //                     // ),
  //                     // _richText(
  //                     //   label: l10n.referenceNo,
  //                     //   value: data.refrenceNo,
  //                     //   labelColor: PdfColors.black,
  //                     //   labelFontWeight: FontWeight.bold,
  //                     // ),
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                     _richText(
  //                       label: "${l10n.durationOfCall} ",
  //                       value: data.durationOfCall,
  //                       labelFontWeight: FontWeight.bold,
  //                       valueFontWeight: FontWeight.bold,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(12),
  //                 child: Text(
  //                   data.feeAmount,
  //                   style: TextStyle(
  //                     fontSize: 12,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           );
  //         },
  //       ),
  //       TableRow(
  //         decoration: BoxDecoration(
  //             color: PdfColor.fromHex('F1F4FD'),
  //             borderRadius:
  //             const BorderRadius.vertical(bottom: Radius.circular(10))),
  //         children: [
  //           SizedBox(),
  //           Padding(
  //             padding: const EdgeInsets.all(12),
  //             child: Text(
  //               l10n.totalFareInWords,
  //               style: TextStyle(
  //                 fontSize: 12,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(12),
  //             child: Text(
  //               model.totalFareInWords,
  //               style: TextStyle(
  //                 fontSize: 12,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }



  //
  // static RichText _richText({
  //   required String label,
  //   required String value,
  //   FontWeight? labelFontWeight,
  //   FontWeight? valueFontWeight,
  //   PdfColor? labelColor,
  //   PdfColor? valueColor,
  //
  // }) {
  //   return RichText(
  //     text: TextSpan(
  //       text: label,
  //       style: TextStyle(
  //         fontWeight: labelFontWeight,
  //         color: labelColor ?? PdfColor.fromHex("3366DD"),
  //       ),
  //       children: [
  //         TextSpan(
  //           text: value,
  //           style: TextStyle(
  //             fontWeight: valueFontWeight,
  //             color: valueColor ?? PdfColor.fromHex("434343"),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // static Future<String?> generateAndDownload(
  //     AppLocalizations l10n, {
  //       required InvoicePdfModel model,
  //     }) async {
  //   try {
  //     BotToast.showLoading();
  //     final data = await generateResume(l10n, model: model);
  //     return await download(
  //       data,
  //     );
  //   } catch (e) {
  //     BotToast.closeAllLoading();
  //     log("Error $e");
  //   }
  //   return null;
  // }


  static downloadPdf({
    required String url,
    String? desc,
  }) async {
    try {
      Directory? externalDir;
      if (Platform.isIOS) {
        externalDir = await getApplicationDocumentsDirectory();
      } else {
        final dir = await getExternalStorageDirectory();
        String newDir = '${dir!.path.split('0').first}0/Download';
        externalDir = Directory.fromUri(Uri.parse(newDir));
        if (!externalDir.existsSync()) {
          externalDir.createSync();
        }
      }

      String fileNamee = "${externalDir.path}/${url.split("/").last}";

      log("\x1B[32m $fileNamee \x1B[0m");

      Dio dio = Dio();

      await dio.download(
        url,
        fileNamee,
        onReceiveProgress: (count, total) {
          int percentage = (count / total * 100).toInt();
          log("$percentage");
        },
      );
      _showSnackBar(
        fileNamee,
        desc: desc,
      );
      return fileNamee;
    } catch (e) {
      log("$e");
    }
  }


  static Future<String?> download(
      Uint8List data, {
        String? fileName,
        String? desc,
        Color? snackbarBackgroundColor,
        VoidCallback? onSuccess,
      }) async {
    try {
      BotToast.showLoading();

      Directory? externalDir;
      if (Platform.isIOS) {
        externalDir = await getApplicationDocumentsDirectory();
      } else {
        final dir = await getExternalStorageDirectory();
        String newDir = '${dir!.path.split('0').first}0/Download';
        externalDir = Directory.fromUri(Uri.parse(newDir));
        if (!externalDir.existsSync()) {
          externalDir.createSync();
        }
      }
      String today = DateTime.now()
          .toString()
          .replaceAll(" ", "")
          .replaceAll(":", "")
          .replaceAll(".", "");

      String fileNamee = fileName ?? "lawyer-invoice-$today.pdf";
      File file = File(
        "${externalDir.path}/$fileNamee",
      );

      file.writeAsBytes(data, flush: true);

      final String filePath = file.absolute.path;
      log('-=-=-=-=-=---=------------------------====\n-=-=--------------------------\n\n\n\n\n');
      log(filePath.toString());
      BotToast.closeAllLoading();

      // BotToast.showText(text: "Ola Downloaded");

      _showSnackBar(
        filePath,
        desc: desc,
      );
      return filePath;
    } catch (e) {
      BotToast.closeAllLoading();
      log("Error $e");
    }
    return null;
  }

  static void _showSnackBar(
      String filePath, {
        String? desc,
      }) {
    BotToast.cleanAll();
    BotToast.showNotification(
      duration: const Duration(
        seconds: 5,
      ),
      align: fl.Alignment.bottomCenter,
      title: (c) => fl.Text(
        desc ?? "Invoice Downloaded",
        style: const fl.TextStyle(
          color: fl.Colors.black,
        ),
      ),
      trailing: (cancelFunc) => fl.TextButton(
        child: const fl.Text("Open"),
        onPressed: () {
          try {
            OpenFilex.open(filePath);
          } catch (e) {
            log("$e");
          }
        },
      ),
    );
  }
  static void downloadCsv(List<Invoices>  invoices,WidgetRef ref) async {
    try {
      BotToast.showLoading();
      Directory? externalDir;
      if (Platform.isIOS) {
        externalDir = await getApplicationDocumentsDirectory();
      } else {
        var dir = await getExternalStorageDirectory();

        String newDir = '${dir!.path.split('0').first}0/Download';
        externalDir = Directory.fromUri(Uri.parse(newDir));
        if (!externalDir.existsSync()) {
          externalDir.createSync();
        }
      }

      String filePath = "${externalDir.path}/InvoiceCsv.csv";
      ref.read(invoiceRepoProvider).invoiceExport({
        "id_list": invoices.map((e) => e.id).toList()
      },filePath);
      BotToast.closeAllLoading();
      BotToast.cleanAll();
      _showSnackBar(filePath,desc: "Invoice Csv Downloaded");

    } catch (e) {
      BotToast.closeAllLoading();
      log("\x1B[31m $e \x1B[0m");
    }
  }

}
