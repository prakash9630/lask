import 'package:lask_client/features/profile/model/profile_model.dart';

class HomePageModel {
  ProfileModel? profile;
  List<RecentCalls>? recentCalls;
  HomePageModel({this.profile, this.recentCalls});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ?  ProfileModel.fromJson(json['profile']) : null;
    if (json['recent_calls'] != null) {
      recentCalls = <RecentCalls>[];
      json['recent_calls'].forEach((v) {
        recentCalls!.add(RecentCalls.fromJson(v));
      });
    }
  }
}

class RecentCalls {
  int? id;
  String? callStatus;
  String? service;
  double? duration;
  Lawyer? lawyer;
  String? createdAt;

  RecentCalls(
      {this.id,
        this.callStatus,
        this.service,
        this.duration,
        this.lawyer,
        this.createdAt});

  RecentCalls.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    callStatus = json['call_status'];
    service = json['service'];
    duration = json['duration'];
    lawyer =
    json['lawyer'] != null ? Lawyer.fromJson(json['lawyer']) : null;
    createdAt = json['created_at'];
  }
}

class Lawyer {
  int? id;
  User? user;
  String? licenseNumber;
  String? licenseExpiry;
  List<Services>? services;
  double? rating;
  int? numberOfRating;
  bool? lawyerOnline;
  int? experience;
  int? totalCalls;
  String? purposeOfLastCall;

  Lawyer(
      {this.id,
        this.user,
        this.licenseNumber,
        this.licenseExpiry,
        this.services,
        this.rating,
        this.numberOfRating,
        this.experience,
        this.totalCalls,
        this.purposeOfLastCall,
        this.lawyerOnline});

  Lawyer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    licenseNumber = json['license_number'];
    licenseExpiry = json['license_expiry'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    rating = json['rating'];
    purposeOfLastCall=json['purpose_of_last_call'];
    numberOfRating = json['number_of_rating'];
    lawyerOnline = json['lawyer_online'];
    experience = json['experience'];
    totalCalls = json['total_calls'];
  }
}

class User {
  int? id;
  String? fullName;
  String? username;
  String? userType;
  String? firstName;
  String? middleName;
  String? lastName;
  String? address;
  String? userImage;

  User(
      {this.id,
        this.fullName,
        this.username,
        this.userType,
        this.firstName,
        this.middleName,
        this.lastName,
        this.address,
        this.userImage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    username = json['username'];
    userType = json['user_type'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    address = json['address'];
    userImage = json['user_image'];
  }
}

class Services {
  int? id;
  String? name;
  String? image;
  String? description;

  Services({this.id, this.name, this.image, this.description});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }
}