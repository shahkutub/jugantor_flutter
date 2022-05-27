import 'dart:async';

import 'package:get/get.dart';
import 'package:jugantor.com/routes/app_pages.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  @override
  void onInit() {
    print('called');
    Timer(Duration(seconds: 3), () {
      // if (Get.find<AuthService>().isAuth) {
         Get.offAllNamed(Routes.HOME);
      // } else {
      //   Get.offAllNamed(Routes.LOGIN);
      // }
    });
    super.onInit();
  }
}
