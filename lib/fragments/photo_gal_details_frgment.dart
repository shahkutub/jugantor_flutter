
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';
import 'package:photo_view/photo_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'FullScreenPhotoModal.dart';
import 'bottom_view.dart';
class PhotoGalDetailsFragment extends StatelessWidget{

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
                      //Get.back();
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

                  Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),

                  Obx(() =>
                  Visibility(visible: true,child:Text(homeController.photoDetailData.value.cat_name.toString(),style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.blue),),),
                  ),


                ],
              ),

              // Obx(() =>
              //     Visibility(visible: true,child:Text(homeController.album_name.value,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.blue),),),
              // ),

              SizedBox(height: 20,),

              Obx(() =>
                  Container(
                      margin: EdgeInsets.only(top: 5,bottom: 5,right: 0,left: 0),
                      alignment: Alignment.center,
                      child:homeController.photosAll.value.length > 0 ?
                      //Expanded(
                         // child:
                      ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: homeController.photosAll.value.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(height: 10,),
                                GestureDetector(
                                  onTap: (){
                                     homeController.bigphoto.value = homeController.photosAll.value[index];
                                    // Navigator.of(context).push(FullScreenModal());

                                     dailogBigPhoto(context,);


                                    // showDialog(
                                    //   context: context,
                                    //   builder: (context) {
                                    //     return Dialog(
                                    //       backgroundColor: Colors.white,
                                    //       insetAnimationDuration: const Duration(milliseconds: 100),
                                    //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    //       child: Container( // use container to change width and height
                                    //         height: 200,
                                    //         width: width,
                                    //         child: Column(
                                    //           children: <Widget>[
                                    //             Text('hello'),
                                    //             FlatButton(
                                    //               onPressed: () {
                                    //                 Navigator.of(context).pop();
                                    //               },
                                    //               child: new Text("OK"),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ),
                                    //     );
                                    //   },
                                    // );
                                  },
                                  child:
                                  Material(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(0),
                                    elevation: 0,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    type: MaterialType.transparency,
                                    child: CachedNetworkImage(
                                      imageUrl: homeController.photosAll.value[index],
                                      fit: BoxFit.fill,
                                      height: 200,
                                      width: width*0.92,
                                      // placeholder: (context, url) => SpinKitFadingCircle(color: Palette.blue),
                                      errorWidget: (context, url, error) => Image.asset("assets/images/jugantordefault.jpg"),
                                    ),
                                  ),

                                ),


                                Container(
                                  width: width,
                                  padding: EdgeInsets.only(top: 5,bottom: 10,left: 10,right: 10),
                                  // decoration: BoxDecoration(
                                  //     border: Border.all(color: Colors.grey)
                                  // ),
                                  child: Text(homeController.album_name.value,
                                    style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.bold ),
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                  ),
                                )

                              ],
                            );
                          })
                     // )
                          :
                      SizedBox()

                  ),
              ),


              //photo ct list
              Obx(() =>
                  Container(
                      margin: EdgeInsets.only(top: 15,bottom: 0,right: 0,left: 0),
                      alignment: Alignment.center,
                      child:homeController.photoDetailData.value.photoData!.length > 0 ?
                      Column(
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
                              child: Text(homeController.photoDetailData.value.cat_name.toString()+' -এর আরো ছবির অ্যালবাম',
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white)
                              )
                          ),

                          Container(
                              margin: EdgeInsets.only(top: 5,bottom: 5,right: 0,left: 0),
                              alignment: Alignment.center,
                              child:homeController.photoDetailData.value.photoData!.length >0 ?
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
                                itemCount: homeController.photoDetailData.value.photoData!.length,
                                itemBuilder: (context, index2) {
                                  List<String> photos = <String>[];
                                  List<String> title = <String>[];
                                  String photoUrl = "";

                                  //var str= homeController.photo_cts_with_photo_list[index].photoData![index2].album_photos;
                                  var text = homeController.photoDetailData.value.photoData![index2].album_photos.toString();
                                  RegExp exp = new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
                                  Iterable<RegExpMatch> matches = exp.allMatches(text);
                                  photos.clear();
                                  matches.forEach((match) {
                                    photoUrl = text.substring(match.start, match.end);
                                    photos.add(photoUrl);
                                    print("album_photo: "+text.substring(match.start, match.end));
                                  });

                                  return  GestureDetector(
                                    onTap: (){
                                      homeController.photosAll.clear();
                                      homeController.photosAll.value.addAll(photos);
                                      homeController.album_name.value = homeController.photoDetailData.value.photoData![index2].album_name.toString();
                                      homeController.selectedPageIndex.value = 14;
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

                                                    ],
                                                  ),

                                                ),

                                                Container(
                                                  width: width*0.92,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.grey)
                                                  ),
                                                  child: Text(homeController.photoDetailData.value.photoData![index2].album_name.toString(),
                                                    style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.bold ),
                                                    textAlign: TextAlign.justify,
                                                    maxLines: 2,
                                                  ),
                                                )

                                              ],
                                            )
                                        )
                                    ),
                                  );
                                },
                              ):SizedBox()
                          ),
                        ],
                      ):SizedBox()

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
              SizedBox(height: 20,),
              BottomView()
            ],

          )
        ),
      ),



    );
  }

  dailogBigPhoto(BuildContext context,) {
    return showDialog(
        context: context,
        builder: (context) {

          return Scaffold(
              backgroundColor: Colors.white70,
              body:
              // Center(
              //     child:
                  Container(
                   //color: Colors.white,
                    alignment: Alignment.center,
                   // color: Colors.white,
                    height: context.height,
                    child: Column(
                      children: [
                        SizedBox(height: 200,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              child: Icon(Icons.cancel_outlined,color: Colors.red,size: 40,),
                              onTap: (){
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(height: 30,),
                          ],
                        ),
                       // homeController.bigphoto.value
                        SizedBox(height: 5,),
                        SizedBox(
                           height: 300,
                            width: Get.width,
                            child: PhotoView(
                              imageProvider:NetworkImage(homeController.bigphoto.value,),
                              //initialScale: PhotoViewComputedScale.contained * 0.8,
                              initialScale: PhotoViewComputedScale.covered,
                            )
                        ),

                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 30,),
                            InkWell(
                              child:Container(
                                //height: 80,
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/images/facebook.svg',
                                  height: 30, width: 30,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xff00B0ED),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              // onTap: () async {
                              //   await SocialSharePlugin.shareToFeedFacebookLink(quote: 'text', url: 'https://flutter.dev');
                              // },


                              onTap: (){
                                FlutterShare.share(
                                    title: homeController.album_name.value,
                                    text: homeController.album_name.value,
                                    chooserTitle: homeController.album_name.value,
                                    linkUrl: homeController.bigphoto.value
                                  //text: 'Please click on attach link to show & download pdf',
                                  // filePath: controller.searchPdfPath.value,
                                  // fileType: '*/*'
                                  //chooserTitle: 'Please click on attach link to show & download pdf'
                                );
                              },
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
                              // onTap: () async {
                              //   await SocialSharePlugin.shareToTwitterLink(text: 'text', url: 'https://flutter.dev');
                              //   },

                              onTap: (){
                                FlutterShare.share(
                                    title: homeController.album_name.value,
                                    text: homeController.album_name.value,
                                    chooserTitle: homeController.album_name.value,
                                    linkUrl: homeController.bigphoto.value
                                  //text: 'Please click on attach link to show & download pdf',
                                  // filePath: controller.searchPdfPath.value,
                                  // fileType: '*/*'
                                  //chooserTitle: 'Please click on attach link to show & download pdf'
                                );
                              },
                            ),
                            SizedBox(width: 10,),
                            InkWell(
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
                              onTap: (){
                                FlutterShare.share(
                                    title: homeController.album_name.value,
                                    text: homeController.album_name.value,
                                    chooserTitle: homeController.album_name.value,
                                    linkUrl: homeController.bigphoto.value
                                  //text: 'Please click on attach link to show & download pdf',
                                  // filePath: controller.searchPdfPath.value,
                                  // fileType: '*/*'
                                  //chooserTitle: 'Please click on attach link to show & download pdf'
                                );
                              },
                            ),

                            SizedBox(width: 10,),
                            InkWell(
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
                              onTap: (){
                                FlutterShare.share(
                                    title: homeController.album_name.value,
                                    text: homeController.album_name.value,
                                    chooserTitle: homeController.album_name.value,
                                    linkUrl: homeController.bigphoto.value
                                  //text: 'Please click on attach link to show & download pdf',
                                  // filePath: controller.searchPdfPath.value,
                                  // fileType: '*/*'
                                  //chooserTitle: 'Please click on attach link to show & download pdf'
                                );
                              },
                            ),

                            SizedBox(width: 10,),
                            InkWell(
                              child:Container(
                                //height: 80,
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child:Icon(Icons.share_sharp,size: 30,color: Colors.white,),
                                decoration: BoxDecoration(
                                  color: Color(0xff00B0ED),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                              ),

                              onTap: (){
                                FlutterShare.share(
                                    title: homeController.album_name.value,
                                    text: homeController.album_name.value,
                                    chooserTitle: homeController.album_name.value,
                                    linkUrl: homeController.bigphoto.value
                                  //text: 'Please click on attach link to show & download pdf',
                                  // filePath: controller.searchPdfPath.value,
                                  // fileType: '*/*'
                                  //chooserTitle: 'Please click on attach link to show & download pdf'
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                      ],


                    ),
                  )
             // )

          );
        });
  }

}
 removeLastChar <String>(String str){
return removeLastChars(str, 1);
}

 removeLastChars <String> ( String str,  int chars) {
//return str.substring(0, str.length - chars)
return str.toString().substring(0, str.toString().length - chars);
}