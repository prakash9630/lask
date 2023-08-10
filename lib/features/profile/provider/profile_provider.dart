
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/features/profile/model/profile_model.dart';
import 'package:lask_client/features/profile/repo/profile_repo.dart';
import '../../../helper/utils/app_utils.dart';
import '../../auth/screens/reset_password_page.dart';
import '../model/profile_menu_model.dart';

final profileProvider = ChangeNotifierProvider<ProfileProvider>((ref) {
  return ProfileProvider(ref);
});


class ProfileProvider extends ChangeNotifier{
   ProfileProvider(this.ref);
   final Ref ref;
  List<ProfileMenuModel> profileMenu=[
    ProfileMenuModel(title: "View Profile",iconPath: AssetPath.profileEdit,page:const EditProfileRoute()),
    ProfileMenuModel(title: "My Cards",iconPath: AssetPath.profileInvoice,page:const MyCardRoute()),
    ProfileMenuModel(title: "My Invoice",iconPath: AssetPath.profileInvoice,page:const MyInvoiceRoute()),
    ProfileMenuModel(title: "My Gift Vouchers",iconPath: AssetPath.profileVoucher,page:const GiftVoucherRoute()),
    ProfileMenuModel(title: "Change Password",iconPath: AssetPath.profileChangePassword,page: ResetPasswordRoute(arg: ResetPassPageArgs(isChangePassword: true))),
    ProfileMenuModel(title: "Logout",iconPath: AssetPath.profileLogout,page:const MyInvoiceRoute()),
    ProfileMenuModel(title: "Delete Account",iconPath: AssetPath.profileDeleteAccount,page: DeleteAccountRoute()),
  ];
  ProfileModel? model;
  bool isLoading=true;
  String? deviceId;
  PhoneNumber? phoneNumber;

  Future pickImage({bool fromCamera = false,required Function(XFile file) onImagePicked}) async {
    try {
      XFile? image = await ImagePicker().pickImage(
          source: fromCamera ? ImageSource.camera : ImageSource.gallery);
      print(image?.path);
      if (image == null) {
        print("someting");
      } else {
           onImagePicked(image);
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> getData({String? deviceId})async{
    showLoading(true);
     final response= await ref.read(profileRepo).fetchProfile();
     response.fold((l){
     }, (r){
        model= ProfileModel.fromJson(r);

     });
     if(deviceId!=null){this.deviceId=deviceId;}
     showLoading(false);
     phoneNumber=await extractRegionCode(model?.phoneNumber??"");
     notifyListeners();
  }

  showLoading(bool loading){
    isLoading=loading;
    notifyListeners();
  }
}