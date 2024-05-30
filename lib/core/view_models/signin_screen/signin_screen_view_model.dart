import 'package:flutter/material.dart';
import 'package:miniibaraa/core/view_models/base_view_model.dart';

class SigninScreenViewModel extends BaseViewModel {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController dropdownController = TextEditingController();
  final double kItemExtent = 32.0;
  final List<String> fruitNames = <String>[
    'Үйлдвэрлэгч',
    'Борлуулагч',
    'Урчууд',
  ];

  int selectedFruit = 0;

  bool isSeller = false;
  setSeller(val) {
    isSeller = val;
    notifyListeners();
  }

  setDropdownString(selectedItem) {
    selectedFruit = selectedItem;
    dropdownController.text = fruitNames[selectedItem].toString();
    notifyListeners();
  }
}
