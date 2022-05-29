import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    Get.find<SplashscreenController>();
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),

      body: Container(
        height: _size.height,
        width: _size.width,
        child: Center(
            child: SvgPicture.asset(
              'assets/images/jugantorlogo.svg',
              height: 40, width: 130,
            )
            ),

      ),
    );
  }
}
