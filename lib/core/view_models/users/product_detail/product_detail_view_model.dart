import 'package:miniibaraa/core/view_models/base_view_model.dart';

class ProductDetailViewModel extends BaseViewModel {
  String? selectedColor;
  String? selectedSize;
  int qty = 1;

  setSelected(string, type) {
    if (type == "color") {
      selectedColor = string;
    } else {
      selectedSize = string;
    }
    notifyListeners();
  }

  qtyPlus() {
    qty++;
    notifyListeners();
  }

  qtyMinus() {
    if (qty > 0) {
      qty--;
      notifyListeners();
    }
  }
}
