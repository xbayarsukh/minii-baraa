import 'package:miniibaraa/core/view_models/base_view_model.dart';

class PaymentViewModel extends BaseViewModel {
  int tabIndex = 0;

  setTabIndex(index) {
    tabIndex = index;
    notifyListeners();
  }
}
