import 'package:get/get.dart';

class MyValidators {
  MyValidators._();
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password'.tr;
    }

    // Check for minimum length of 8 characters
    if (value.length < 8) {
      return 'Password must be at least 8 characters long'.tr;
    }

    // Regular expression to check for at least one uppercase letter
    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter'.tr;
    }

    // Regular expression to check for at least one lowercase letter
    if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter'.tr;
    }

    // Regular expression to check for at least one digit
    if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
      return 'Password must contain at least one number'.tr;
    }

    // Regular expression to check for at least one special character
    if (!RegExp(r'^(?=.*[!@#\$&*~])').hasMatch(value)) {
      return 'Password must contain at least one special character (!@#\$&*~)'
          .tr;
    }

    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email'.tr;
    }

    // Regular expression for email validation
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address'.tr;
    }

    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name'.tr; // Error if the field is empty
    }

    // Regular expression for name validation: only letters and spaces allowed
    String pattern = r"^[a-zA-Z\s\u0621-\u064A]+$"; // Includes Arabic letters
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid name'
          .tr; // Error if name contains invalid characters
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters long'
          .tr; // Error for very short names
    }

    return null; // Return null if the name is valid
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field can't be empty".tr; // Error if the field is empty
    }

    // Regular expression for phone number validation
    String pattern =
        r'^\+?[1-9]\d{1,14}$'; // Allows international phone numbers
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid phone number'
          .tr; // Error if phone number is invalid
    }

    return null; // Return null if the phone number is valid
  }
}
