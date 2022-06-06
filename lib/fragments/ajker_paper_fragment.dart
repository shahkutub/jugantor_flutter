import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';

class AjkerPaperFragment extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    double height = Get.height;
    double width = Get.width;



    return new Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Obx(() {
          if(homeController.dataLoaded.isTrue){
            return new SingleChildScrollView(
              // controller: homeController.scrollController.value,
                child: Container(
                  child:Column(
                    children: [
                      Container(
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
                                    Text(""+homeController.selectedCategoryName.value),

                                    GestureDetector(
                                      onTap: (){
                                        if(homeController.catListShow.value){
                                          homeController.catListShow.value = false;
                                        }else{
                                          homeController.catListShow.value = true;
                                        }

                                      },
                                      child:Container(
                                        //height: 80,
                                          alignment: Alignment.centerRight,
                                          child:homeController.catListShow.value?
                                          Icon(Icons.keyboard_arrow_up_sharp,size: 40,):
                                          Icon(Icons.keyboard_arrow_down_sharp,size: 40,)
                                      )
                                    )

                                  ],
                                ),
                            ),

                            Container(
                              //height: 80,
                                alignment: Alignment.centerRight,
                                child: Text('|  '+homeController.selectedCategoryName.value,textAlign: TextAlign.center,)
                              // child: Row(
                              //   children: [
                              //     Text('|')
                              //   ],
                              // ),
                            ),

                          ],
                        ),
                      ),

                      Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.center,
                          child:homeController.catListShow.value?
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                                childAspectRatio: 5.5
                            ),
                            itemCount: homeController.ajkert_paper_sub_categoryList.length,
                            itemBuilder: (context, index) {
                              return  GestureDetector(
                                onTap: (){

                                },

                                child: Text(homeController.ajkert_paper_sub_categoryList[index].cat_name!,
                                  style: TextStyle(color: Colors.black,fontSize: 15, ),
                                  textAlign: TextAlign.justify,
                                ),
                              );
                            },
                          ):SizedBox(height: 0,)
                      ),

                      Container(
                          margin: EdgeInsets.only(top: 0,bottom: 5),
                          alignment: Alignment.center,
                          child:ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            // Let the ListView know how many items it needs to build.
                            itemCount: homeController.category_wise_newsList!.length,
                            // Provide a builder function. This is where the magic happens.
                            // Convert each item into a widget based on the type of item it is.
                            itemBuilder: (context, index2) {
                              //final item = homeController.category_list_with_news_newsList[index].category_wise_newsList![index2];
                              //homeController.homecatId.value = homeController.showNewsList[index].id;

                              if(index2 == 0){
                                return Container(
                                  margin: EdgeInsets.only(top: 0,bottom: 5,right: 0,left: 0),
                                  height: width*.6,
                                  width: width,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      FadeInImage.assetNetwork(
                                          fit: BoxFit.fill,
                                          image:homeController.category_wise_newsList![index2].img_url!,
                                          placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                      ),
                                      Positioned(
                                        bottom: width*.2,
                                        left:width/2.5 ,
                                        child: homeController.category_wise_newsList![index2].video_dis  == 1 ?
                                        Text("") : Image.asset("assets/images/video_icon.png", height: 60, width: 60,),

                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              width: width,
                                              child:Text(
                                                homeController.category_wise_newsList![index2].title!,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              padding: EdgeInsets.all(10),
                                              color: Colors.black54,
                                            )

                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }else{
                                return Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child:   GestureDetector(
                                      onTap: (){
                                        // homeController.dataLoaded.value = false;
                                        // homeController.newsId.value = homeController.category_list_with_news_newsList[index].category_wise_newsList![index2].id.toString();
                                        // homeController.selectedIndex.value = 1;
                                        // homeController.get_news_details();
                                      },

                                      child: Obx(() =>
                                          Container(
                                            //height: ,
                                            //alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  // Container(
                                                  //   margin: EdgeInsets.only(right: 10),
                                                  //   height: 70,
                                                  //   width: 100,
                                                  //   child: Image.network(homeController.category_list_with_news_newsList[index].category_wise_newsList[index2].img_url,
                                                  //     fit: BoxFit.fill,
                                                  //   ),
                                                  //   //height: 80,
                                                  //   // width: 60,
                                                  // ),

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
                                                            image:homeController.category_wise_newsList![index2].img_url!,
                                                            placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                        ),
                                                        Positioned(
                                                          bottom: 20,
                                                          left:35,
                                                          child: homeController.category_wise_newsList![index2].video_dis  == 1 ?
                                                          Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),

                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  Flexible(child: Text(homeController.category_wise_newsList![index2].title!,
                                                    style: TextStyle(color: Colors.black,fontSize: 13,fontWeight:FontWeight.bold ),
                                                    textAlign: TextAlign.justify,
                                                  ),

                                                  ),

                                                ],
                                              )
                                            // child: Row(
                                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            //   crossAxisAlignment: CrossAxisAlignment.center,
                                            //   children: [
                                            //     Container(
                                            //       child: Image.network(homeController.category_list_with_news_newsList[index].category_wise_newsList[index2].img_url,
                                            //         fit: BoxFit.fitWidth,
                                            //         height: 70,
                                            //
                                            //       ),
                                            //       //height: 80,
                                            //       // width: 60,
                                            //     ),
                                            //
                                            //     Flexible(child: Text(homeController.category_list_with_news_newsList[index].category_wise_newsList[index2].title,
                                            //       style: TextStyle(color: Colors.black,fontSize: 14, ),),),
                                            //
                                            //   ],
                                            // )


                                          )
                                      ),

                                    )
                                );
                              }

                            },
                          )

                      ),

                      //body cat news
                      Obx(() =>
                          Container(
                              margin: EdgeInsets.only(top: 15,bottom: 0,right: 0,left: 0),
                              alignment: Alignment.center,
                              child:ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                // Let the ListView know how many items it needs to build.
                                itemCount: homeController.ajker_paper_subcategory_list_with_newsList.length,
                                // Provide a builder function. This is where the magic happens.
                                // Convert each item into a widget based on the type of item it is.
                                itemBuilder: (context, index) {
                                  //final item = homeController.ajker_paper_subcategory_list_with_newsList[index];
                                  //homeController.get_category_wise_news(homeController.home_categoryList[index].id);

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

                                        child: Obx(() =>
                                            Container(
                                                margin: EdgeInsets.only(top: 0),
                                                //height: ,
                                                //alignment: Alignment.center,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Stack(alignment: Alignment.centerLeft,
                                                      children: <Widget>[
                                                        Container(
                                                          //height: 80,
                                                          alignment: Alignment.centerLeft,
                                                          child: Flexible(child: Text(homeController.ajker_paper_subcategory_list_with_newsList[index].cat_name!,
                                                              style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)
                                                          )
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment: Alignment.centerRight,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Icon(Icons.arrow_forward_sharp,color: Colors.red,),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Divider(
                                                        color: Colors.red
                                                    ),
                                                    Obx(() =>
                                                        Container(
                                                            margin: EdgeInsets.only(top: 0,bottom: 5),
                                                            alignment: Alignment.center,
                                                            child:ListView.builder(
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              // Let the ListView know how many items it needs to build.
                                                              itemCount: homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList!.length,
                                                              // Provide a builder function. This is where the magic happens.
                                                              // Convert each item into a widget based on the type of item it is.
                                                              itemBuilder: (context, index2) {
                                                                //final item = homeController.category_list_with_news_newsList[index].category_wise_newsList![index2];
                                                                //homeController.homecatId.value = homeController.showNewsList[index].id;

                                                                if(index2 == 0){
                                                                  return Container(
                                                                    margin: EdgeInsets.only(top: 15,bottom: 5,right: 0,left: 0),
                                                                    height: width*.6,
                                                                    width: width,
                                                                    child: Stack(
                                                                      fit: StackFit.expand,
                                                                      children: [
                                                                        FadeInImage.assetNetwork(
                                                                            fit: BoxFit.fill,
                                                                            image:homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].img_url!,
                                                                            placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                                        ),
                                                                        Positioned(
                                                                          bottom: width*.2,
                                                                          left:width/2.5 ,
                                                                          child: homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].video_dis  == 1 ?
                                                                          Text("") : Image.asset("assets/images/video_icon.png", height: 60, width: 60,),

                                                                        ),
                                                                        Positioned(
                                                                          bottom: 0,
                                                                          left: 0,
                                                                          child: Column(
                                                                            children: <Widget>[
                                                                              Container(
                                                                                width: width,
                                                                                child:Text(
                                                                                  homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].title!,
                                                                                  style: TextStyle(
                                                                                      fontSize: 17,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Colors.white),
                                                                                ),
                                                                                padding: EdgeInsets.all(10),
                                                                                color: Colors.black54,
                                                                              )

                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                }else{
                                                                  return Container(
                                                                      margin: EdgeInsets.only(top: 10),
                                                                      child:   GestureDetector(
                                                                        onTap: (){
                                                                          homeController.dataLoaded.value = false;
                                                                          homeController.newsId.value = homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].id.toString();
                                                                          homeController.selectedPageIndex.value = 1;
                                                                          homeController.get_news_details();
                                                                        },

                                                                        child: Obx(() =>
                                                                            Container(
                                                                              //height: ,
                                                                              //alignment: Alignment.center,
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    // Container(
                                                                                    //   margin: EdgeInsets.only(right: 10),
                                                                                    //   height: 70,
                                                                                    //   width: 100,
                                                                                    //   child: Image.network(homeController.category_list_with_news_newsList[index].category_wise_newsList[index2].img_url,
                                                                                    //     fit: BoxFit.fill,
                                                                                    //   ),
                                                                                    //   //height: 80,
                                                                                    //   // width: 60,
                                                                                    // ),

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
                                                                                              image:homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].img_url!,
                                                                                              placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                                                          ),
                                                                                          Positioned(
                                                                                            bottom: 20,
                                                                                            left:35,
                                                                                            child: homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].video_dis  == 1 ?
                                                                                            Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),

                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),

                                                                                    Flexible(child: Text(homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].title!,
                                                                                      style: TextStyle(color: Colors.black,fontSize: 13,fontWeight:FontWeight.bold ),
                                                                                      textAlign: TextAlign.justify,
                                                                                    ),

                                                                                    ),

                                                                                  ],
                                                                                )
                                                                              // child: Row(
                                                                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              //   crossAxisAlignment: CrossAxisAlignment.center,
                                                                              //   children: [
                                                                              //     Container(
                                                                              //       child: Image.network(homeController.category_list_with_news_newsList[index].category_wise_newsList[index2].img_url,
                                                                              //         fit: BoxFit.fitWidth,
                                                                              //         height: 70,
                                                                              //
                                                                              //       ),
                                                                              //       //height: 80,
                                                                              //       // width: 60,
                                                                              //     ),
                                                                              //
                                                                              //     Flexible(child: Text(homeController.category_list_with_news_newsList[index].category_wise_newsList[index2].title,
                                                                              //       style: TextStyle(color: Colors.black,fontSize: 14, ),),),
                                                                              //
                                                                              //   ],
                                                                              // )


                                                                            )
                                                                        ),

                                                                      )
                                                                  );
                                                                }

                                                              },
                                                            )

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

                      Container(
                          margin: EdgeInsets.only(left: 0,right: 0),
                          //alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(child: homeController.CustomRadioButton("সর্বশেষ", 1,context),flex: 1,),
                              SizedBox(width: 20,),
                              Flexible(child: homeController.CustomRadioButton("সর্বাধিক পঠিত", 2,context),flex: 1,),

                            ],
                          )
                      ),
                      Obx(() =>
                          Container(
                              margin: EdgeInsets.only(top: 10,bottom: 5,right: 0,left: 0),
                              alignment: Alignment.center,
                              child:ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                // Let the ListView know how many items it needs to build.
                                itemCount: homeController.last_entry_newsList.length,
                                // Provide a builder function. This is where the magic happens.
                                // Convert each item into a widget based on the type of item it is.
                                itemBuilder: (context, index) {
                                  final item = homeController.last_entry_newsList[index];

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
                                                Flexible(child: Text(homeController.last_entry_newsList[index].title!,
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