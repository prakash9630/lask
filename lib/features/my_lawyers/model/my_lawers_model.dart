
import '../../home_page/model/hompage_model.dart';

class MyLawyersModel {
  int? count;
  String? next;
  String? previous;
  List<Lawyer>? lawyers;
  MyLawyersModel({this.count, this.next, this.previous, this.lawyers});

  MyLawyersModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      lawyers = <Lawyer>[];
      json['results'].forEach((v) {
        lawyers!.add(Lawyer.fromJson(v));
      });
    }
  }

}

// class Lawyers {
//   int? id;
//   User? user;
//   String? licenseNumber;
//   String? licenseExpiry;
//
//   Lawyers({this.id, this.user, this.licenseNumber, this.licenseExpiry});
//
//   Lawyers.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//     licenseNumber = json['license_number'];
//     licenseExpiry = json['license_expiry'];
//   }
//
// }

// class User {
//   int? id;
//   String? fullName;
//   String? username;
//   String? userType;
//   String? firstName;
//   String? middleName;
//   String? lastName;
//   String? address;
//   String? userImage;
//
//   User(
//       {this.id,
//         this.fullName,
//         this.username,
//         this.userType,
//         this.firstName,
//         this.middleName,
//         this.lastName,
//         this.address,
//         this.userImage});
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     fullName = json['full_name'];
//     username = json['username'];
//     userType = json['user_type'];
//     firstName = json['first_name'];
//     middleName = json['middle_name'];
//     lastName = json['last_name'];
//     address = json['address'];
//     userImage = json['user_image'];
//   }
// }