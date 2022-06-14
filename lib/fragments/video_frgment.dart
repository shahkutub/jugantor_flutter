
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    // var now = new DateTime.now();
    // var formatter = new DateFormat('yyyy/MM/dd');
    // String formattedDate = formatter.format(now);
    // print(formattedDate);

    return Container(
      child:Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                height: width-120,
                width: width-30,
                color: Colors.red,
                child: WebView(
                  initialUrl: Uri.dataFromString('<html><body><iframe width= '+webViewWidth.toString()+'px height='+webViewheight.toString()+' src=\"https:\/\/www.youtube.com\/embed\/00m4gj2lp6A\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen><\/iframe></body></html>', mimeType: 'text/html').toString(),
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                     _controller.complete(webViewController);},
                ),

              )
            ],
          )
        ],


        // child:Obx(() =>
        //     Stack(
        //       children: <Widget>[
        //
        //         Align(
        //           alignment: Alignment.center,
        //           child:Container(
        //             alignment: Alignment.center,
        //
        //             child: WebView(
        //               initialUrl: Uri.dataFromString('<html><body><iframe width= '+webViewWidth.toString()+'px height=\"516px\" src=\"https:\/\/www.youtube.com\/embed\/00m4gj2lp6A\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen><\/iframe></body></html>', mimeType: 'text/html').toString(),
        //               javascriptMode: JavascriptMode.unrestricted,
        //               // initialUrl: 'https://www.google.com/search?q='+homeController.searchQuery.value+'jugantor',
        //               // javascriptMode: JavascriptMode.unrestricted,
        //               onProgress: (int progress) {
        //                 print('WebView is loading (progress : $progress%)');
        //                 if(progress == 100){
        //                   homeController.isLoading.value = false;
        //                 }
        //               },
        //
        //               onWebViewCreated: (WebViewController webViewController) {
        //                 _controller.complete(webViewController);},
        //
        //             ),
        //           ),
        //         ),
        //
        //         homeController.isLoading.value ? Center( child: CircularProgressIndicator(),)
        //             : Stack(),
        //       ],
        //     ),
        // )
      )


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