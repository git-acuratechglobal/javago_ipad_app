import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/model/cafe_time_and_category.dart';

final validatorsProvider = Provider<Validators>((ref) => Validators());

class Validators {
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please enter email';
    }
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password';
    }

    final hasUppercase = RegExp(r'[A-Z]');
    final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    final hasMinLength = password.length >= 8;

    if (!hasUppercase.hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!hasSpecialChar.hasMatch(password)) {
      return 'Password must contain at least one special character';
    }

    if (!hasMinLength) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Please enter cafe name";
    }
    return null;
  }

  String? validateImage(String ?value) {
    if (value==null||value.isEmpty) {
      return "Please enter cafe image";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return "Please enter cafe phone";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "Please enter cafe address";
    }
    return null;
  }

  String? validateZipCode(String value) {
    if (value.isEmpty) {
      return "Please enter cafe zipcode";
    }
    return null;
  }

  String? validateCheckBox(List<CafeFilter>? value) {
    if (value==null||value.isEmpty) {
      return "Please select cafe category";
    }
    return null;
  }

  String? validateBio(String value) {
    if (value.isEmpty) {
      return "Please enter cafe bio";
    }
    return null;
  }

  String? validateCoffeeOrigin(String? value) {
    if (value==null||value.isEmpty) {
      return "Please select coffee origin";
    }
    return null;
  }

  String? validateCoffeeRoast(String ?value) {
    if (value==null||value.isEmpty) {
      return "Please select coffee roast";
    }
    return null;
  }

  String? validateCountryOrigin(String value) {
    if (value.isEmpty) {
      return "Please select country origin";
    }
    return null;
  }

  String? validateSpecialityCoffee(String ?value) {
    if (value==null||value.isEmpty) {
      return "Please select speciality coffee";
    }
    return null;
  }
}
