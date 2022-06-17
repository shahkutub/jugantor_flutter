import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:group_button/group_button.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';
import 'package:jugantor.com/utils/loaders/color_loader_5.dart';
import 'package:jugantor.com/utils/loaders/dot_type.dart';
import 'package:group_radio_button/group_radio_button.dart';

class HomeFragment extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    double height = Get.height;
    double width = Get.width;
    //Get.find<HomeController>();



    homeController.scrollController.value.addListener(() { //listener
      print('scroll'+homeController.scrollController.value.offset.toString());
      if(homeController.scrollController.value.offset > 500){
        // homeController.home_categoryList.clear();
        // homeController.category_list_with_news_newsList.clear();
        if(homeController.homecatApiCall.value == false){
          if(homeController.home_categoryList.length == 0){
            // homeController.homecatApiCall.value = true;
            // homeController.get_home_category();
          }
        }


        //homeController.get_last_entry_news1();
      }
      if(homeController.scrollController.value.offset > 1000){
        // homeController.home_categoryList.clear();
        // homeController.category_list_with_news_newsList.clear();
        if(homeController.last_photo_albumList.length == 0){
          // homeController.last_online_poll();
          // homeController.get_last_photo_album();
          // homeController.get_last_three_videos();
        }

        //homeController.get_last_entry_news1();
      }


    });




    return new Container(
      child: Obx(() {
        if(homeController.dataLoaded.isTrue){
          return new SingleChildScrollView(
              controller: homeController.scrollController.value,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Obx(() =>
                    GestureDetector(
                      onTap: (){
                        homeController.dataLoaded.value = false;
                        homeController.newsId.value = homeController.leadnews.value.id.toString();
                        homeController.get_news_details();
                        homeController.selectedPageIndex.value = 1;

                      },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 15,bottom: 5,right: 20,left: 20),
                      height: width*.6,
                      width: width,
                      child: homeController.leadnews.value != null?
                      Stack(
                        //fit: StackFit.expand,
                        children: [

                          Align(
                            alignment: Alignment.center,
                            child: FadeInImage.assetNetwork(
                                fit: BoxFit.fill,
                                height: width*.6,
                                image:homeController.leadnews.value.img_url!,
                                placeholder:"assets/images/jugantordefault.jpg"
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,
                            child: homeController.leadnews.value.video_dis  == 0 ?
                            Text("") : Image.asset("assets/images/video_icon.png", height: 60, width: 60,),
                          ),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: width,
                              padding: EdgeInsets.all(15),
                              color: Colors.black54,
                              child: Flexible(
                                child:Text(
                                  homeController.leadnews.value.title!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ):SizedBox()

                    )
                  ),
                    ),
                    Obx(() =>
                        Container(
                            margin: EdgeInsets.only(top: 15,bottom: 5,right: 20,left: 20),
                            alignment: Alignment.center,
                            child:homeController.catExtraLinkList.length > 0 ?
                            GridView.builder(
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
                                    homeController.selectedPageIndex.value = 2;
                                    homeController.selectedCategoryName.value = homeController.catExtraLinkList[index].parent_cat_name!;
                                    homeController.selectedSubCategoryName.value = homeController.catExtraLinkList[index].cat_name!;
                                    homeController.catListShow.value = false;
                                    homeController.get_sub_categoryListOnly(homeController.catExtraLinkList[index].parent_cat_id!);
                                    homeController.get_category_page_subcat_wise_news(homeController.catExtraLinkList[index].cat_id!);
                                  },

                                  child: Obx(() => Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        //color: Colors.blue,
                                        image: DecorationImage(
                                            image: new NetworkImage(
                                              homeController.catExtraLinkList[index].cat_photo!,
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
                            ):SizedBox()
                        ),
                    ),

                    

                    //show news
                    Obx(() =>
                        Container(
                            margin: EdgeInsets.only(top: 15,bottom: 5,right: 20,left: 20),
                            alignment: Alignment.center,
                            child:homeController.showNewsList.length >0 ?
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15.0,
                                  mainAxisSpacing: 10.0,
                                  //childAspectRatio: width / (height / 1.9)
                                  //childAspectRatio: 1
                              ),
                              itemCount: homeController.showNewsList.length,
                              itemBuilder: (context, index) {
                                return  GestureDetector(
                                  onTap: (){
                                    homeController.dataLoaded.value = false;
                                    homeController.newsId.value = homeController.showNewsList[index].id.toString();
                                    homeController.selectedPageIndex.value = 1;
                                    homeController.get_news_details();

                                  },

                                  child: Obx(() => Container(

                                    //height: ,
                                    //alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Stack(
                                           // fit: StackFit.expand,
                                            children: [
                                                  FadeInImage.assetNetwork(
                                                  height: height * 0.12,
                                                  width: width*0.92,
                                                  fit: BoxFit.fill,
                                                  image:homeController.showNewsList[index].img_url!,
                                                  placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                              ),

                                              // Positioned(
                                              //   bottom: 10,
                                              //   left:10,
                                              //   child: homeController.showNewsList[index].video_dis  == 0 ?
                                              //   Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),
                                              //
                                              // ),

                                            ],
                                          ),

                                        ),

                                        Text(homeController.showNewsList[index].title!,
                                          style: TextStyle(color: Colors.black,fontSize: 13,fontWeight:FontWeight.bold ),
                                          textAlign: TextAlign.justify,
                                          maxLines: 2,
                                        ),
                                      ],
                                    )
                                  )
                                  ),
                                );
                              },
                            ):SizedBox()
                        ),
                    ),

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
                            margin: EdgeInsets.only(top: 10,bottom: 5,right: 20,left: 20),
                            alignment: Alignment.center,
                            child:homeController.last_entry_newsList.length >0 ?
                            ListView.builder(
                                 primary: false,
                                 shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
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
                                          homeController.dataLoaded.value = false;
                                          homeController.newsId.value = homeController.last_entry_newsList[index].id.toString();
                                          homeController.selectedPageIndex.value = 1;
                                          homeController.get_news_details();
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
                                                Flexible(
                                                    child:Text(homeController.last_entry_newsList[index].title!,
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
                            ):SizedBox()

                        ),
                    ),

                   // body cat news
                    Obx(() =>
                        Container(
                            margin: EdgeInsets.only(top: 15,bottom: 0,right: 20,left: 20),
                            alignment: Alignment.center,
                            child:homeController.category_list_with_news_newsList.length > 0 ?
                            ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              // Let the ListView know how many items it needs to build.
                              itemCount: homeController.category_list_with_news_newsList.length,
                              // Provide a builder function. This is where the magic happens.
                              // Convert each item into a widget based on the type of item it is.
                              itemBuilder: (context, index) {
                                //final item = homeController.category_list_with_news_newsList[index];
                                //homeController.get_category_wise_news(homeController.home_categoryList[index].id);

                                return Container(
                                    child: Obx(() =>
                                    Container(
                                        margin: EdgeInsets.only(top: 20),
                                        //height: ,
                                        //alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                if(homeController.category_list_with_news_newsList[index].cat_name == "সারাদেশ"){

                                                  homeController.subcategory_list_with_news_newsList.clear();
                                                  homeController.selectedCategoryName.value = "সারাদেশ";
                                                  homeController.selectedSubCategoryName.value = '';
                                                  homeController.dataLoaded.value = false;
                                                  //সারাদেশ page index 7
                                                  homeController.selectedPageIndex.value = 7;
                                                  homeController.get_saradesh_top_news();
                                                  homeController.get_division();

                                                }else{

                                                  homeController.subcategory_list_with_news_newsList.clear();
                                                  homeController.catId.value = homeController.category_list_with_news_newsList[index].id!;
                                                  homeController.selectedSubCategoryName.value = '';
                                                  homeController.selectedCategoryName.value = homeController.category_list_with_news_newsList[index].cat_name.toString();
                                                  homeController.dataLoaded.value = false;
                                                  homeController.get_sub_category(homeController.category_list_with_news_newsList[index].id!);
                                                  //sub_category page index 2
                                                  homeController.selectedPageIndex.value = 2;
                                                }
                                              },
                                              child:Stack(alignment: Alignment.centerLeft,
                                                children: <Widget>[
                                                  Container(
                                                    //height: 80,
                                                    alignment: Alignment.centerLeft,
                                                    //child:
                                                    //Flexible(
                                                        child: Text(homeController.category_list_with_news_newsList[index].cat_name!,
                                                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)
                                                    )
                                                    ),
                                                  //),
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
                                                      physics: NeverScrollableScrollPhysics(),
                                                      // Let the ListView know how many items it needs to build.
                                                      itemCount: homeController.category_list_with_news_newsList[index].category_wise_newsList!.length,
                                                      // Provide a builder function. This is where the magic happens.
                                                      // Convert each item into a widget based on the type of item it is.
                                                      itemBuilder: (context, index2) {
                                                        //final item = homeController.category_list_with_news_newsList[index].category_wise_newsList![index2];
                                                        //homeController.homecatId.value = homeController.showNewsList[index].id;

                                                        if(index2 == 0){
                                                          return GestureDetector(
                                                            onTap: (){
                                                              homeController.dataLoaded.value = false;
                                                              homeController.newsId.value = homeController.category_list_with_news_newsList[index].category_wise_newsList![index2].id.toString();
                                                              homeController.selectedPageIndex.value = 1;
                                                              homeController.get_news_details();
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets.only(top: 15,bottom: 5,right: 0,left: 0),
                                                              height: width*.6,
                                                              width: width,
                                                              child: Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment: Alignment.center,
                                                                    child: FadeInImage.assetNetwork(
                                                                        fit: BoxFit.fill,
                                                                        height: width*.6,
                                                                        image:homeController.category_list_with_news_newsList[index].category_wise_newsList![index2].img_url!,
                                                                        placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                                    ),
                                                                  ),

                                                                  Align(
                                                                    alignment: Alignment.center,
                                                                    child: homeController.category_list_with_news_newsList[index].category_wise_newsList![index2].video_dis  == 1 ?
                                                                      Text("") : Image.asset("assets/images/video_icon.png", height: 60, width: 60,),
                                                                  ),

                                                                  Align(
                                                                    alignment: Alignment.bottomCenter,
                                                                    child: Container(
                                                                      width: width,
                                                                      padding: EdgeInsets.all(15),
                                                                      color: Colors.black54,
                                                                      child: Flexible(
                                                                                child:Text(
                                                                                  homeController.category_list_with_news_newsList[index].category_wise_newsList![index2].title!+'  ',
                                                                                  style: TextStyle(
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Colors.white),
                                                                                ),
                                                                              ),
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
                                                                  homeController.newsId.value = homeController.category_list_with_news_newsList[index].category_wise_newsList![index2].id.toString();
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
                                                                                      image:homeController.category_list_with_news_newsList[index].category_wise_newsList![index2].img_url!,
                                                                                      placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                                                  ),
                                                                                  Positioned(
                                                                                    bottom: 20,
                                                                                    left:35,
                                                                                    child: homeController.category_list_with_news_newsList[index].category_wise_newsList![index2].video_dis  == 1 ?
                                                                                    Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),

                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),

                                                                            Flexible(child:
                                                                            Text(homeController.category_list_with_news_newsList[index].category_wise_newsList![index2].title!,
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

                                );
                              },
                            ):SizedBox()

                        ),
                    ),

                    //photo gallery
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                      child: Column(
                        children: [
                          Stack(alignment: Alignment.centerLeft,
                            children: <Widget>[
                              Container(
                                //height: 80,
                                alignment: Alignment.centerLeft,
                               // child: Flexible(
                                    child: Text('ফটো গ্যালারি',
                                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)
                                )
                               // ),
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
                            margin: EdgeInsets.only(top: 5,bottom: 5,right: 15,left: 15),
                            alignment: Alignment.center,
                            child:homeController.last_photo_albumList.length > 0 ?
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 200,
                                viewportFraction: 1.0,
                                autoPlay: true,
                                onPageChanged: (index, index1) {
                                  // setState(
                                  //       () {
                                  //     _current = index;
                                  //   },
                                  // );
                                },
                              ),
                              items: homeController.last_photo_albumList[0].images!.map((bannerData) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return InkWell(
                                      onTap: () async {
                                        //await launch(bannerData.link!);
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Stack(
                                                  children: <Widget>[
                                                    Material(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(0),
                                                      elevation: 0,
                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                      type: MaterialType.transparency,
                                                      child: CachedNetworkImage(
                                                        imageUrl: bannerData,
                                                        fit: BoxFit.fill,
                                                        height: 200,
                                                        width: width*0.92,
                                                       // placeholder: (context, url) => SpinKitFadingCircle(color: Palette.blue),
                                                        errorWidget: (context, url, error) => Image.asset("assets/images/jugantordefault.jpg"),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),

                                        ],
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ):SizedBox()

                        ),
                    ),

                    //ভিডিও gallery
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                      child: Column(
                        children: [
                          Stack(alignment: Alignment.centerLeft,
                            children: <Widget>[
                              Container(
                                //height: 80,
                                alignment: Alignment.centerLeft,
                                //child: Flexible(
                                    child: Text('ভিডিও গ্যালারি',
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
                          margin: EdgeInsets.only(top: 0,bottom: 5,right: 15,left: 15),
                          alignment: Alignment.center,
                            child:homeController.last_VidListList.length > 0?
                            ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              // Let the ListView know how many items it needs to build.
                              itemCount: homeController.last_VidListList.length,
                              // Provide a builder function. This is where the magic happens.
                              // Convert each item into a widget based on the type of item it is.
                              itemBuilder: (context, index2) {
                                //final item = homeController.category_list_with_news_newsList[index].category_wise_newsList![index2];
                                //homeController.homecatId.value = homeController.showNewsList[index].id;

                                print('Embed:'+homeController.last_VidListList[index2].embed_code.toString().replaceAll('300px', '600px'));
                                if(index2 == 0){
                                  return
                                  GestureDetector(
                                    onTap: (){
                                      homeController.selectedPageIndex.value = 11;
                                      homeController.vidDataInfo.value = homeController.last_VidListList[index2];
                                      homeController.get_cat_wise_video(1,context);
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
                                              image:homeController.last_VidListList[index2].cover_photo!,
                                              placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                          ),
                                          Positioned(
                                            bottom: width*.2,
                                            left:width/2.5 ,
                                            child:Image.asset("assets/images/video_icon.png", height: 60, width: 60,),

                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  width: width,
                                                  child:Text(
                                                    homeController.last_VidListList[index2].video_title!,
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
                                          homeController.selectedPageIndex.value = 11;
                                          homeController.vidDataInfo.value = homeController.last_VidListList[index2];
                                          homeController.get_cat_wise_video(1,context);
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
                                                              image:homeController.last_VidListList[index2].cover_photo!,
                                                              placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                          ),
                                                          Positioned(
                                                            bottom: 20,
                                                            left:35,
                                                            child: Image.asset("assets/images/video_icon.png", height: 30, width: 30,),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    Flexible(child:
                                                    Text(homeController.last_VidListList[index2].video_title!,
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
                            ):SizedBox()
                        ),
                    ),

                    //e paper
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      //padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey)
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20,),
                          Image.asset("assets/images/img_epaper.png"),
                          SizedBox(height: 20,),
                          FadeInImage.assetNetwork(
                            width: width,
                              fit: BoxFit.fill,
                              image:'https://epaper.jugantor.com/'+homeController.currentDateEng.value+'/1.jpg',
                              placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                          ),
                        ],
                      ),
                      width: width,

                    ),

                    //online poll
                    Container(

                      margin: const EdgeInsets.all(20.0),
                      //padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                        borderRadius:BorderRadius.circular(10),
                      ),
                      width: width,
                      child: homeController.last_online_pollResponse.value != null?
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,

                            decoration: BoxDecoration(
                              color: Colors.orange,
                              //border: Border.all(color: Colors.orange),
                              borderRadius:BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              'অনলাইন জরিপ',style: TextStyle(
                              color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  homeController.last_online_pollResponse.value.ques!
                                  ,style: TextStyle(
                                    color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold
                                ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Transform.scale(
                                      scale: 1.5,
                                      child:  Radio(
                                        value: 1,
                                        groupValue: homeController.id.value,
                                        onChanged: (val) {
                                          homeController.radioButtonItem.value = 'হ্যাঁ';
                                          homeController.id.value = 1;
                                        },
                                        toggleable: true,
                                      ),
                                    ),

                                    Text(
                                      'হ্যাঁ',
                                      style: new TextStyle(fontSize: 17.0),
                                    ),

                                    Transform.scale(
                                      scale: 1.5,
                                      child:Radio(
                                        value: 2,
                                        groupValue: homeController.id.value,
                                        onChanged: (val) {
                                          homeController.radioButtonItem.value = 'না';
                                          homeController.id.value = 2;
                                        },
                                      ),
                                    ),

                                    Text(
                                      'না',
                                      style: new TextStyle(
                                        fontSize: 17.0,
                                      ),
                                    ),

                                    Transform.scale(
                                      scale: 1.5,
                                      child: Radio(
                                        value: 3,
                                        groupValue: homeController.id.value,
                                        onChanged: (val) {
                                          homeController.radioButtonItem.value = 'মন্তব্য নেই';
                                          homeController.id.value = 3;
                                        },
                                      ),
                                    ),

                                    Text(
                                      'মন্তব্য নেই',
                                      style: new TextStyle(fontSize: 17.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20,),
                          Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              child:Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 100,right: 100),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green
                                ),
                                child: Text('মতামত দিন',style: TextStyle(color: Colors.white),),
                              ),
                            ),

                          ),


                          // GroupButton(
                          //
                          //   onSelected: (value, index, isSelected) {
                          //
                          //   },
                          //   buttons: ['হ্যাঁ','না','মন্তব্য নেই'],
                          //   isRadio: true,
                          //
                          //   buttonBuilder: (selected, date, context) {
                          //     return Text('${date}');
                          //   },
                          // ),

                            //onSelected: (index, isSelected) => print('$index button is selected'),
                           // buttons: ["12:00", "13:00", "14:30"],


                          // RadioGroup<String>.builder(
                          //   direction: Axis.horizontal,
                          //   groupValue: homeController.verticalGroupValue.value,
                          //   horizontalAlignment: MainAxisAlignment.spaceAround,
                          //   onChanged: (value){
                          //     homeController.verticalGroupValue.value = value!;
                          //   } ,
                          //   items: ["1", "2", "3"],
                          //   textStyle: TextStyle(
                          //       fontSize: 15,
                          //       color: Colors.blue
                          //   ),
                          //   itemBuilder: (item) => RadioButtonBuilder(
                          //     item,
                          //
                          //   ),
                          // ),

                          SizedBox(height: 20,),
                          // Row(children: <Widget>[
                          //   Expanded(
                          //     child: ListTile(
                          //       title: const Text('Lafayette'),
                          //       leading: Radio<SingingCharacter>(
                          //         value: SingingCharacter.lafayette,
                          //         groupValue: homeController.character.value,
                          //         onChanged: (SingingCharacter? value) {
                          //           homeController.character.value = value!;
                          //         },
                          //       ),),
                          //   ),
                          //   Expanded(
                          //     child: ListTile(
                          //       title: const Text('Thomas Jefferson'),
                          //       leading: Radio<SingingCharacter>(
                          //         value: SingingCharacter.jefferson,
                          //         groupValue: homeController.character.value,
                          //         onChanged: (SingingCharacter? value) {
                          //           homeController.character.value = value!;
                          //         },
                          //       ),
                          //     ),
                          //   ),
                          //
                          // ],
                          // )
                        ],
                      ):SizedBox()
                    ),

                    //bottom 
                    // Image.asset('assets/images/jugantorbottom.png',
                    //   width: width,
                    //   //height: 200,
                    // )
                    Container(

                      child:Text('সম্পাদক : সাইফুল আলম, প্রকাশক : সালমা ইসলাম প্রকাশক কর্তৃক ক-২৪৪ প্রগতি সরণি, কুড়িল (বিশ্বরোড), '
                          'বারিধারা, ঢাকা-১২২৯ থেকে প্রকাশিত এবং যমুনা প্রিন্টিং এন্ড পাবলিশিং লিঃ থেকে মুদ্রিত। ''পিএবিএক্স : ৯৮২৪০৫৪-৬১, '
                          'রিপোর্টিং : ৯৮২৩০৭৩, বিজ্ঞাপন : ৯৮২৪০৬২, ফ্যাক্স : ৯৮২৪০৬৩, '
                          'সার্কুলেশন : ৯৮২৪০৭২। ফ্যাক্স : ৯৮২৪০৬৬'
                          'E-mail: jugantor.mail@gmail.com',style: TextStyle(fontSize: 13,color: Colors.white),
                        textAlign: TextAlign.justify,),
                      width: width,
                      padding: EdgeInsets.all(10),
                      color: Colors.black,
                      alignment: Alignment.center,
                    ),


                  ],
                ),
              )

          );
        }else{
          return Center(

              //child: CircularProgressIndicator()
              //child: _sendingMsgProgressBar.show(context)
              child:ColorLoader5(
                dotOneColor: Colors.red,
                dotTwoColor: Colors.blue,
                dotThreeColor: Colors.green,
                dotType: DotType.circle,
                duration: Duration(seconds: 1),
              )

          );
        }

      })
    );


  }

}

class TopButtonModel {
  String? buttonLable;
  bool? isOnTp;
  TopButtonModel({this.buttonLable, this.isOnTp});
}

enum SingingCharacter { lafayette, jefferson }
