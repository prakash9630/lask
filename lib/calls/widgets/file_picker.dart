import 'package:file_picker/file_picker.dart';
import 'dart:io';

Future<void> filePicker(
    {required Function(File file) onFilePicked, Function()? onCancel}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    File file = File(result.files.single.path!);
    onFilePicked(file);
  } else {
    if (onCancel != null) {
      onCancel();
    }
  }
}
