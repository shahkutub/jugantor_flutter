import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';

import 'bottom_view.dart';

class AjkerPaperFragment extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    double height = Get.height;
    double width = Get.width;



    return new Container(
        margin: EdgeInsets.only(left: 0,right: 0,top: 10),
        child: Obx(() {
          if(homeController.dataLoaded.isTrue){
            return new SingleChildScrollView(
               controller: homeController.scrollController.value,
                child: Container(
                  child:Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 10),
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
                                    Text(""+homeController.selectedCategoryName.value,
                                        textAlign: TextAlign.center,style: TextStyle(fontSize: 15,
                                        fontWeight: FontWeight.bold)),

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
                                child: homeController.selectedSubCategoryName.value.toString().isNotEmpty?
                                Text('| '+homeController.selectedSubCategoryName.value,
                                  textAlign: TextAlign.center,style: TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.bold),):Text('')
                            ),

                          ],
                        ),
                      ),

                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.center,
                          child:homeController.catListShow.value?
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                                childAspectRatio: 4.0
                            ),
                            itemCount: homeController.ajkert_paper_sub_categoryList.length,
                            itemBuilder: (context, index) {
                              return  GestureDetector(
                                onTap: (){
                                  homeController.catListShow.value = false;
                                  homeController.selectedSubCategoryName.value = homeController.ajkert_paper_sub_categoryList[index].cat_name!;
                                  homeController.ajker_paper_subcategory_list_with_newsList.clear();
                                  homeController.get_category_page_subcat_wise_news(homeController.ajkert_paper_sub_categoryList[index].id!);


                                  },

                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(homeController.ajkert_paper_sub_categoryList[index].cat_name!,
                                    style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              );
                            },
                          ):SizedBox(height: 0,)
                      ),

                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                          alignment: Alignment.center,
                          child:ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            // Let the ListView know how many items it needs to build.
                            itemCount: homeController.category_wise_newsList.length,
                            // Provide a builder function. This is where the magic happens.
                            // Convert each item into a widget based on the type of item it is.
                            itemBuilder: (context, index2) {
                              //final item = homeController.category_list_with_news_newsList[index].category_wise_newsList![index2];
                              //homeController.homecatId.value = homeController.showNewsList[index].id;

                              if(index2 == 0){
                                return GestureDetector(
                                  onTap: (){
                                    homeController.dataLoaded.value = false;
                                    homeController.categoryName.value = "আজকের পত্রিকা";
                                    homeController.newsId.value = homeController.category_wise_newsList[index2].id.toString();
                                    homeController.selectedPageIndex.value = 1;
                                    homeController.get_news_details();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 0,bottom: 5,right: 0,left: 0),
                                    height: width*.6,
                                    width: width,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        FadeInImage.assetNetwork(
                                            fit: BoxFit.fill,
                                            image:homeController.category_wise_newsList[index2].img_url!,
                                            placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                        ),
                                        Positioned(
                                          bottom: width*.2,
                                          left:width/2.5 ,
                                          child: homeController.category_wise_newsList[index2].video_dis  == 0 ?
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
                                                  homeController.category_wise_newsList[index2].title!,
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
                                  ),
                                );

                              }else{
                                return Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child:   GestureDetector(
                                      onTap: (){
                                        homeController.dataLoaded.value = false;
                                        homeController.categoryName.value = "আজকের পত্রিকা";
                                        homeController.newsId.value = homeController.category_wise_newsList[index2].id.toString();
                                        homeController.selectedPageIndex.value = 1;
                                        homeController.get_news_details();
                                      },

                                      child: Obx(() =>
                                          Container(

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
                                                            image:homeController.category_wise_newsList[index2].img_url!,
                                                            placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                        ),
                                                        Positioned(
                                                          bottom: 20,
                                                          left:35,
                                                          child: homeController.category_wise_newsList[index2].video_dis  == 0 ?
                                                          Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),

                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(child:
                                                  Text(homeController.category_wise_newsList[index2].title!,
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
                              }

                            },
                          )

                      ),

                      //body cat news
                      Obx(() =>
                          Container(
                              margin: EdgeInsets.only(top: 15,bottom: 0,right: 20,left: 20),
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
                                      child:Obx(() =>
                                      Container(
                                          margin: EdgeInsets.only(top: 0),
                                          //height: ,
                                          //alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [

                                              InkWell(
                                                onTap: (){

                                                  homeController.dataLoaded.value = false;
                                                  homeController.scrollController.value.animateTo(0,
                                                      duration: const Duration(seconds: 1), curve: Curves.linear);
                                                  print('clickedAjsub');
                                                  homeController.get_category_page_subcat_wise_news(homeController.ajker_paper_subcategory_list_with_newsList[index].id!);

                                                  homeController.catListShow.value = false;
                                                  homeController.selectedSubCategoryName.value = homeController.ajker_paper_subcategory_list_with_newsList[index].cat_name!;
                                                 // homeController.ajker_paper_subcategory_list_with_newsList.clear();
                                                  ///homeController.get_category_page_subcat_wise_news(homeController.ajker_paper_subcategory_list_with_newsList[index].id!);


                                                  // homeController.category_wise_newsList.clear();
                                                  // homeController.subcategory_list_with_news_newsList.clear();
                                                  // homeController.catId.value = homeController.ajker_paper_subcategory_list_with_newsList[index].id!;
                                                  // homeController.selectedSubCategoryName.value = "";
                                                  // homeController.selectedCategoryName.value = homeController.ajker_paper_subcategory_list_with_newsList[index].cat_name.toString();
                                                  // homeController.dataLoaded.value = false;
                                                  // homeController.get_sub_category(homeController.ajker_paper_subcategory_list_with_newsList[index].id!);
                                                  // //sub_category page index 2
                                                  // homeController.selectedPageIndex.value = 2;
                                                },
                                                child: Column(
                                                  children: [
                                                    Stack(alignment: Alignment.centerLeft,
                                                      children: <Widget>[
                                                        Container(
                                                          //height: 80,
                                                            alignment: Alignment.centerLeft,
                                                            //child: Flexible(
                                                            child: Text(homeController.ajker_paper_subcategory_list_with_newsList[index].cat_name!,
                                                                style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)
                                                            )
                                                          //),
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
                                                  ],
                                                ),
                                              ),


                                              Obx(() =>
                                                  Container(
                                                      margin: EdgeInsets.only(top: 0,bottom: 5),
                                                      alignment: Alignment.center,
                                                      child:ListView.builder(
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        physics: NeverScrollableScrollPhysics(),
                                                        // Let the ListView know how many items it needs to build.
                                                        itemCount: homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList!.length,
                                                        // Provide a builder function. This is where the magic happens.
                                                        // Convert each item into a widget based on the type of item it is.
                                                        itemBuilder: (context, index2) {
                                                          //final item = homeController.category_list_with_news_newsList[index].category_wise_newsList![index2];
                                                          //homeController.homecatId.value = homeController.showNewsList[index].id;

                                                          if(index2 == 0){
                                                            return GestureDetector(
                                                              onTap: (){
                                                                homeController.dataLoaded.value = false;
                                                                homeController.categoryName.value = "আজকের পত্রিকা";
                                                                homeController.newsId.value = homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].id.toString();
                                                                homeController.selectedPageIndex.value = 1;
                                                                homeController.get_news_details();
                                                              },
                                                              child: Container(
                                                                margin: EdgeInsets.only(top: 15,bottom: 5,right: 0,left: 0),
                                                                height: width*.6,
                                                                width: width,
                                                                child: Stack(
                                                                  fit: StackFit.expand,
                                                                  children: [

                                                                    Align(
                                                                      alignment: Alignment.center,
                                                                      child: FadeInImage.assetNetwork(
                                                                          fit: BoxFit.fill,
                                                                          height: width*.6,
                                                                          image:homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].img_url!,
                                                                          placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                                      ),
                                                                    ),

                                                                    Align(
                                                                      alignment: Alignment.center,
                                                                      child: homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].video_dis  == 0 ?
                                                                      Text("") : Image.asset("assets/images/video_icon.png", height: 60, width: 60,),
                                                                    ),

                                                                    Align(
                                                                      alignment: Alignment.bottomCenter,
                                                                      child: Container(
                                                                          width: width,
                                                                          padding: EdgeInsets.all(15),
                                                                          color: Colors.black54,
                                                                          child: Row(
                                                                            children: [
                                                                              Expanded(
                                                                                child:Text(
                                                                                  homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].title!+'  ',
                                                                                  style: TextStyle(
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Colors.white),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )


                                                                      ),
                                                                    ),


                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }else{
                                                            return Container(
                                                                margin: EdgeInsets.only(top: 10),
                                                                child:   GestureDetector(
                                                                  onTap: (){
                                                                    homeController.dataLoaded.value = false;
                                                                    homeController.categoryName.value = "আজকের পত্রিকা";
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
                                                                                      child: homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].video_dis  == 0 ?
                                                                                      Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),

                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),

                                                                              Flexible(child:
                                                                              Text(homeController.ajker_paper_subcategory_list_with_newsList[index].category_wise_newsList![index2].title!,
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
                                                          }

                                                        },
                                                      )

                                                  ),
                                              ),
                                            ],
                                          )
                                      ))
                                  );
                                },
                              )

                          ),
                      ),

                      //last entry mostview
                      Obx(() =>
                          Container(
                              margin: EdgeInsets.only(left: 0,right: 0),
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
                              margin: EdgeInsets.only(top: 10,bottom: 5,right: 0,left: 0),
                              alignment: Alignment.center,
                              child:ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                // Let the ListView know how many items it needs to build.
                                itemCount: homeController.last_entry_newsList.length,
                                // Provide a builder function. This is where the magic happens.
                                // Convert each item into a widget based on the type of item it is.
                                itemBuilder: (context, index) {

                                  return Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child:   GestureDetector(
                                        onTap: (){
                                          homeController.dataLoaded.value = false;
                                          homeController.newsId.value = homeController.last_entry_newsList[index].id.toString();
                                          homeController.get_news_details();
                                          homeController.scrollController.value.animateTo(0,
                                              duration: const Duration(seconds: 1), curve: Curves.linear);
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
                                                        child: homeController.last_entry_newsList[index].video_dis  == 0 ?
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

                      SizedBox(
                        height: 10,
                      ),

                      GestureDetector(
                        onTap: (){
                          homeController.all_latest_newsList.clear();
                          homeController.dataLoaded.value = false;
                          homeController.selectedPageIndex.value = 5;
                          if(homeController.button.value == 1){
                            homeController.last_most_text.value = 'সর্বশেষ সব খবর';
                            homeController.get_all_latest_news(1);
                          }else{
                            homeController.last_most_text.value = 'সর্বাধিক পঠিত';
                            homeController.get_all_most_view_news(1);
                          }

                        },
                        child:Container(
                          alignment: Alignment.centerLeft,
                          color: Color(0xff3A495E),
                          padding: EdgeInsets.all(7),
                          child:Text("সব খবর",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),

                        ),

                      ),
                      //bottom
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