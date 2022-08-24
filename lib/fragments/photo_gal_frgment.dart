
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
                              return
                                InkWell(
                                onTap: () async {
                                  homeController.selectedPageIndex.value = 13;
                                  homeController.photoDataInfo.value = homeController.last_photo_albumList[0];
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


              //photo ct list
              Obx(() =>
                  Container(
                      margin: EdgeInsets.only(top: 15,bottom: 0,right: 0,left: 0),
                      alignment: Alignment.center,
                      child:homeController.photo_cts_with_photo_list.length > 0 ?
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: homeController.photo_cts_with_photo_list.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child:
                            Obx(() =>
                                Container(

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Container(
                                          width: width,
                                          height: 2,
                                          color: Colors.deepPurple,
                                          //thickness: 2,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(left: 15.0),
                                            padding: const EdgeInsets.only(left: 30.0,right: 30.0,top: 5.0,bottom: 5.0),
                                            color: Colors.deepPurple,
                                            child: Text(homeController.photo_cts_with_photo_list[index].cat_name!,
                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white)
                                            )
                                        ),

                                        Container(
                                            margin: EdgeInsets.only(top: 5,bottom: 5,right: 0,left: 0),
                                            alignment: Alignment.center,
                                            child:homeController.photo_cts_with_photo_list[index].photoData!.length >0 ?
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
                                              itemCount: homeController.photo_cts_with_photo_list[index].photoData!.length,
                                              itemBuilder: (context, index2) {
                                                List<String> photos = <String>[];
                                                List<String> title = <String>[];
                                                String photoUrl = "";

                                                 //var str= homeController.photo_cts_with_photo_list[index].photoData![index2].album_photos;
                                                 var text = homeController.photo_cts_with_photo_list[index].photoData![index2].album_photos.toString();
                                                RegExp exp = new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
                                                Iterable<RegExpMatch> matches = exp.allMatches(text);
                                                photos.clear();
                                                matches.forEach((match) {
                                                  photoUrl = text.substring(match.start, match.end);
                                                  photos.add(photoUrl);
                                                  print("album_photo: "+text.substring(match.start, match.end));
                                                });


                                               //   print("album_photoList"+str!);
                                               //   var regex=RegExp("http.*?\"");
                                               //   var matches=regex.allMatches(str);
                                               //
                                               //  matches.forEach((element) {
                                               //    print('urlphoto: '+removeLastChar(element.input));
                                               //    photos.add(removeLastChar(element.input));
                                               //  });
                                               //
                                               //  // var strTitle= users[position].album_photos_title
                                               //  // var regexTitle=Regex("\".*?\"")
                                               //  // var matchesTitle=regexTitle.findAll(strTitle)
                                               //  // matchesTitle.forEach { o->
                                               //  // Log.e("valuetitle","title: "+removeLastChar(o.value).toString())
                                               //  // AppConstant.titleList.add(removeLastChar(o.value).toString())
                                               //  // }
                                               //
                                               //  print('photos[0]'+photos[0].toString());
                                               //
                                               // var strph = photos[0];
                                               //  final start = '"';
                                               //  final end = '"';
                                               //
                                               //  final startIndex = strph.indexOf(start);
                                               //  final endIndex = strph.indexOf(end);
                                               //  final result = strph.substring(startIndex + start.length, endIndex).trim();
                                               //  print('photourlresult'+result);

                                                 // matches.forEach((element) {
                                                 //   print(''+element.toString());
                                                 //
                                                 // });

                                                return  GestureDetector(
                                                  onTap: (){
                                                    // homeController.dataLoaded.value = false;
                                                    // homeController.newsId.value = homeController.showNewsList[index].id.toString();
                                                    // homeController.selectedPageIndex.value = 1;
                                                    // homeController.get_news_details();

                                                  },

                                                  child:
                                                  Obx(() =>
                                                      Container(

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
                                                                    image:photos[0].toString(),
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

                                                          Text(homeController.photo_cts_with_photo_list[index].photoData![index2].album_name.toString(),
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
 removeLastChar <String>(String str){
return removeLastChars(str, 1);
}

 removeLastChars <String> ( String str,  int chars) {
//return str.substring(0, str.length - chars)
return str.toString().substring(0, str.toString().length - chars);
}