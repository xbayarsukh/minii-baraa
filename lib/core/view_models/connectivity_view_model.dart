import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:miniibaraa/core/view_models/base_view_model.dart';

class ConnectivityProvider extends BaseViewModel {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  ConnectivityResult get connectivityResult => _connectivityResult;
  ConnectivityProvider() {
    Connectivity().onConnectivityChanged.listen((result) {
      _connectivityResult = result;
      notifyListeners();
    });
  }
}
