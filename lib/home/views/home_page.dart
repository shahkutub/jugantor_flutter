import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/home/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    //homeController.get_bn_date(context);
    return Scaffold(
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

          body: Scaffold(
              appBar:AppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                title: Stack(alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      //height: 80,
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/jugantorlogo.svg',
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
                  child:  ListView(
                    children: <Widget>[

                      ListTile(
                          title: Text("Home Page"),
                          trailing: Icon(Icons.menu),
                          onTap: () {
                            Get.back();
                            homeController.selectedIndex.value = 0;
                            //_taskController.getDrawerItemWidget(0);
                          }
                      ),

                      ListTile(
                          title: Text("About Page"),
                          trailing: Icon(Icons.info),
                          onTap: () {
                            Get.back();
                            homeController.selectedIndex.value = 1;
                            //_taskController.getDrawerItemWidget(1);
                          }
                      ),

                      ListTile(
                          title: Text("Settings Page"),
                          trailing: Icon(Icons.security),
                          onTap: () {
                            Get.back();
                            homeController.selectedIndex.value = 2;
                           // _taskController.getDrawerItemWidget(2);
                          }
                      ),
                      Divider(thickness: 1.0,),
                      ListTile(
                        title: Text("Close"),
                        trailing: Icon(Icons.cancel),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ],
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