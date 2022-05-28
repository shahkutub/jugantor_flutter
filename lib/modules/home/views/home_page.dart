import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    //homeController.get_bn_date(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Color(0xff2A394D),
        title: Stack(alignment: Alignment.center,
          children: <Widget>[
            // Container(
            //   alignment: Alignment.centerLeft,
            //   child: Text('N-PMS'),),
            Container(

              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => Text(""+homeController.banglaDate.value,
                      style: TextStyle(color: Colors.white,fontSize: 12),
                      textAlign:TextAlign.center,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Text(" আজকের পত্রিকা | ই-পেপার ",
                    style: TextStyle(color: Colors.white,fontSize: 12),
                    textAlign:TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),

    ),

        body:Scaffold(
          backgroundColor: Colors.white,
          body: Scaffold(
              backgroundColor: Colors.white,
              appBar:AppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                title: Stack(alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Container(
                      //height: 80,
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(
                        'assets/images/jugantorlogo.svg',
                          height: 40, width: 130,

                      )
                    ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.search,
                            size: 30.0,
                            color: Colors.black,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              drawer: new Drawer(
                backgroundColor: Colors.white,
                  child:  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Obx(() =>
                            Container(
                                padding: EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child:GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5.0,
                                      mainAxisSpacing: 5.0,
                                      childAspectRatio: 3
                                  ),
                                  itemCount: homeController.categoryList.length,
                                  itemBuilder: (context, index) {
                                    return  GestureDetector(
                                      onTap: (){
                                        Get.back();
                                        if(homeController.categoryList[index].cat_name == "প্রচ্ছদ"){
                                          homeController.selectedIndex.value = 0;
                                        }else{
                                          homeController.selectedIndex.value = 1;
                                        }
                                      },


                                      child: Obx(() => Text(homeController.categoryList[index].cat_name,
                                        style: TextStyle(color: Colors.black,fontSize: 15, ),),
                                      ),
                                    );
                                  },
                                )
                            ),
                        ),

                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.center,
                          child: const Text('Fixed Height Content'),
                        ),


                      ],
                    ),
                  )
              ),


              body:Obx(() {
                return Container(
                  child:homeController.getDrawerItemWidget(homeController.selectedIndex.value),
                );
              }
          )
        ),
        )
    );
  }

}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}