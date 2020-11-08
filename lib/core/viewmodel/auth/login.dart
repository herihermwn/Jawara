part of '../viewmodels.dart';

class LoginViewmodel extends BaseViewModel with ViewModelLifecycle {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  bool get isValid => _isEmailValid && _isPasswordValid;

  Map<String, dynamic> checkEmail(String p1) {
    bool isValid = isEmail(p1);
    String errorMessage = "";

    if (!isValid) {
      errorMessage = "Email tidak valid";
    }

    _isEmailValid = isValid;
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

    _isPasswordValid = isValid;
    notifyListeners();
    return {
      "isValid": isValid,
      "errorMessage": errorMessage,
    };
  }

  Future<void> registerPage() async {
    movePage(RegisterPage());
  }
}
