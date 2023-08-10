import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/mi.dart';
import 'package:iconify_flutter/icons/octicon.dart';
import 'package:lask_client/core/extension/extension.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import '../../components/custom_textfield.dart';
import '../../core/consts/colors.dart';
import '../../widgets/custom_image_list_form_field.dart';
import '../../widgets/pdf_preview_page.dart';

class ChatDetailSendWidget extends HookConsumerWidget {
  const ChatDetailSendWidget({
    Key? key,
    this.onSend,
    this.onSendMultipleFile,
    this.allowMultiple = false,
  }) : super(key: key);

  final void Function(String, File?)? onSend;

  final void Function(String, List<File>?)? onSendMultipleFile;

  final bool allowMultiple;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useState<String>("");
    final textController = useTextEditingController();

    final pickedFile = useState<List<File>?>(null);
    var file = pickedFile.value;

    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (file != null) ...{
              SizedBox(
                // color: Colors.amber,
                height: 110,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: file.length,
                    itemBuilder: (context, index) {
                      File data = file[index];
                      return InkWell(
                        onTap: () {
                          if (data.path.isPdf) {
                            context.router.push(PdfPreviewRoute(
                                args: PdfPreviewPageArgs(
                              isFilePath: true,
                              filePath: data.path,
                            )));
                          } else if (data.path.isImage) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Image.file(
                                      data,
                                    ),
                                  );
                                });
                          } else {
                            showErrorToast(text: "Unsupported File Type");
                          }
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 120,
                              width: 100,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.borderColor),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: data.path.isPdf
                                  ? Center(child: _buildPdfIcon())
                                  : (data.path.isImage
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          child: Image.file(
                                            data,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : null),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: InkWell(
                                onTap: () {
                                  if (allowMultiple) {
                                    var data = pickedFile.value ?? [];
                                    if (data.isEmpty) {
                                      pickedFile.value = null;
                                    } else {
                                      data.removeAt(index);
                                      pickedFile.value =
                                          data.isNotEmpty ? [...data] : null;
                                    }
                                  } else {
                                    pickedFile.value = null;
                                  }
                                },
                                child: const Iconify(
                                  Octicon.trash_24,
                                  size: 18,
                                  color: AppColors.red,
                                ),
                              ),
                            ),
                            if (data.path.isPdf)
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(2.0),
                                  margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    data.path.fileName,
                                    maxLines: 1,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              )
            },
            CustomTextField(
              hintText: "Enter your message",
              controller: textController,
              onChanged: (p0) {
                text.value = p0;
              },
              validator: allowMultiple
                  ? (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "Enter Message";
                      }
                      return null;
                    }
                  : null,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (pickedFile.value == null) ...[
                    _filePicker(
                      isAttachment: true,
                      onPicked: (p0) {
                        pickedFile.value = p0;
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    _filePicker(
                      isAttachment: false,
                      onPicked: (p0) {
                        pickedFile.value = p0;
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                  if (text.value.isNotEmpty || pickedFile.value != null) ...[
                    InkWell(
                      onTap: () {
                        if (allowMultiple) {
                          if (formKey.currentState!.validate()) {
                            onSendMultipleFile?.call(
                              text.value,
                              pickedFile.value,
                            );
                            text.value = '';
                            textController.clear();
                            pickedFile.value = null;
                          }
                        } else {
                          FocusScope.of(context).unfocus();
                          onSend?.call(
                            text.value,
                            pickedFile.value?.getFirstOrNull,
                          );
                          text.value = '';
                          textController.clear();
                          pickedFile.value = null;
                        }
                      },
                      child: const Iconify(
                        Mdi.send,
                        color: AppColors.primaryColor,
                        // size: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ]
                ],
              ),
              labelText: "",
            ),
          ],
        ),
      ),
    );
  }

  Container _buildPdfIcon() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: const Text(
        "PDF",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    );
  }

  Builder _filePicker({
    required bool isAttachment,
    required void Function(List<File>?) onPicked,
  }) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () async {
            if (isAttachment) {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: [
                  'pdf',
                ],
                allowMultiple: allowMultiple,
              );
              if (result != null && result.paths.isNotEmpty) {
                if (allowMultiple) {
                  var filePath = result.paths
                      .where((element) => element != null)
                      .toList()
                      .map((e) => File(e!))
                      .toList();
                  onPicked.call(filePath);
                } else {
                  var filePath = result.paths.first;
                  if (filePath != null) {
                    onPicked.call([File(filePath)]);
                  }
                }
              }
            } else {
              if (allowMultiple) {
                List<File>? file =
                    await CustomImageListFormField.pickImageDialog<List<File>>(
                  context: context,
                  allowMultiple: true,
                );
                if (file != null) {
                  onPicked.call(file);
                }
              } else {
                File? file = await CustomImageListFormField.pickImageDialog(
                  context: context,
                );
                if (file != null) {
                  onPicked.call([file]);
                }
              }
            }
          },
          child: Iconify(
            isAttachment ? Mi.attachment : Mdi.camera,
            color: AppColors.primaryColor,
          ),
        );
      },
    );
  }
}
