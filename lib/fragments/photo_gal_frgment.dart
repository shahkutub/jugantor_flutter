
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bottom_view.dart';
class PhotoGalFragment extends StatelessWidget{

  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> _controller =
    Completer<WebViewController>();
    Get.find<HomeController>();
    double height = Get.height;
    double width = Get.width;
    // double webViewWidth = width*3;
    // double webViewheight = width*2.2;
    // print('width: '+webViewWidth.toString());
    // var now = new DateTime.now();
    // var formatter = new DateFormat('yyyy/MM/dd');
    // String formattedDate = formatter.format(now);
    // print(formattedDate);

    // homeController.vidEmbed.value = homeController.vidDataInfo.value.embed_code.toString().replaceAll('300', webViewWidth.toString());
    // homeController.vidEmbed.value = homeController.vidEmbed.value.toString().replaceAll('216', webViewheight.toString());


    return Container(
        margin: EdgeInsets.all(10),
      child:SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      homeController.selectedPageIndex.value = 0;
                      Get.back();
                      //Navigator.pop(context);
                    },
                    child:Text("প্রচ্ছদ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                  ),

                  //homeController.categoryName.value.isNotEmpty?
                  Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                     // :Text(''),

                  //Obx(() =>
                      Visibility(visible: true,child:Text("  ছবি ",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.blue),),),
                  //),

                ],
              ),
              SizedBox(height: 20,),

              Obx(() =>
                  Container(
                      margin: EdgeInsets.only(top: 5,bottom: 5,right: 0,left: 0),
                      alignment: Alignment.center,
                      child:homeController.last_photo_albumList.length > 0 ?
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          viewportFraction: 1.0,
                          autoPlay: true,
                          onPageChanged: (index, index1) {

                            // homeController.selectedPageIndex.value = 13;
                            // homeController.photoDataInfo.value = homeController.last_photo_albumList[index];
                            // homeController.get_cat_wise_photo(1,context);
                          },
                        ),
                        items: homeController.last_photo_albumList[0].images!.map((bannerData) {
                          return Builder(
                            builder: (BuildContext context) {
                              return InkWell(
                                onTap: () async {
                                  homeController.selectedPageIndex.value = 13;
                                  homeController.photoDataInfo.value = homeController.last_photo_albumList[0];
                                  homeController.get_cat_wise_photo(1,context);
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



              Row(
                children: <Widget>[

                  GestureDetector(
                    child:Container(
                      //height: 80,
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/facebook.svg',
                        height: 35, width: 35,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff4469B3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    child:Container(
                      //height: 80,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/messenger.svg',
                        height: 30, width: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff00B0ED),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),
                  GestureDetector(
                    child:Container(
                      //height: 80,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/twitter.svg',
                        height: 30, width: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff00B0ED),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    child:Container(
                      padding: EdgeInsets.all(3),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/whatsapp.svg',
                        height: 35, width: 35,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff35B94A),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),

                  SizedBox(width: 10,),
                  GestureDetector(
                    child:Container(
                      //height: 80,
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/linkedin.svg',
                        height: 40, width: 40,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff007AB9),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                color: Colors.grey,
                child: Text(homeController.vidDataInfo.value.video_cat_name.toString(),),
              ),

              Obx(() =>
                  Container(
                      margin: EdgeInsets.only(top: 5,bottom: 5,right: 0,left: 0),
                      alignment: Alignment.center,
                      child:homeController.cat_wise_vidList.length >0 ?
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
                        itemCount: homeController.cat_wise_vidList.length,
                        itemBuilder: (context, index) {
                          return  GestureDetector(
                            onTap: (){
                              // homeController.dataLoaded.value = false;
                              // homeController.newsId.value = homeController.showNewsList[index].id.toString();
                              // homeController.selectedPageIndex.value = 1;
                              // homeController.get_news_details();

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
                                              image:homeController.cat_wise_vidList[index]["cover_photo"],
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

                                    Text(homeController.cat_wise_vidList[index]["video_title"]!,
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
                      margin: EdgeInsets.only(top: 10,bottom: 5,right: 0,left: 0),
                      alignment: Alignment.center,
                      child:homeController.last_entry_newsList.length >0 ?
                      ListView.builder(
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
                      ):SizedBox()

                  ),
              ),
              SizedBox(height: 20,),
              BottomView()
            ],

          )
        ),
      ),



    );
  }

}

// WebView(
//   initialUrl: 'https://epaper.jugantor.com/2022/06/06/index.php',
//   javascriptMode: JavascriptMode.unrestricted,
//   onProgress: (int progress) {
//     print('WebView is loading (progress : $progress%)');
//   },
//
//   onWebViewCreated: (WebViewController webViewController) {
// _controller.complete(webViewController);},
//
// ),