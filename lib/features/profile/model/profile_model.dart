
class ProfileModel {
  String? fullName;
  String? username;
  String? phoneNumber;
  String? email;
  String? userImage;
  String? firstName;
  String? middleName;
  String? lastName;
  String? address;
  String? nationality;
  String? dob;
  String? nib;
  String? mobileDeviceId;
  String? externalId;
  int? country;
  bool tocAccepted;
  bool ppAccepted;
  String? ppContent;
  String? tocContent;


  ProfileModel(
      {this.username,
        this.phoneNumber,
        this.email,
        this.userImage,
        this.firstName,
        this.middleName,
        this.lastName,
        this.address,
        this.nationality,
         this.tocAccepted=false,
         this.ppAccepted=false,
        this.ppContent,
        this.tocContent,
        this.dob,
        this.nib,
        this.country,
        this.fullName,
        this.externalId,
        this.mobileDeviceId});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {


    return ProfileModel(
        fullName: json['full_name'],
        username : json['username'],
        phoneNumber : json['phone_number'],
        email : json['email'],
        userImage : json['user_image'],
        firstName : json['first_name'],
        middleName : json['middle_name'],
        lastName : json['last_name'],
        address : json['address'],
        nationality : json['nationality'],
        dob : json['dob'],
        nib : json['nib'],
        country: json['country'],
    mobileDeviceId : json['mobile_device_id'],
    externalId : json['external_id'],
    ppContent:json['pp_content'],
    tocContent : json['toc_content'],
    ppAccepted :json['pp_accepted']??false,
    tocAccepted :json['toc_accepted']??false,
    );

  }
}