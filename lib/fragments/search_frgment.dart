
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchFragment extends StatelessWidget{

  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> _controller =
    Completer<WebViewController>();
    Get.find<HomeController>();

    // var now = new DateTime.now();
    // var formatter = new DateFormat('yyyy/MM/dd');
    // String formattedDate = formatter.format(now);
    // print(formattedDate);

    return Container(
      child:
      Obx(() =>
          Stack(
            children: <Widget>[
              WebView(
                initialUrl: 'https://www.google.com/search?q='+homeController.searchQuery.value+'jugantor',
                javascriptMode: JavascriptMode.unrestricted,
                onProgress: (int progress) {
                  print('WebView is loading (progress : $progress%)');
                  if(progress == 100){
                    homeController.isLoading.value = false;
                  }
                },

                onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);},

              ),
              homeController.isLoading.value ? Center( child: CircularProgressIndicator(),)
                  : Stack(),
            ],
          ),
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