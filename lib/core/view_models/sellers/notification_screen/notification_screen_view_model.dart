import 'package:miniibaraa/config/constants/dummy_datas.dart';
import 'package:miniibaraa/core/view_models/base_view_model.dart';

class NotificationScreenViewModel extends BaseViewModel {
  List notificationLists = notificationList;

  readNotification(id) {
    int index = notificationList.indexWhere((element) => element["id"] == id);
    notificationList[index]["status"] = false;
    notifyListeners();
  }
}
