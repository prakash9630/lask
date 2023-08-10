class OrganizationModel {
  int id;
  String name;
  String logo;
  String description;
  String primaryContactNumber;
  String secondaryContactNumber;
  String primaryCompanyEmail;
  String secondaryCompanyEmail;
  String? address;

  OrganizationModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.description,
    required this.primaryContactNumber,
    required this.secondaryContactNumber,
    required this.primaryCompanyEmail,
    required this.secondaryCompanyEmail,
    this.address,
  });

  factory OrganizationModel.fromJson(Map<String, dynamic> json) =>
      OrganizationModel(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        description: json["description"],
        primaryContactNumber: json["primary_contact_number"],
        secondaryContactNumber: json["secondary_contact_number"],
        primaryCompanyEmail: json["primary_company_email"],
        secondaryCompanyEmail: json["secondary_company_email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "description": description,
    "primary_contact_number": primaryContactNumber,
    "secondary_contact_number": secondaryContactNumber,
    "primary_company_email": primaryCompanyEmail,
    "secondary_company_email": secondaryCompanyEmail,
    "address": address,
  };
}
