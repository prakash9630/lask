import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../core/consts/colors.dart';
import '../widgets/custom_cached_image.dart';


class CustomImageFormField extends FormField<File> {
  CustomImageFormField(
      {super.key,
      required String labelText,
      required void Function(File?)? imagePick,
      FormFieldValidator<File?>? validator,
      File? initialValue,
      bool isRequired = false,
      bool isAvatarPicker = false,
      bool doCrop = true,
      bool isNewLabel = true,
      String? networkInitialImage,
      void Function()? remove,
      required BuildContext context})
      : super(
          validator: validator,
          initialValue: initialValue,
          onSaved: imagePick,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<File> state) {
            return SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isAvatarPicker) ...[
                    Center(
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: state.hasError
                                  ? Colors.red.shade600
                                  : Colors.white,
                              child: CircleAvatar(
                                radius: 57,
                                backgroundColor: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(57),
                                  child: Container(
                                    width: 57 * 2,
                                    height: 57 * 2,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: state.value != null
                                        ? Image.file(
                                            state.value!,
                                            fit: BoxFit.cover,
                                          )
                                        : networkInitialImage != null
                                            ? CustomCachedImage(
                                                imageUrl: networkInitialImage,
                                              )
                                            : Icon(
                                                Icons.person,
                                                size: 90,
                                                color: state.hasError
                                                    ? Colors.red.shade600
                                                    : AppColors.borderColor,
                                              ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: AppColors.primaryColor,
                                  child: InkWell(
                                    onTap: () {
                                      final ImagePicker picker = ImagePicker();
                                      showDialog(
                                          context: context,
                                          builder: ((context) {
                                            return Dialog(
                                              insetPadding:
                                                  const EdgeInsets.all(20.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        final XFile? image =
                                                            await picker.pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery);
                                                        if (image != null) {
                                                          state.didChange(
                                                            File(image.path),
                                                          );
                                                          state.save();
                                                        }
                                                        // navigateBack(
                                                        //     context: context);
                                                      },
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Choose from gallery'),
                                                          Icon(
                                                            FontAwesomeIcons
                                                                .image,
                                                            color: AppColors
                                                                .primaryColor,
                                                            size: 20,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        final XFile? image =
                                                            await picker.pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .camera);
                                                        if (image != null) {
                                                          state.didChange(
                                                              File(image.path));
                                                          state.save();
                                                        }
                                                        // navigateBack(
                                                        //     context: context);
                                                      },
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Choose from camera'),
                                                          Icon(
                                                            FontAwesomeIcons
                                                                .camera,
                                                            color: AppColors
                                                                .primaryColor,
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
                                          }));
                                    },
                                    child: const CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 18,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ] else ...[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (labelText.isNotEmpty) ...[
                          Text(
                            labelText,
                            style: isNewLabel
                                ? const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: AppColors.fontGrey,
                                  )
                                : null,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                        ],
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        showDialog(
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
                                          final XFile? image =
                                              await picker.pickImage(
                                                  source: ImageSource.gallery);
                                          if (image != null) {
                                            state.didChange(
                                              File(image.path),
                                            );
                                            state.save();
                                          }
                                          // navigateBack(context: context);
                                        },
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                              await picker.pickImage(
                                                  source: ImageSource.camera);
                                          if (image != null) {
                                            state.didChange(File(image.path));
                                            state.save();
                                          }
                                          // navigateBack(context: context);
                                        },
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                            }));
                      },
                      child: Container(
                        height: 126,
                        width: 115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 1.4,
                            color: state.hasError
                                ? AppColors.primaryColor
                                : AppColors.borderColor,
                          ),
                        ),
                        // style: OutlinedButton.styleFrom(
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(10.0),
                        //   ),
                        // side: BorderSide(
                        //   width: 1.4,
                        //   color: state.hasError
                        //       ? Colors.red.shade600
                        //       : AppColors.orange,
                        // ),
                        // ),

                        child: state.value != null
                            ? Stack(
                                fit: StackFit.expand,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.file(
                                      state.value!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: InkWell(
                                      onTap: () {
                                        if (remove != null) {
                                          remove.call();
                                          state.didChange(null);
                                        }
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              border: Border.all(
                                                  color:
                                                      AppColors.primaryColor)),
                                          child: const Icon(Icons.close,
                                              color: AppColors.primaryColor,
                                              size: 14)),
                                    ),
                                  )
                                ],
                              )
                            : networkInitialImage != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: CustomCachedImage(
                                      imageUrl: networkInitialImage,
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors.primaryColor,
                                        radius: 10.0,
                                        child: Icon(
                                          Icons.add,
                                          color: state.hasError
                                              ? AppColors.fontGrey
                                              : Colors.white,
                                          size: 18.0,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      const Text(
                                        'Upload image',
                                        style: TextStyle(
                                            color: AppColors.fontGrey,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                      ),
                    ),
                  ],
                  state.hasError
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8.0),
                          alignment: isAvatarPicker ? Alignment.center : null,
                          child: Text(
                            state.errorText ?? "",
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 12,
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            );
          },
        );

  // static Future<File?> _cropImage(String filePath) async {
  //   print("I am Cropping");
  //   CroppedFile? croppedImage = await ImageCropper().cropImage(
  //     sourcePath: filePath,
  //     compressQuality: 100,
  //     compressFormat: ImageCompressFormat.jpg,
  //     cropStyle: CropStyle.circle,
  //     uiSettings: [
  //       AndroidUiSettings(
  //         toolbarTitle: 'Edit Your Image',
  //         toolbarColor: AppColors.cyan,
  //         toolbarWidgetColor: Colors.white,
  //         activeControlsWidgetColor: AppColors.cyan,
  //         hideBottomControls: true,
  //         showCropGrid: false,
  //         initAspectRatio: CropAspectRatioPreset.square,
  //         lockAspectRatio: true,
  //       ),
  //       IOSUiSettings(
  //         title: 'Edit Your Image',
  //       ),
  //     ],
  //   );

  //   return croppedImage != null ? File(croppedImage.path) : null;

  // }
}
