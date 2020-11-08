part of '../viewmodels.dart';

enum Gender { Pria, Wanita }

class RegisterViewmodel extends BaseViewModel with ViewModelLifecycle {
  //* SelfInformation
  bool _isPNumberValid = false;
  bool _isNameValid = false;

  File imageFile;
  Gender selectedGender = Gender.Pria;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool get isSelfInformationValid =>
      _isPNumberValid && _isNameValid && (imageFile != null);

  //* InstitutionalInformation
  bool _isInstitutionalValid = false;
  bool _isPositionValid = false;
  bool _isPlaceValid = false;

  TextEditingController institutionalController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  bool get isInstitutionalInformationValid =>
      _isInstitutionalValid && _isPositionValid && _isPlaceValid;

  //* AccountInformation
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isConfirmPasswordValid = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool get isAccountInformationValid =>
      _isEmailValid && _isPasswordValid && _isConfirmPasswordValid;

  GlobalKey<PageSliderState> sliderKey = GlobalKey();
  int currentIndex = 1;

  Future<void> getImage() async {
    imageFile = await imagePicker.getImagefromGalery();
    notifyListeners();
  }

  void removeImage() {
    imageFile = null;
    notifyListeners();
  }

  //* =============
  //? Validator
  //* =============

  Map<String, dynamic> checkPNumber(String p1) {
    bool isValid = true;
    String errorMessage = "";

    if (p1.length < 10) {
      isValid = false;
      errorMessage = "Nomor minimal 10 digit";
    }

    _isPNumberValid = isValid;
    notifyListeners();
    return {
      "isValid": isValid,
      "errorMessage": errorMessage,
    };
  }

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

    confirmPasswordController.clear();
    _isPasswordValid = isValid;
    notifyListeners();
    return {
      "isValid": isValid,
      "errorMessage": errorMessage,
    };
  }

  Map<String, dynamic> checkCofirmPassword(String p1) {
    bool isValid = true;
    String errorMessage = "";

    if (p1 != passwordController.text) {
      isValid = false;
      errorMessage = "Password tidak sama";
    }

    _isConfirmPasswordValid = isValid;
    notifyListeners();
    return {
      "isValid": isValid,
      "errorMessage": errorMessage,
    };
  }

  Map<String, dynamic> checkValue(String p1, int code) {
    bool isValid = true;
    String errorMessage = "";

    if (p1.length < 2) {
      isValid = false;
      errorMessage = "Minimal 2 huruf";
    }

    switch (code) {
      case 0:
        _isNameValid = isValid;
        break;
      case 1:
        _isInstitutionalValid = isValid;
        break;
      case 2:
        _isPositionValid = isValid;
        break;
      case 3:
        _isPlaceValid = isValid;
        break;
      default:
        _isNameValid = isValid;
    }

    notifyListeners();
    return {
      "isValid": isValid,
      "errorMessage": errorMessage,
    };
  }

  void setGender(Gender gender) {
    this.selectedGender = gender;
    notifyListeners();
  }

  void next() {
    if (currentIndex < 3) {
      currentIndex++;
      sliderKey.currentState.next();
    } else {}
    notifyListeners();
  }

  void pref() {
    if (currentIndex > 1) {
      currentIndex--;
      sliderKey.currentState.previous();
    }
    notifyListeners();
  }

  void register() {
    // Do Auth here
    AwesomeDialog dialog = awesomeDialog.showLoadingDialog();
    Future.delayed(Duration(seconds: 3), () {
      dialog.dissmiss();
      awesomeDialog.showSuccessDialog(
        message: "Berhasil mendaftarkan akun",
        onClick: () {
          replaceAllPage(HomePage());
        },
      );
    });
  }
}
