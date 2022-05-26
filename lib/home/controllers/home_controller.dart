import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';

import '../views/home_page.dart';



class HomeController extends GetxController {

  var selectedIndex = 0.obs;

  final drawerItems = [
    new DrawerItem("Fragment 1", Icons.rss_feed),
    new DrawerItem("Fragment 2", Icons.local_pizza),
    new DrawerItem("Fragment 3", Icons.info)
  ].obs;

  @override
  void onInit() {

    super.onInit();
  }

}
