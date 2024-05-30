import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniibaraa/core/view_models/base_view_model.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:styled_widget/styled_widget.dart';

class MyInfoViewModel extends BaseViewModel {
  String dropdownText = "";
  // ignore: non_constant_identifier_names
  List<String> bank_lists = <String>[
    'Хаан банк',
    'Хас банк',
    'Худалдаа хөгжлийн банк',
    'Голомт банк',
  ];
  int selectedBank = 1;

  setDropdownString(selectedItem) {
    selectedBank = selectedItem;
    dropdownText = bank_lists[selectedItem].toString();
    notifyListeners();
  }

  void showDialog(Widget child, context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState) => Container(
          height: 300,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                child.expanded(),
                CustomElevatedButton(
                  color: const Color.fromARGB(255, 250, 108, 81),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  buttonTitle: "Сонгох",
                  textColor: Colors.white,
                ).padding(horizontal: 30, vertical: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
