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
  bool _isInstitutional = false;
  bool _isPosition = false;
  bool _isPlace = false;

  TextEditingController institutionalController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  bool get isInstitutionalInformationValid =>
      _isInstitutional && _isPosition && _isPlace;

  //* AccountInformation

  bool get isAccountInformationValid =>
      _isPNumberValid && _isNameValid && (imageFile != null);

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
        _isInstitutional = isValid;
        break;
      case 2:
        _isPosition = isValid;
        break;
      case 3:
        _isPlace = isValid;
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
}
