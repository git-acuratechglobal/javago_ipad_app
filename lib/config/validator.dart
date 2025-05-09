import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter password';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}