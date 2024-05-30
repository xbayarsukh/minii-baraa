import 'package:miniibaraa/config/constants/dummy_datas.dart';
import 'package:miniibaraa/core/view_models/base_view_model.dart';

class ShopScreenViewModel extends BaseViewModel {
  List shopLists = shopList;

  setStatus(id) {
    int index = shopLists.indexWhere((element) => element["id"] == id);
    shopLists[index]["status"] = !shopLists[index]["status"];
    notifyListeners();
  }
}
