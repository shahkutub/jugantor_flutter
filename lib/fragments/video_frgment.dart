
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bottom_view.dart';
class VideoFragment extends StatelessWidget{

    final HomeController homeController = Get.put(HomeController());
    @override
    Widget build(BuildContext context) {
        final Completer<WebViewController> _controller =
        Completer<WebViewController>();
        Get.find<HomeController>();
        double height = Get.height;
        double width = Get.width;
        double webViewWidth = width*3;
        double webViewheight = width*2.2;
        print('width: '+webViewWidth.toString());


        String photoUrl = "";

        var text = homeController.vidDataInfo.value.embed_code.toString();
        RegExp exp = new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
        Iterable<RegExpMatch> matches = exp.allMatches(text);
        matches.forEach((match) {
            photoUrl = text.substring(match.start, match.end);
        });


        return Container(
            margin: EdgeInsets.all(20),
            child:SingleChildScrollView(
                child: Container(
                    child: Column(

                        children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    //Obx(() =>
                                    //     Container(
                                    //       //margin: EdgeInsets.only(top: 20),
                                    //       height: width-125,
                                    //       width: width-40,
                                    //       color: Colors.red,
                                    //       child: WebView(
                                    //         //initialUrl: Uri.dataFromString('<html><body>'+homeController.vidDataInfo.value.embed_code.toString()+'</body></html>', mimeType: 'text/html').toString(),
                                    //
                                    //         initialUrl: Uri.dataFromString('<html><body><iframe width= '+webViewWidth.toString()+'px height='+webViewheight.toString()+' '
                                    //             'src='+photoUrl.toString()+' title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen><\/iframe></body></html>', mimeType: 'text/html').toString(),
                                    //
                                    //         javascriptMode: JavascriptMode.unrestricted,
                                    //         onWebViewCreated: (WebViewController webViewController) {
                                    //           _controller.complete(webViewController);},
                                    //       ),
                                    //
                                    //     )
                                    //)

                                ],
                            ),
                            SizedBox(height: 20,),
                            // share icons
                            // Row(
                            //   children: <Widget>[
                            //
                            //     GestureDetector(
                            //       child:Container(
                            //         //height: 80,
                            //         alignment: Alignment.center,
                            //         child: SvgPicture.asset(
                            //           'assets/images/facebook.svg',
                            //           height: 35, width: 35,
                            //         ),
                            //         decoration: BoxDecoration(
                            //           color: Color(0xff4469B3),
                            //           borderRadius: BorderRadius.all(Radius.circular(20)),
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(width: 10,),
                            //     GestureDetector(
                            //       child:Container(
                            //         //height: 80,
                            //         padding: EdgeInsets.all(5),
                            //         alignment: Alignment.center,
                            //         child: SvgPicture.asset(
                            //           'assets/images/messenger.svg',
                            //           height: 30, width: 30,
                            //         ),
                            //         decoration: BoxDecoration(
                            //           color: Color(0xff00B0ED),
                            //           borderRadius: BorderRadius.all(Radius.circular(20)),
                            //         ),
                            //       ),
                            //     ),
                            //
                            //     SizedBox(width: 10,),
                            //     GestureDetector(
                            //       child:Container(
                            //         //height: 80,
                            //         padding: EdgeInsets.all(5),
                            //         alignment: Alignment.center,
                            //         child: SvgPicture.asset(
                            //           'assets/images/twitter.svg',
                            //           height: 30, width: 30,
                            //         ),
                            //         decoration: BoxDecoration(
                            //           color: Color(0xff00B0ED),
                            //           borderRadius: BorderRadius.all(Radius.circular(20)),
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(width: 10,),
                            //     GestureDetector(
                            //       child:Container(
                            //         padding: EdgeInsets.all(3),
                            //         alignment: Alignment.center,
                            //         child: SvgPicture.asset(
                            //           'assets/images/whatsapp.svg',
                            //           height: 35, width: 35,
                            //         ),
                            //         decoration: BoxDecoration(
                            //           color: Color(0xff35B94A),
                            //           borderRadius: BorderRadius.all(Radius.circular(20)),
                            //         ),
                            //       ),
                            //     ),
                            //
                            //     SizedBox(width: 10,),
                            //     GestureDetector(
                            //       child:Container(
                            //         //height: 80,
                            //         alignment: Alignment.center,
                            //         child: SvgPicture.asset(
                            //           'assets/images/linkedin.svg',
                            //           height: 40, width: 40,
                            //         ),
                            //         decoration: BoxDecoration(
                            //           color: Color(0xff007AB9),
                            //           borderRadius: BorderRadius.all(Radius.circular(20)),
                            //         ),
                            //       ),
                            //     ),
                            //
                            //   ],
                            // ),
                            Row(
                                children: <Widget>[
                                    GestureDetector(
                                        onTap: (){
                                            homeController.selectedPageIndex.value = 0;
                                            // Get.back();
                                            //Navigator.pop(context);
                                        },
                                        child:Text("প্রচ্ছদ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                                    ),

                                    //homeController.categoryName.value.isNotEmpty?
                                    Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                                    // :Text(''),

                                    //Obx(() =>
                                    Visibility(visible: true,child:Text("  ভিডিও ",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.blue),),),
                                    //),


                                ],
                            ),

                            SizedBox(height: 20,),


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
                                            child: Text('সর্বশেষ ভিডিও',
                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white)
                                            )
                                        ),
                                    ],
                                ),
                            ),

                            Obx(() =>
                                Container(
                                    margin: EdgeInsets.only(top: 5,bottom: 5,right: 0,left: 0),
                                    alignment: Alignment.center,
                                    child:homeController.latest_VidListList.length >0 ?
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
                                        itemCount: homeController.latest_VidListList.length,
                                        itemBuilder: (context, index2) {

                                            return  GestureDetector(
                                                onTap: (){
                                                    homeController.vidDataInfo.value = homeController.latest_VidListList![index2];
                                                    homeController.get_cat_wise_video(homeController.latest_VidListList[index2].video_cat_id!,context);
                                                    homeController.selectedPageIndex.value = 16;
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
                                                                            Align(
                                                                                alignment: Alignment.center,
                                                                                child: FadeInImage.assetNetwork(
                                                                                    height: height * 0.12,
                                                                                    width: width*0.92,
                                                                                    fit: BoxFit.fill,
                                                                                    image:homeController.latest_VidListList![index2].cover_photo.toString(),
                                                                                    placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                                                ),),


                                                                            Positioned(
                                                                                bottom: 30,
                                                                                left:50,
                                                                                child: Image.asset("assets/images/video_icon.png", height: 50, width: 50,),

                                                                            ),
                                                                            // Align(
                                                                            //   alignment: Alignment.center,
                                                                            //   child: Image.asset("assets/images/video_icon.png", height: 40, width: 40,),
                                                                            // ),

                                                                        ],
                                                                    ),

                                                                ),

                                                                Container(
                                                                    width: width*0.92,
                                                                    padding: EdgeInsets.all(10),
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(color: Colors.grey)
                                                                    ),
                                                                    child: Text(homeController.latest_VidListList![index2].video_title.toString(),
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
                            ),


                            SizedBox(height: 20,),

                            Obx(() =>
                                Container(
                                    margin: EdgeInsets.only(top: 15,bottom: 0,right: 0,left: 0),
                                    alignment: Alignment.center,
                                    child:homeController.vid_cts_with_vid_list.length > 0 ?
                                    ListView.builder(
                                        primary: false,
                                        shrinkWrap: true,
                                        itemCount: homeController.vid_cts_with_vid_list.length,
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
                                                                    child: Text(homeController.vid_cts_with_vid_list[index].cat_name!,
                                                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white)
                                                                    )
                                                                ),

                                                                Container(
                                                                    margin: EdgeInsets.only(top: 5,bottom: 5,right: 0,left: 0),
                                                                    alignment: Alignment.center,
                                                                    child:homeController.vid_cts_with_vid_list[index].photoData!.length >0 ?
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
                                                                        itemCount: homeController.vid_cts_with_vid_list[index].photoData!.length,
                                                                        itemBuilder: (context, index2) {

                                                                            return  GestureDetector(
                                                                                onTap: (){

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
                                                                                                                image:homeController.vid_cts_with_vid_list[index].photoData![index2]["cover_photo"].toString(),
                                                                                                                placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                                                                            ),
                                                                                                            Positioned(
                                                                                                                bottom: 30,
                                                                                                                left:50,
                                                                                                                child: Image.asset("assets/images/video_icon.png", height: 50, width: 50,),

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
                                                                                                    child: Text(homeController.vid_cts_with_vid_list[index].photoData![index2]["video_title"].toString(),
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
                                                        )
                                                    )
                                                ),

                                            );
                                        },
                                    ):SizedBox()

                                ),
                            ),

                            // Container(
                            //   width: width,
                            //   height: 2,
                            //   color: Colors.deepPurple,
                            //   //thickness: 2,
                            // ),
                            // Container(
                            //     margin: const EdgeInsets.only(left: 15.0),
                            //     padding: const EdgeInsets.only(left: 30.0,right: 30.0,top: 5.0,bottom: 5.0),
                            //     color: Colors.deepPurple,
                            //     child: Text(homeController.vidDataInfo.value.video_cat_name.toString()+' -এর আরো ছবির অ্যালবাম',
                            //         style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white)
                            //     )
                            // ),
                            //
                            // Obx(() =>
                            //     Container(
                            //         margin: EdgeInsets.only(top: 5,bottom: 5,right: 0,left: 0),
                            //         alignment: Alignment.center,
                            //         child:homeController.cat_wise_vidList.length >0 ?
                            //         GridView.builder(
                            //           physics: NeverScrollableScrollPhysics(),
                            //           shrinkWrap: true,
                            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            //             crossAxisCount: 2,
                            //             crossAxisSpacing: 15.0,
                            //             mainAxisSpacing: 10.0,
                            //             //childAspectRatio: width / (height / 1.9)
                            //             //childAspectRatio: 1
                            //           ),
                            //           itemCount: homeController.cat_wise_vidList.length,
                            //           itemBuilder: (context, index) {
                            //             return  GestureDetector(
                            //               onTap: (){
                            //                 // homeController.dataLoaded.value = false;
                            //                 // homeController.newsId.value = homeController.showNewsList[index].id.toString();
                            //                 // homeController.selectedPageIndex.value = 1;
                            //                 // homeController.get_news_details();
                            //
                            //               },
                            //
                            //               child: Obx(() => Container(
                            //
                            //                 //height: ,
                            //                 //alignment: Alignment.center,
                            //                   child: Column(
                            //                     mainAxisAlignment: MainAxisAlignment.center,
                            //                     crossAxisAlignment: CrossAxisAlignment.center,
                            //                     children: [
                            //                       Container(
                            //                         child: Stack(
                            //                           // fit: StackFit.expand,
                            //                           children: [
                            //                             FadeInImage.assetNetwork(
                            //                                 height: height * 0.12,
                            //                                 width: width*0.92,
                            //                                 fit: BoxFit.fill,
                            //                                 image:homeController.cat_wise_vidList[index]["cover_photo"],
                            //                                 placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                            //                             ),
                            //
                            //                             // Positioned(
                            //                             //   bottom: 10,
                            //                             //   left:10,
                            //                             //   child: homeController.showNewsList[index].video_dis  == 0 ?
                            //                             //   Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),
                            //                             //
                            //                             // ),
                            //
                            //                           ],
                            //                         ),
                            //
                            //                       ),
                            //
                            //                       Text(homeController.cat_wise_vidList[index]["video_title"]!,
                            //                         style: TextStyle(color: Colors.black,fontSize: 13,fontWeight:FontWeight.bold ),
                            //                         textAlign: TextAlign.justify,
                            //                         maxLines: 2,
                            //                       ),
                            //                     ],
                            //                   )
                            //               )
                            //               ),
                            //             );
                            //           },
                            //         ):SizedBox()
                            //     ),
                            // ),

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