// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/octicon.dart';
import 'package:lask_client/core/extension/extension.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/widgets/pdf_preview_page.dart';
import 'package:lask_client/widgets/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';

import '../core/consts/asset_path.dart';
import '../core/consts/colors.dart';
import 'custom_cached_image.dart';
import 'image_viewer.dart';

extension ToFileList on List<CustomListImageFormFieldArgs>? {
  List<File> toFileList() {
    List<File> data = [];
    for (var element in this ?? []) {
      if (element.file != null) {
        data.add(element.file!);
      }
    }
    return data;
  }
}

class CustomListImageFormFieldArgs {
  final File? file;
  final String? placeHolderImage;
  final bool showDelete;

  CustomListImageFormFieldArgs({
    this.file,
    this.placeHolderImage,
    this.showDelete = true,
  });
}

class CustomImageListFormField
    extends FormField<List<CustomListImageFormFieldArgs>> {
  CustomImageListFormField({
    super.key,
    required String labelText,
    String? hintText,
    required void Function(List<File>) imagePick,
    FormFieldValidator<List<CustomListImageFormFieldArgs>?>? validator,
    List<CustomListImageFormFieldArgs>? initialValue,
    bool showRequired = false,
    bool isFile = false,
    int imageLength = 1,
  }) : super(
          validator: validator,
          initialValue: initialValue,
          onSaved: (v) {
            imagePick.call(v.toFileList());
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<List<CustomListImageFormFieldArgs>> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (labelText.isNotEmpty) ...[
                  RichText(
                    text: TextSpan(
                      text: labelText,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.fontGrey,
                        fontFamily: "Inter",
                      ),
                      children: [
                        if (showRequired) ...{
                          const TextSpan(
                            text: " *",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.red,
                              fontFamily: "Inter",
                            ),
                          ),
                        }
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 7.0,
                  )
                ],
                Builder(
                  builder: (context) {
                    return isFile
                        ? _listDesign(state, imageLength)
                        : _gridDesign(state, imageLength);
                  },
                ),
                if (hintText != null) ...[
                  Text(
                    hintText,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.hintTextColor,
                    ),
                  )
                ],
                state.hasError
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          // horizontal: 18,
                          vertical: 8.0,
                        ),
                        child: Text(
                          state.errorText ?? "",
                          style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: 12,
                          ),
                        ),
                      )
                    : Container(),
              ],
            );
          },
        );

  static GridView _gridDesign(
    FormFieldState<List<CustomListImageFormFieldArgs>> state,
    int imageLength,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        crossAxisCount: 3,
        height: 135,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: (state.value?.length ?? 0) +
          ((state.value?.length ?? 0) < imageLength ? 1 : 0),
      itemBuilder: (context, index) {
        bool showUploadButton =
            state.value == null || (index == (state.value!.length));
        if (showUploadButton && (state.value?.length ?? 0) < imageLength) {
          return InkWell(
            onTap: () async {
              final file = await pickImageDialog(context: context);
              if (file == null) return;
              if (state.value != null) {
                state.value?.add(
                  CustomListImageFormFieldArgs(
                    file: file,
                  ),
                );
                state.didChange(state.value);
                state.save();
              } else {
                state.didChange([
                  CustomListImageFormFieldArgs(
                    file: file,
                  ),
                ]);
              }
              state.save();
              //   }
              // }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 10.0,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Upload image',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Container(
          height: 126,
          width: 115,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 1.4,
              color: state.hasError ? AppColors.red : AppColors.borderColor,
            ),
          ),
          child: state.value![index].file != null
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.file(
                        state.value![index].file!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: InkWell(
                        onTap: () {
                          List<CustomListImageFormFieldArgs> old =
                              state.value ?? [];
                          old.removeAt(index);
                          state.didChange(old);
                          state.save();
                        },
                        child: const Iconify(
                          Octicon.trash_24,
                          size: 18,
                          color: AppColors.red,
                        ),
                      ),
                    )
                  ],
                )
              : state.value![index].placeHolderImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CustomCachedImage(
                        imageUrl: state.value![index].placeHolderImage!,
                      ),
                    )
                  : null,
        );
      },
    );
  }

  static Future<T?> pickImageDialog<T>({
    required BuildContext context,
    bool allowMultiple = false,
  }) async {
    final ImagePicker picker = ImagePicker();
    return showDialog<T>(
      context: context,
      builder: ((context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: allowMultiple
                      ? () async {
                          List<XFile> ll = await picker.pickMultiImage();
                          Navigator.pop(
                              context, ll.map((e) => File(e.path)).toList());
                        }
                      : () async {
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {
                            Navigator.pop(context, File(image.path));
                          }
                        },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Choose from gallery'),
                      Icon(
                        FontAwesomeIcons.image,
                        color: AppColors.primaryColor,
                        size: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      Navigator.pop(
                          context,
                          allowMultiple
                              ? [File(image.path)]
                              : File(image.path));
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Choose from camera'),
                      Icon(
                        FontAwesomeIcons.camera,
                        color: AppColors.primaryColor,
                        size: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      }),
    );
  }

  static Future<List<String?>?> pickImageDialogForFile(
      {required BuildContext context}) async {
    final ImagePicker picker = ImagePicker();
    return showDialog<List<String?>?>(
      context: context,
      builder: ((context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            allowMultiple: true,
                            type: FileType.custom,
                            allowedExtensions: [
                          'jpg',
                          'pdf',
                          'png',
                        ]);
                    if (result != null) {
                      Navigator.pop(context, result.paths);
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Choose from files'),
                      Icon(
                        FontAwesomeIcons.image,
                        color: AppColors.primaryColor,
                        size: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      Navigator.pop(context, [image.path]);
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Choose from camera'),
                      Icon(
                        FontAwesomeIcons.camera,
                        color: AppColors.primaryColor,
                        size: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      }),
    );
  }

  static Widget _listDesign(
    FormFieldState<List<CustomListImageFormFieldArgs>> state,
    int imageLength,
  ) {
    bool showUpload = (state.value?.length ?? 0) < imageLength;
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showUpload)
            InkWell(
              onTap: () async {
                List<String?>? result =
                    await pickImageDialogForFile(context: context);

                if (result == null) return;

                List<CustomListImageFormFieldArgs> files = result
                    .where((path) => path != null)
                    .map((e) => CustomListImageFormFieldArgs(file: File(e!)))
                    .toList();

                if (state.value != null) {
                  state.value?.addAll(
                    files,
                  );
                  state.didChange(state.value);
                  state.save();
                } else {
                  state.didChange(files);
                }
                state.save();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.primaryColor.withOpacity(0.12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Iconify(
                      MaterialSymbols.upload_rounded,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      "Upload File ",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(
            height: 15,
          ),
          if (state.value != null)
            ...List.generate(
              state.value!.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: _buildBubble(
                  index,
                  state.value!,
                  onDelete: state.value![index].showDelete
                      ? () {
                          List<CustomListImageFormFieldArgs> old =
                              state.value ?? [];
                          old.removeAt(index);
                          state.didChange(old);
                          state.save();
                        }
                      : null,
                ),
              ),
            ),
        ],
      );
    });
  }

  static Builder _buildBubble(
    int index,
    List<CustomListImageFormFieldArgs> dat, {
    required VoidCallback? onDelete,
  }) {
    File? fileData = dat[index].file;
    String? networkFile = dat[index].placeHolderImage;

    bool isPdf = fileData?.path.isPdf ?? (networkFile?.isPdf) ?? false;
    bool isImage = fileData?.path.isImage ?? (networkFile?.isImage) ?? false;
    return Builder(builder: (context) {
      return InkWell(
        onTap: () {
          if (dat[index].file != null) {
            String data = dat[index].file!.path;
            if (data.isPdf) {
              context.router.push(PdfPreviewRoute(
                  args: PdfPreviewPageArgs(
                isFilePath: true,
                filePath: dat[index].file?.path,
              )));
            } else if (data.isImage) {
              Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ImageViewer(
                      initialPage: 0,
                      type: ImageViewType.file,
                      imageList: [dat[index].file!],
                    ),
                  )
              );

            } else {
              showErrorToast(text: "Unsupported File Type");
            }
          } else if (dat[index].placeHolderImage != null) {
            String data = dat[index].placeHolderImage!;
            if (data.isPdf) {
              context.router.push(PdfPreviewRoute(
                  args: PdfPreviewPageArgs(
                isNetwork: true,
                networkUrl: data,
              )));
            } else if (data.isImage) {
              Navigator.of(context).push(  MaterialPageRoute(
                builder: (context) => ImageViewer(
                  initialPage: 0,
                  type: ImageViewType.network,
                  imageList: [data],
                ),
              ));
            } else {
              showErrorToast(text: "Unsupported File Type");
            }
          }
        },
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: isPdf
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AssetPath.pdfImage),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fileData?.path ?? networkFile ?? "-",
                                maxLines: fileData?.path != null ? 1 : 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              if (fileData?.fileSize != null)
                                Text(
                                  "${fileData.fileSize}",
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: AppColors.lightFontGrey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (onDelete != null)
                          InkWell(
                            onTap: onDelete,
                            child: const SizedBox(
                              height: 18,
                              width: 18,
                              child: Iconify(
                                Octicon.trash_24,
                                size: 18,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                      ],
                    )
                  : isImage
                      ? fileData != null
                          ? Image.file(
                              fileData,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            )
                          : (networkFile != null
                              ? Image.network(
                                  networkFile,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )
                              : const Text("data"))
                      : const Text("data"),
            ),
            if (isImage && onDelete != null)
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: onDelete,
                  child: const SizedBox(
                    height: 18,
                    width: 18,
                    child: Iconify(
                      Octicon.trash_24,
                      size: 18,
                      color: AppColors.red,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
