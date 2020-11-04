part of '../viewmodels.dart';

class AuthViewmodel extends BaseViewModel with ViewModelLifecycle {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isEmailValid = false;
  bool isPasswordValid = false;

  Map<String, dynamic> checkEmail(String p1) {
    bool isValid = true;
    String errorMessage = "";

    RegExp regex = RegExp(emailPattern);

    if (!regex.hasMatch(p1) || p1 == null) {
      isValid = false;
      errorMessage = "Email tidak valid";
    }

    isEmailValid = isValid;
    notifyListeners();
    return {
      "isValid": isValid,
      "errorMessage": errorMessage,
    };
  }

  Map<String, dynamic> checkPassword(String p1) {
    bool isValid = true;
    String errorMessage = "";

    if (p1.length < 6) {
      isValid = false;
      errorMessage = "Password minimal 6 huruf";
    }

    isPasswordValid = isValid;
    notifyListeners();
    return {
      "isValid": isValid,
      "errorMessage": errorMessage,
    };
  }

}
