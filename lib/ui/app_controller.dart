import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wallet/ui/app.dart';

class AppController extends GetxController {
  GetStorage _storage = GetStorage();

  @override
  void onReady() async {
    await Future.delayed(Duration(seconds: 2));
    authorized();
    // String token = _storage.read('token');
    // if (token == null || token.isEmpty) {
    //   unauthorized();
    // } else {
    //   authorized();
    // }
  }

  authorized() {
    Get.offAndToNamed(Routes.main);
  }

  unauthorized() {
    Get.offAndToNamed(Routes.login);
  }
}
