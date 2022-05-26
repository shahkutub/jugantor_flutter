import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/home/controllers/home_controller.dart';

import '../../fragments/first_fragment.dart';
import '../../fragments/second_fragment.dart';
import '../../fragments/third_fragment.dart';



class HomePage extends GetView<HomeController> {
  final HomeController _taskController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black,
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

                  Text("বৃহস্পতিবার, ২৬ মে ২০২২, ১২ জ্যৈষ্ঠ ১৪২৯ ",
                    style: TextStyle(color: Colors.white,fontSize: 12),
                    textAlign:TextAlign.center,
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
                            _getDrawerItemWidget(0);
                          }
                      ),

                      ListTile(
                          title: Text("About Page"),
                          trailing: Icon(Icons.info),
                          onTap: () {
                            _getDrawerItemWidget(1);
                          }
                      ),

                      ListTile(
                          title: Text("Settings Page"),
                          trailing: Icon(Icons.security),
                          onTap: () {
                            _getDrawerItemWidget(2);
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
                _getDrawerItemWidget(_taskController.selectedIndex.value);
              }
          )
        ),
        )
    );
  }



  _getDrawerItemWidget(int pos) {
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

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}