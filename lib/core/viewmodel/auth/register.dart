part of '../viewmodels.dart';

enum Gender { Pria, Wanita }

class RegisterViewmodel extends BaseViewModel with ViewModelLifecycle {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  File imageFile;
  Gender selectedGender = Gender.Pria;

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
  bool _isPNumberValid = false;
  bool _isNameValid = false;

  bool get isSelfInformationValid => _isPNumberValid && _isNameValid && (imageFile != null);
  bool get isInstitutionalInformationValid => _isPNumberValid && _isNameValid && (imageFile != null);
  bool get isAccountInformationValid => _isPNumberValid && _isNameValid && (imageFile != null);

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

  Map<String, dynamic> checkName(String p1) {
    bool isValid = true;
    String errorMessage = "";

    if (p1.length < 2) {
      isValid = false;
      errorMessage = "Nama minimal 2 huruf";
    }

    _isNameValid = isValid;
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
