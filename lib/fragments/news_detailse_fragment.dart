import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';

class NewsDetailseFragment extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    double height = Get.height;
    double width = Get.width;
    Get.find<HomeController>();


    //scrollController.offset.toString();

    return new Container(
        child: Obx(() {
          if (homeController.dataLoaded.isTrue) {
            return new SingleChildScrollView(
                controller: homeController.scrollController.value,
                child: Container(
                  child: Column(

                    children: <Widget>[

                      //Obx(() =>
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 5, right: 20, left: 20),
                            child:Row(
                              children: [
                                Text("প্রচ্ছদ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                                Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                                Visibility(visible: true,child:Text("cat name",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.blue),),),
                                Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                              ],
                            )
                          )
                      //),


                    ],
                  ),
                )

            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        })
    );
  }
}