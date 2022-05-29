import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';

class HomeFragment extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    double height = Get.height;
    double width = Get.width;
    Get.find<HomeController>();

    return new Container(
      child: Obx(() {
        if(homeController.dataLoaded.isTrue){
          return new SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Obx(() =>

                        Container(
                          margin: EdgeInsets.only(top: 15,bottom: 5,right: 15,left: 15),
                          height: width*.6,
                          width: width,
                          child: Center(child: Container(
                            //margin: EdgeInsets.only(top: width*.5),
                              alignment: Alignment.bottomCenter,

                              //height: 50,
                              width: width,

                              //padding: EdgeInsets.all(10),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.black54,
                                width: width,
                                child: Text(""+homeController.leadnews.value.title.toString()
                                    .toString(), style: TextStyle(color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                              )
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.blue,
                              image: DecorationImage(
                                  image: new NetworkImage(
                                    homeController.leadnews.value.img_url.toString(),
                                  ),
                                  fit: BoxFit.fill
                              )
                          ),
                        )
                    ),
                    Obx(() =>
                        Container(
                            margin: EdgeInsets.only(top: 15,bottom: 5,right: 15,left: 15),
                            alignment: Alignment.center,
                            child:GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 4
                              ),
                              itemCount: homeController.catExtraLinkList.length,
                              itemBuilder: (context, index) {
                                return  GestureDetector(
                                  onTap: (){
                                    Get.back();
                                    if(homeController.catExtraLinkList[index].cat_name == "প্রচ্ছদ"){
                                      //homeController.selectedIndex.value = 0;
                                    }else{
                                     // homeController.selectedIndex.value = 1;
                                    }
                                  },

                                  child: Obx(() => Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        //color: Colors.blue,
                                        image: DecorationImage(
                                            image: new NetworkImage(
                                              homeController.catExtraLinkList[index].cat_photo,
                                            ),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                    // decoration: BoxDecoration(
                                    //   color: Color(0xff3A495F),
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    // child: Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   crossAxisAlignment: CrossAxisAlignment.center,
                                    //   children: [
                                    //     Container(
                                    //       child: Image.network(homeController.catExtraLinkList[index].cat_photo),
                                    //       // height: 80,
                                    //       // width: 60,
                                    //     ),
                                    //
                                    //     // Text(homeController.catExtraLinkList[index].cat_name,
                                    //     //   style: TextStyle(color: Colors.white,fontSize: 15, ),),
                                    //   ],
                                    // )
                                    )
                                  ),
                                );
                              },
                            )
                        ),
                    ),

                    Obx(() =>
                        Container(
                            margin: EdgeInsets.only(top: 15,bottom: 5,right: 15,left: 15),
                            alignment: Alignment.center,
                            child:GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  //childAspectRatio: width / (height / 1.9)
                                  //childAspectRatio: 1
                              ),
                              itemCount: homeController.showNewsList.length,
                              itemBuilder: (context, index) {
                                return  GestureDetector(
                                  onTap: (){
                                    //Get.back();
                                    // if(homeController.showNewsList[index].cat_name == "প্রচ্ছদ"){
                                    //   //homeController.selectedIndex.value = 0;
                                    // }else{
                                    //   // homeController.selectedIndex.value = 1;
                                    // }
                                  },

                                  child: Obx(() => Container(
                                    //height: ,
                                    //alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Image.network(homeController.showNewsList[index].img_url,
                                          fit: BoxFit.fitWidth,
                                            height: 100,

                                          ),
                                            //height: 80,
                                           // width: 60,
                                        ),

                                        Text(homeController.showNewsList[index].title,
                                          style: TextStyle(color: Colors.black,fontSize: 14, ),),
                                      ],
                                    )
                                  )
                                  ),
                                );
                              },
                            )
                        ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 10,left: 20,right: 20),
                      //alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(child: homeController.CustomRadioButton("সর্বশেষ", 1),flex: 1,),
                          SizedBox(width: 20,),
                          Flexible(child: homeController.CustomRadioButton("সর্বাধিক পঠিত", 2),flex: 1,),

                        ],
                      )
                    ),

                    Obx(() =>
                        Container(
                            margin: EdgeInsets.only(top: 15,bottom: 5,right: 15,left: 15),
                            alignment: Alignment.center,
                            child:ListView.builder(
                                 primary: false,
                                 shrinkWrap: true,
                              // Let the ListView know how many items it needs to build.
                              itemCount: homeController.showNewsList.length,
                              // Provide a builder function. This is where the magic happens.
                              // Convert each item into a widget based on the type of item it is.
                              itemBuilder: (context, index) {
                                final item = homeController.showNewsList[index];

                                return Container(
                                  child:   GestureDetector(
                                        onTap: (){
                                          //Get.back();
                                          // if(homeController.showNewsList[index].cat_name == "প্রচ্ছদ"){
                                          //   //homeController.selectedIndex.value = 0;
                                          // }else{
                                          //   // homeController.selectedIndex.value = 1;
                                          // }
                                        },

                                        child: Obx(() => Container(
                                          //height: ,
                                          //alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Image.network(homeController.showNewsList[index].img_url,
                                                    fit: BoxFit.fitWidth,
                                                    height: 70,

                                                  ),
                                                  //height: 80,
                                                  // width: 60,
                                                ),

                                                Flexible(child: Text(homeController.showNewsList[index].title,
                                                  style: TextStyle(color: Colors.black,fontSize: 14, ),),),

                                              ],
                                            )
                                        )
                                        ),
                                      )
                                );
                              },
                            )

                            // ListView(
                            //   primary: false,
                            //   shrinkWrap: true,
                            //   children: [
                            //     Text("data"),
                            //     Text("data"),
                            //     Text("data"),
                            //     Text("data"),
                            //     Text("data"),
                            //   ],
                            // )

                            // GridView.builder(
                            //   physics: NeverScrollableScrollPhysics(),
                            //   shrinkWrap: true,
                            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            //     crossAxisCount: 1,
                            //     // crossAxisSpacing: 10.0,
                            //     // mainAxisSpacing: 10.0,
                            //     //childAspectRatio: width / (height / 1.9)
                            //     childAspectRatio: 3
                            //   ),
                            //   itemCount: homeController.showNewsList.length,
                            //   itemBuilder: (context, index) {
                            //     return  GestureDetector(
                            //       onTap: (){
                            //         //Get.back();
                            //         // if(homeController.showNewsList[index].cat_name == "প্রচ্ছদ"){
                            //         //   //homeController.selectedIndex.value = 0;
                            //         // }else{
                            //         //   // homeController.selectedIndex.value = 1;
                            //         // }
                            //       },
                            //
                            //       child: Obx(() => Container(
                            //         //height: ,
                            //         //alignment: Alignment.center,
                            //           child: Row(
                            //             mainAxisAlignment: MainAxisAlignment.center,
                            //             crossAxisAlignment: CrossAxisAlignment.center,
                            //             children: [
                            //               Container(
                            //                 child: Image.network(homeController.showNewsList[index].img_url,
                            //                   fit: BoxFit.fitWidth,
                            //                   height: 70,
                            //
                            //                 ),
                            //                 //height: 80,
                            //                 // width: 60,
                            //               ),
                            //
                            //               Text(homeController.showNewsList[index].title,
                            //                 style: TextStyle(color: Colors.black,fontSize: 14, ),),
                            //             ],
                            //           )
                            //       )
                            //       ),
                            //     );
                            //   },
                            // )
                        ),
                    ),



                    
                    
                  ],
                ),
              )

          );
        }else{
          return Center(child: CircularProgressIndicator());
        }

      })
    );


  }



}