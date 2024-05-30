import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miniibaraa/core/view_models/base_view_model.dart';

class AddProductScreenViewModel extends BaseViewModel {
  String? imagePath;
  TextEditingController nameController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  Map<String, dynamic>? product;
  List<String> sizer = [];
  List<String> colors = [];
  String category = "Ангилал";
  String subCategory = "Дэд ангилал";
  String status = "Барааны төлөв";

  // Function to open the image picker and set the selected image path
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath = pickedFile.path;
    }
    notifyListeners();
  }

  setProduct(data) {
    nameController.text = data["name"];
    category = data["category"];
    subCategory = data["subcategory"];
    status = data["type"];
    statusController.text = data["status"];
    countController.text = data["count"];
    priceController.text = data["price"];
    descriptionController.text = data["description"];
    imagePath = data["image"];

    if (data["size"] != null) {
      sizeController.text = data["size"];
      handleTextChanges(false, sizeController.text);
    } else {
      sizeController.text = "";
      sizer = [];
    }
    if (data["color"] != null) {
      colorController.text = data["color"];
      handleTextChanges(true, colorController.text);
    } else {
      colorController.text = "";
      colors = [];
    }

    notifyListeners();
  }

  void handleTextChanges(tokens, value) {
    final text = value.replaceAll(RegExp(r'\s+'), ' ');
    final splitTokens = text.split(' ');
    if (tokens) {
      colors = splitTokens;
    } else {
      sizer = splitTokens;
    }

    notifyListeners();
  }
}
