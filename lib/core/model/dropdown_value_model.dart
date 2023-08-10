class DropdownValueModel {
  final String key;
  final String value;
  final String? icon;

  DropdownValueModel({required this.key, required this.value, this.icon});

  factory DropdownValueModel.fromJson(Map<String, dynamic> json) {
    return DropdownValueModel(
      key: "${json["id"]}",
      value: json["name"] ?? json["value"] ?? "-",
    );
  }

  static DropdownValueModel getSameKeyVal(String data) {
    return DropdownValueModel(
      key: data,
      value: data,
    );
  }

  static DropdownValueModel getDiffKeyVal(String key, String val) {
    return DropdownValueModel(
      key: key,
      value: val,
    );
  }

  static List<DropdownValueModel> getGender() {
    return [
      DropdownValueModel(
        key: "M",
        value: "Male",
      ),
      DropdownValueModel(
        key: "F",
        value: "Female",
      ),
      DropdownValueModel(
        key: "O",
        value: "Others",
      ),
    ];
  }

  static List<DropdownValueModel> getMaritalStatus() {
    return [
      DropdownValueModel(
        key: "m",
        value: "Married",
      ),
      DropdownValueModel(
        key: "s",
        value: "Single",
      ),
      DropdownValueModel(
        key: "O",
        value: "Rather Not Say",
      ),
    ];
  }

  static List<DropdownValueModel> getBloodGroup() {
    return [
      DropdownValueModel(
        key: "A+",
        value: "A (+ve)",
      ),
      DropdownValueModel(
        key: "A-",
        value: "A (-ve)",
      ),
      DropdownValueModel(
        key: "B+",
        value: "B (+ve)",
      ),
      DropdownValueModel(
        key: "B-",
        value: "B (-ve)",
      ),
      DropdownValueModel(
        key: "AB+",
        value: "AB (+ve)",
      ),
      DropdownValueModel(
        key: "AB-",
        value: "AB (-ve)",
      ),
      DropdownValueModel(
        key: "O+",
        value: "O (+ve)",
      ),
      DropdownValueModel(
        key: "O-",
        value: "O (-ve)",
      ),
    ];
  }
}
