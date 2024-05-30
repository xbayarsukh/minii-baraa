import 'package:miniibaraa/config/constants/dummy_datas.dart';
import 'package:miniibaraa/core/view_models/base_view_model.dart';

class ProductScreenViewModel extends BaseViewModel {
  List filterLists = filterTypes;
  List productLists = products;

  int selectedFilter = 0;

  setFilterList(names, index) {
    selectedFilter = index;
    if (names.toLowerCase() == "all") {
      productLists = products;
    } else {
      productLists = products
          .where((element) =>
              element["type"].toLowerCase().contains(names.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
