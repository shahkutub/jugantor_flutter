import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';
import 'package:jugantor.com/api/api_client.dart';
import 'package:jugantor.com/api/api_manager.dart';
import 'package:jugantor.com/fragments/first_fragment.dart';
import 'package:jugantor.com/fragments/second_fragment.dart';
import 'package:jugantor.com/fragments/third_fragment.dart';

import '../../ui.dart';


class HomeController extends GetxController {

  var selectedIndex = 0.obs;
  var banglaDate = "".obs;


  @override
  void onInit() {
    get_bn_date();
    super.onInit();
  }

  Future<dynamic> get_bn_date() async {

    //Ui.showLoaderDialog(Get.context);
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.get(ApiClient.today_bn_date);
      print('today_bn_date: ${response}');
      banglaDate.value = response.toString();

      if(response != null){
        //Navigator.of(Get.context).pop();
      }


    } catch (e) {

    }
  }

  getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();

      default:
        return new Text("Error");
    }
  }



}
