import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';

import '../model/BoxListModel.dart';
import '../utils/utils.dart';
import 'bottom_view.dart';

class SobKhoborFragment extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    double height = Get.height;
    double width = Get.width;

    homeController.boxlist.clear();
    for (var i = 0; i < 50; i++) {
      if(i == 0){
        homeController.boxlist.add(BoxListModel(i, true));
      }else{
        homeController.boxlist.add(BoxListModel(i, false));
      }

      // print('dd'+boxlist[i].count.toString());
    }


    return new Container(
        margin: EdgeInsets.only(left: 0,right: 0,top: 10),
        child: Obx(() {
          if(homeController.dataLoaded.isTrue){
            return new SingleChildScrollView(
              controller: homeController.scrollController.value,

                child: Container(
                  child:Column(
                    children: [
                      //top
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: <Widget>[
                            Container(
                              //height: 80,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    GestureDetector(
                                      onTap: (){
                                        if(homeController.catListShow.value){
                                          homeController.catListShow.value = false;
                                        }else{
                                          homeController.catListShow.value = true;
                                        }

                                      },
                                      child:Text("প্রচ্ছদ",style: TextStyle(color: Colors.black,fontSize: 15),)
                                    ),

                                    Text("          "+homeController.last_most_text.value,style: TextStyle(color: Colors.black,fontSize: 15),)


                                  ],
                                ),
                            ),

                          ],
                        ),
                      ),

                      //all news
                      Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10,right: 20,left: 20),
                          alignment: Alignment.center,
                          child:ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            // Let the ListView know how many items it needs to build.
                            itemCount: homeController.all_latest_newsList.length,
                            // Provide a builder function. This is where the magic happens.
                            // Convert each item into a widget based on the type of item it is.
                            itemBuilder: (context, index) {
                              //final item = homeController.last_entry_newsList[index];

                              return Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child:   GestureDetector(
                                    onTap: (){
                                      homeController.dataLoaded.value = false;
                                      homeController.newsId.value = homeController.all_latest_newsList[index]['id'];
                                      homeController.selectedPageIndex.value = 1;
                                      homeController.get_news_details();
                                    },

                                    child: Obx(() => Container(

                                      //height: ,
                                      //alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 10),
                                                  height: 70,
                                                  width: 100,
                                                  child: Stack(
                                                    fit: StackFit.expand,
                                                    children: [
                                                      FadeInImage.assetNetwork(
                                                          height: 70,
                                                          width: 100,
                                                          fit: BoxFit.fill,
                                                          image:homeController.all_latest_newsList[index]["img_url"],
                                                          placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                      ),
                                                      Positioned(
                                                        bottom: 20,
                                                        left:35,
                                                        child: homeController.all_latest_newsList[index]["video_dis"]  == 1 ?
                                                        Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),

                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Flexible(child:
                                                Text(homeController.all_latest_newsList[index]["title"],
                                                  style: TextStyle(color: Colors.black,fontSize: 13,fontWeight:FontWeight.bold ),
                                                  textAlign: TextAlign.justify,
                                                ),

                                                ),

                                              ],
                                            ),

                                            Row(
                                              children: [
                                                Icon(Icons.access_time,size: 20,),
                                                Text(""+Utils.allNewsDateConvert(homeController.all_latest_newsList[index]["news_date"]),
                                                  style: TextStyle(color: Colors.black,fontSize: 15),
                                                  textAlign:TextAlign.center,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),


                                    )
                                    ),
                                  )
                              );
                            },
                          )

                      ),


                      Container(

                        height: 30,
                          margin: EdgeInsets.only(top: 10,bottom: 5,right: 20,left: 20),
                          alignment: Alignment.center,
                          child:ListView.builder(
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            shrinkWrap: true,
                            // Let the ListView know how many items it needs to build.
                            itemCount: homeController.boxlist.length,
                            // Provide a builder function. This is where the magic happens.
                            // Convert each item into a widget based on the type of item it is.
                            itemBuilder: (context, index) {

                              int num = index+1;
                              return GestureDetector(
                                onTap: (){
                                  for (var i = 0; i < homeController.boxlist.length; i++) {
                                    if(i == index){
                                      homeController.boxlist[i].isSelect = true;
                                    }else{
                                      homeController.boxlist[i].isSelect = false;
                                    }
                                  }
                                  homeController.get_all_latest_news(num);
                                },

                                child: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)
                                  ),
                                  child: homeController.boxlist[index].isSelect == true ?
                                  Text(num.toString(),style: TextStyle(color: Colors.red),):
                                  Text(num.toString(),style: TextStyle(color: Colors.black),)
                                ),

                              );
                            },
                          )

                      ),

                      //last entry, mostview
                      Obx(() =>
                          Container(
                              margin: EdgeInsets.only(left: 20,right: 20),
                              //alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Flexible(child:
                                  homeController.CustomRadioButton("সর্বশেষ", 1,context),
                                  //flex: 1,),
                                  SizedBox(width: 20,),
                                  //Flexible(child:
                                  homeController.CustomRadioButton("সর্বাধিক পঠিত", 2,context),
                                  // flex: 1,),

                                ],
                              )
                          ),
                      ),
                      Obx(() =>
                          Container(
                              margin: EdgeInsets.only(top: 10,bottom: 5,right: 20,left: 20),
                              alignment: Alignment.center,
                              child:ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                // Let the ListView know how many items it needs to build.
                                itemCount: homeController.last_entry_newsList.length,
                                // Provide a builder function. This is where the magic happens.
                                // Convert each item into a widget based on the type of item it is.
                                itemBuilder: (context, index) {
                                  //final item = homeController.last_entry_newsList[index];

                                  return Container(
                                      margin: EdgeInsets.only(top: 10),
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
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 10),
                                                  height: 70,
                                                  width: 100,
                                                  child: Stack(
                                                    fit: StackFit.expand,
                                                    children: [
                                                      FadeInImage.assetNetwork(
                                                          height: 70,
                                                          width: 100,
                                                          fit: BoxFit.fill,
                                                          image:homeController.last_entry_newsList[index].img_url!,
                                                          placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                      ),
                                                      Positioned(
                                                        bottom: 20,
                                                        left:35,
                                                        child: homeController.last_entry_newsList[index].video_dis  == 1 ?
                                                        Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),

                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Flexible(child:
                                                Text(homeController.last_entry_newsList[index].title!,
                                                  style: TextStyle(color: Colors.black,fontSize: 13,fontWeight:FontWeight.bold ),
                                                  textAlign: TextAlign.justify,
                                                ),

                                                ),

                                              ],
                                            )
                                        )
                                        ),
                                      )
                                  );
                                },
                              )

                          ),
                      ),
                      SizedBox(height: 20,),
                      BottomView()
                    ],
                  ),


                )

            );
          }else{
            return Center(child: CircularProgressIndicator());
          }

        })
    );

    // return new Container(
    //     child: Obx(() {
    //       if (homeController.dataLoaded.isTrue) {
    //         return new SingleChildScrollView(
    //             //controller: homeController.scrollController.value,
    //             child: Container(
    //               child: Column(
    //
    //                 children: <Widget>[
    //
    //                   Obx(() =>
    //                       Container(
    //                         margin: EdgeInsets.only(top: 15, bottom: 5, right: 20, left: 20),
    //                         child:Obx(() {
    //                           return Row(
    //                             children: [
    //                               // Text("প্রচ্ছদ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
    //                               // Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),

    //                               Obx(() =>
    //                                   Visibility(visible: true,child:Text(""+homeController.categoryName.value,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.blue),),),
    //                               ),
    //                               //Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
    //                             ],
    //                           );
    //                         })
    //
    //                       )
    //                   ),
    //
    //
    //                 ],
    //               ),
    //             )
    //
    //         );
    //       } else {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //     })
    // );
  }
}