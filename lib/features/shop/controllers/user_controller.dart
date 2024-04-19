import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final RxBool isLoggedIn = false.obs;

  final RxString userName = ''.obs;
  final RxString userEmail = ''.obs;

  void login(String email, String password) {
    isLoggedIn.value = true;
    userEmail.value = email;
  }

  // 用户登出方法
  void logout() {
    isLoggedIn.value = false;
    userEmail.value = '';
  }

  // 更新用户资料的方法
  void updateProfile({String? name, String? email /* 其他字段 */}) {
    if (name != null) userName.value = name;
    if (email != null) userEmail.value = email;
  }
}
