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
    await movePage(RegisterPage());
  }

  Future<void> login() async {
    // Do Auth here
    AwesomeDialog dialog = awesomeDialog.showLoadingDialog();
    Future.delayed(Duration(seconds: 3), () {
      if (emailController.text == "herih1876@gmail.com" &&
          passwordController.text == "1234567") {
        dialog.dissmiss();
        replacePage(HomePage());
      } else {
        dialog.dissmiss();

        awesomeDialog.showErrorDialog(
            message: "Periksa kembali email dan password Anda",
            title: "User tidak ditemukan!");
      }
    });
  }
}
