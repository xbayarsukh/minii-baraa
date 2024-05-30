import 'package:get_storage/get_storage.dart';
import 'package:miniibaraa/core/models/token.dart';
import 'package:miniibaraa/core/models/user.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();

  final box = GetStorage();

  factory AppDatabase() {
    return _instance;
  }

  AppDatabase._internal();

  //////////////////////////////////////////////

  Future<void> saveUser(User user) async {
    await box.write('user', user.toMap());
  }

  Future<void> saveOtp(String otpCode) async {
    await box.write('otp', otpCode);
  }

  Map<String, dynamic> getUser() {
    return box.read('user');
  }

  Future<void> deleteData() async {
    await box.remove('user');
  }

  Future<void> saveUserType(int value) async {
    await box.write('userType', value);
  }

  int getUserType() {
    return box.read('userType') ?? 0;
  }

  Future<void> deleteUserType() async {
    await box.remove('userType');
  }

  Future<void> updateUser() async {}

  String getAccessToken() {
    return box.read('user')['access_token'];
  }

  String getRefreshToken() {
    return box.read('user')['refresh_token'];
  }

  String getUserPhone() {
    return box.read('user')['phone'] ?? "";
  }

  Future<void> saveAccessToken(Token token) async {
    final user = box.read('user');
    user["access_token"] = token.accessToken;
    saveUser(user);
  }

  bool isLoggedIn() {
    return box.hasData('user');
  }

  String getOtp() {
    String result = (box.read('otp'));
    return result;
  }

  Map<String, dynamic> getUserPermissions() {
    final user = box.read('user');
    return user['permissions'];
  }
}
