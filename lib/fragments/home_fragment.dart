import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';

class HomeFragment extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    Get.find<HomeController>();
    return new SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              child:Container(
                child: Center(child: Text('test'),),
                height: 190.0,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue,
                    image: DecorationImage(
                        image: new NetworkImage(
                            "https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/MDA2018_inline_03.jpg"
                        ),
                        fit: BoxFit.fill
                    )
                ),
              ),

          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.center,
            child: const Text('Fixed Height Content'),
          ),


        ],
      ),
    );
  }

}