
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';

import '../core/consts/colors.dart';
import '../features/edit_profile/repo/edit_profile_repo.dart';
import '../features/profile/provider/profile_provider.dart';
import '../features/profile/repo/profile_repo.dart';

void profileImageChangeDialog(BuildContext context,{bool isSignUp=false,Function(XFile file)? onImagePick}){
  showDialog(context: context, builder: (context){
    return ImageChangeDialog(onImagePick: onImagePick,isSignUp: isSignUp,);
  });
}


class ImageChangeDialog extends ConsumerWidget {
  const ImageChangeDialog({Key? key,this.onImagePick,required this.isSignUp}) : super(key: key);
  final Function(XFile file)? onImagePick;
  final bool isSignUp;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final profProv = ref.watch(profileProvider);
    return Dialog(
      insetPadding:
      const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                profProv.pickImage(
                  onImagePicked: (file) async {
                    if(isSignUp){
                      if(onImagePick!=null){
                        onImagePick!(file);
                        context.router.pop();
                      }
                    }else
                      {
                       final response= await ref.read(profileRepo).profileUpdate(file: file);
                       response.fold((l){
                          showErrorToast(text: "Could not update profile");
                       }, (r){
                         context.router.pop();
                         profProv.getData();
                       });
                      }
                  }
                );
              },
              child: const Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(
                      'Choose from gallery'),
                  Icon(
                    FontAwesomeIcons.image,
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
                profProv.pickImage(
                    fromCamera: true, onImagePicked: (file) async{
                  if(isSignUp){
                    if(onImagePick!=null){
                      onImagePick!(file);
                    } else{
                      await ref.read(profileRepo).profileUpdate(file: file).then((value) async {
                        await profProv.getData();
                      });

                    }
                  }
                });
                context.router.pop();
              },
              child: const Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text(
                      'Choose from camera'),
                  Icon(
                    FontAwesomeIcons.camera,
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
  }
}
