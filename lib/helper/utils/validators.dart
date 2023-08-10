import 'dart:developer';
import 'dart:io';

class Validators {
  static String? email(String? input) {
    if (input!.isEmpty) {
      return "Email Address cannot be empty.";
    }
    bool isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input);
    if (!isValid) {
      return "Email Address is Not Valid";
    }
    return null;
  }

  static String? isRequired(String? input) {
    if (input == null || input.isEmpty) {
      return "This is a required field.";
    }
    return null;
  }

  static String? image(File? input) {
    if (input == null || input.path.isEmpty) {
      return "This is a required field.";
    }
    return null;
  }

  static String? dateTime(DateTime? input) {
    if (input == null) {
      return "This is a required field.";
    }
    return null;
  }

  static String? dateTimeBefore({DateTime? start, DateTime? end}) {
    if (end == null) {
      return null;
    } else if (start == null) {
      return "Please fill Start Date first";
    } else if (end.isBefore(start)) {
      return "End date cannot be before start date";
    }
    return null;
  }

  static String? name(String? input) {
    if (input!.isEmpty) {
      return "Full Name cannot be empty.";
    }
    if (input.length < 2) {
      return "Full Name is Not Valid";
    }
    return null;
  }

  static String? password(String? input) {
    if (input!.isEmpty) {
      return "Password cannot be empty.";
    }
    if (input.length < 8) {
      return "Password cannot be less then 8 characters.";
    }
    return null;
  }

  static String? confirmPassword(String? input, String newPassword) {
    if (input!.isEmpty) {
      return "Password cannot be empty.";
    }
    if (input != newPassword) {
      return "Password did not match.";
    }
    return null;
  }

  static String? phone(String? input) {
    if (input!.isEmpty) {
      return "Enter a phone number";
    }
    bool isValid = RegExp(r'^9\d{8,9}$').hasMatch(input);
    if (!isValid) {
      return "Enter a valid phone number";
    }
    return null;
  }

  // static String? contact(String? input) {
  //   if (input!.isEmpty) {
  //     return "Contact number can not be blank";
  //   } else if (isNumeric(input) == false) {
  //     return "Contact number can not be string";
  //   } else if (input.length < 8 || input.length > 10) {
  //     return "Contact number should be between 8 and 10";
  //   } else if (input[0] != "0" || input[0] != "9") {
  //     return "Contact number should be start with 0 or 9";
  //   } else {
  //     return null;
  //   }
  // }

  static bool isNumeric(String? str) {
    try {
      var input = int.parse(str!);
      log("$input");
      return true;
    } on FormatException {
      return false;
    }
  }
}
