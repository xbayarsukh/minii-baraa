import 'package:flutter/material.dart';
import 'package:miniibaraa/core/view_models/base_view_model.dart';

class SignupScreenViewModel extends BaseViewModel {
  int counter = 0;
  String otpString = "";

  TextEditingController dropdownController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordconfirmController = TextEditingController();

  bool isHidePassword = true;
  toggleHidePassword() {
    isHidePassword = !isHidePassword;
    notifyListeners();
  }

  bool isconfirmPassword = false;
  checkPassword(value) {
    if (passwordController.text == value) {
      isconfirmPassword = true;
    } else {
      isconfirmPassword = false;
    }
    notifyListeners();
  }

  double kItemExtent = 32.0;
  int selectedFruit = 0;
  List<String> fruitNames = <String>[
    'Хэрэглэгч',
    'Үйлдвэрлэгч',
    'Борлуулагч',
    'Урчууд',
  ];

  setOtpString(value) {
    otpString = value;
    notifyListeners();
  }

  setNameControllerToString(value) {
    nameController.text = value;
    notifyListeners();
  }

  setUsernameControllerToString(value) {
    usernameController.text = value;
    notifyListeners();
  }

  setPhoneControllerToString(value) {
    phoneController.text = value;
    notifyListeners();
  }

  setDropdownString(selectedItem) {
    selectedFruit = selectedItem;
    dropdownController.text = fruitNames[selectedItem].toString();
    notifyListeners();
  }

  setPasswordControllerToString(value) {
    passwordController.text = value;
    notifyListeners();
  }
}
