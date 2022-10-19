
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'bottom_view.dart';
class VideoFragmentDetailse extends StatelessWidget{

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


        // String photoUrl = "";
        //
        // var text = homeController.vidDataInfo.value.embed_code.toString();
        // RegExp exp = new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
        // Iterable<RegExpMatch> matches = exp.allMatches(text);
        // matches.forEach((match) {
        //     photoUrl = text.substring(match.start, match.end);
        // });
        //
        // RegExp regExp = new RegExp(
        //     r'.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\&\?]*).*',
        //     caseSensitive: false,
        //     multiLine: false,
        // // );
        //
        // final matchYoutubeUrl = regExp.firstMatch(photoUrl)!.group(1); // <- This is the fix
        var controllerYoutube = YoutubePlayerController(
            initialVideoId: homeController.vidId.value,
            params: YoutubePlayerParams(
                startAt: Duration(seconds: 30),
                autoPlay: true,
            ),
        );

        return Container(
            margin: EdgeInsets.all(20),

            child:SingleChildScrollView(
                child: Container(
                    child: Column(



                        children: [
                            Row(
                                children: <Widget>[
                                    InkWell(
                                        onTap: (){
                                            homeController.dataLoaded.value = true;
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
                            //Obx(() =>
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    // YoutubePlayerIFrame(
                                    //     controller: controllerYoutube,
                                    //     aspectRatio: 16/9,
                                    // )


                                    //Obx(() =>


                                    Container(
                                        //margin: EdgeInsets.only(top: 20),
                                        height: width-125,
                                        width: width-40,
                                        color: Colors.red,
                                        child:  Obx(() =>
                                        WebView(
                                            //initialUrl: Uri.dataFromString('<html><body>'+homeController.vidDataInfo.value.embed_code.toString()+'</body></html>', mimeType: 'text/html').toString(),

                                            // initialUrl: Uri.dataFromString('<html><body><iframe width= '+webViewWidth.toString()+'px height='+webViewheight.toString()+' '
                                            //     'src='+photoUrl.toString()+' title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen><\/iframe></body></html>', mimeType: 'text/html').toString(),

                                            initialUrl: Uri.dataFromString("<iframe width=\"100%\" height=\"100%\" src=\"https://www" +
                                                ".youtube.com/embed/"+homeController.vidId.value+"\" frameborder=\"0\" " +
                                                "allowfullscreen></iframe>", mimeType: 'text/html').toString(),


                                            javascriptMode: JavascriptMode.unrestricted,
                                            onWebViewCreated: (WebViewController webViewController) {
                                                _controller.complete(webViewController);},
                                        )),

                                    )

                                    //)

                                ],
                            ),
                           // ),

                            SizedBox(height: 20,),
                            // share icons
                            // share icons
                            Row(
                                children: <Widget>[

                                    // GestureDetector(
                                    //
                                    //   child:Container(
                                    //     //height: 80,
                                    //     alignment: Alignment.center,
                                    //     child: Image.asset(
                                    //       'assets/images/socialmedia.png',
                                    //       height: 50, width: 50,
                                    //     ),
                                    //     // decoration: BoxDecoration(
                                    //     //   color: Color(0xff4469B3),
                                    //     //   borderRadius: BorderRadius.all(Radius.circular(20)),
                                    //     // ),
                                    //   ),
                                    //   onTap: () async {
                                    //     FlutterShare.share(
                                    //         title: homeController.newsDetails.value.title!,
                                    //         text: homeController.newsDetails.value.title!,
                                    //         chooserTitle: homeController.newsDetails.value.title!,
                                    //         linkUrl: homeController.newsDetails.value.generate_url
                                    //         //text: 'Please click on attach link to show & download pdf',
                                    //         // filePath: controller.searchPdfPath.value,
                                    //         // fileType: '*/*'
                                    //       //chooserTitle: 'Please click on attach link to show & download pdf'
                                    //     );
                                    //
                                    //
                                    //     //await SocialSharePlugin.shareToFeedFacebookLink(quote: 'quote', url: 'https://flutter.dev');
                                    //   },
                                    // ),
                                    // SizedBox(width: 10,),

                                    GestureDetector(
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
                                                title: homeController.newsDetails.value.title!,
                                                text: homeController.newsDetails.value.title!,
                                                chooserTitle: homeController.newsDetails.value.title!,
                                                linkUrl: homeController.fullYoutubeUrl.value
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
                                                title: homeController.newsDetails.value.title!,
                                                text: homeController.newsDetails.value.title!,
                                                chooserTitle: homeController.newsDetails.value.title!,
                                                linkUrl: homeController.fullYoutubeUrl.value
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
                                                title: homeController.newsDetails.value.title!,
                                                text: homeController.newsDetails.value.title!,
                                                chooserTitle: homeController.newsDetails.value.title!,
                                                linkUrl: homeController.fullYoutubeUrl.value
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
                                                title: homeController.newsDetails.value.title!,
                                                text: homeController.newsDetails.value.title!,
                                                chooserTitle: homeController.newsDetails.value.title!,
                                                linkUrl: homeController.fullYoutubeUrl.value
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
                                            child:Icon(Icons.share_sharp,size: 30,color: Colors.white,),
                                            decoration: BoxDecoration(
                                                color: Color(0xff00B0ED),
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                            ),
                                        ),

                                        onTap: (){
                                            FlutterShare.share(
                                                title: homeController.newsDetails.value.title!,
                                                text: homeController.newsDetails.value.title!,
                                                chooserTitle: homeController.newsDetails.value.title!,
                                                linkUrl: homeController.fullYoutubeUrl.value
                                                //text: 'Please click on attach link to show & download pdf',
                                                // filePath: controller.searchPdfPath.value,
                                                // fileType: '*/*'
                                                //chooserTitle: 'Please click on attach link to show & download pdf'
                                            );
                                        },
                                    ),



                                ],
                            ),
                            SizedBox(height: 20,),



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
                                child: Text(homeController.vidDataInfo.value.video_cat_name.toString()+' -এর আরো ভিডিও',
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white)
                                )
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
                                                    homeController.vidDataInfo.value = homeController.cat_wise_vidList![index];
                                                    homeController.getVideoId();
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

                                                                        Positioned(
                                                                            bottom: 30,
                                                                            left:50,
                                                                            child: Image.asset("assets/images/video_icon.png", height: 50, width: 50,),

                                                                        ),

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