import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';
import 'package:social_share_plugin/social_share_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/utils.dart';
import 'bottom_view.dart';
class NewsDetailseFragmentNew extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    Get.put(HomeController());
    double height = Get.height;
    double width = Get.width;
    //Firebase.initializeApp();
    // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    // analytics.setUserId(id: 'UA-41755481-1');
    //
    // analytics.logEvent(
    //   name: "select_content",
    //   parameters: {
    //     "content_type": "image",
    //     "item_id": 0,
    //   },
    // );
    //
    // analytics.setCurrentScreen(
    //     screenName: 'Products'
    // );

    var bread_cat_name = "";
    var bread_cat_id = 0;

    List<String> mainDataList  = Utils.dateTimeFormatymd(homeController.newsDetails.value.news_date_time!).split(' ');

    var amPm = '';
    if(mainDataList[2] == 'am'){
      amPm = 'এএম';
    }else{
      amPm = 'পিএম';
    }
    homeController.newsDate.value = Utils.allNewsDateConvert(mainDataList[0])+" "+ Utils.replaceEngNumberToBangla(mainDataList[1])+' '+amPm;
    if(homeController.newsDetails.value.news_edition == 1){
      homeController.newsEdition.value = "অনলাইন সংস্করণ";
    }else{
      homeController.newsEdition.value = "প্রিন্ট সংস্করণ";
    }

    if(homeController.newsDetails.value.bread_parent_cat_name != null || homeController.newsDetails.value.bread_parent_cat_name != ''){
      bread_cat_name = homeController.newsDetails.value.bread_parent_cat_name!;
      bread_cat_id = homeController.newsDetails.value.bread_parent_cat_id!;
    }else if(homeController.newsDetails.value.category_name != null || homeController.newsDetails.value.category_name != ''){
      bread_cat_name = homeController.newsDetails.value.category_name!;
      bread_cat_id = homeController.newsDetails.value.parent_cat_id!;
    }



    return new Scaffold(

      appBar:AppBar(
        backgroundColor: Color(0xff2A394D),
        title: Stack(alignment: Alignment.center,
          children: <Widget>[
            // Container(
            //   alignment: Alignment.centerLeft,
            //   child: Text('N-PMS'),),
            Container(

              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // Obx(() =>
                  //
                  // ),
                  Obx(() =>
                  homeController.banglaDate.value != null?
                  Text(""+Utils.currentDateBengali()+' , '+homeController.banglaDate.value,
                    style: TextStyle(color: Colors.white,fontSize: 15),
                    textAlign:TextAlign.center,
                  ):Text('')
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: (){
                          // ajker paper page index 3
                          //Get.back();
                          homeController.selectedPageIndex.value = 3;
                          homeController.selectedCategoryName.value = "আজকের পত্রিকা";
                          homeController.selectedSubCategoryName.value = "";
                          homeController.catListShow.value = false;
                          homeController.ajker_paper_sub_category();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text("আজকের পত্রিকা",
                            style: TextStyle(color: Colors.white,fontSize: 15),
                            textAlign:TextAlign.center,
                          ),
                        ),

                      ),
                      GestureDetector(
                        onTap: (){
                          homeController.selectedPageIndex.value = 4;
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text("|  ই-পেপার",
                            style: TextStyle(color: Colors.white,fontSize: 15),
                            textAlign:TextAlign.center,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          homeController.selectedPageIndex.value = 4;
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text("|  বেটা ভার্সন",
                            style: TextStyle(color: Colors.white,fontSize: 15),
                            textAlign:TextAlign.center,
                          ),
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            )
          ],
        ),

      ),

      body:  Scaffold(
        appBar:AppBar(
          automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title:Obx(() => homeController.isSearch.value == false?
            Stack(alignment: Alignment.center,
              children: <Widget>[
                Container(
                  //height: 80,
                    alignment: Alignment.center,
                    child:GestureDetector(
                        onTap: (){
                          homeController.selectedPageIndex.value = 0;
                        },
                        child:SvgPicture.asset(
                          'assets/images/jugantorlogo.svg',
                          height: 40, width: 130,

                        )
                    )
                ),
                //https://www.google.com/search?q=poddasetu+jugantor

                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    //tooltip: 'Increase volume by 10',
                    onPressed: () {
                      homeController.isSearch.value = true;
                    },
                  ),
                )
              ],
            ):
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                color: Colors.white,
                borderRadius:  BorderRadius.circular(32),
              ),
              child: TextField(
                controller: homeController.searchController.value,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 17),
                  hintText: 'Search ...',
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: (){
                          //homeController.isSearch.value = false;
                          homeController.searchQuery.value = homeController.searchController.value.text.toString();
                          homeController.selectedPageIndex.value = 10;
                        },
                        icon: Icon(Icons.search,color: Colors.green,),
                      ),
                      IconButton(
                        onPressed: (){
                          homeController.isSearch.value = false;
                          homeController.selectedPageIndex.value = 0;
                          // Get.back();
                        },
                        icon: Icon(Icons.clear,color: Colors.red,),
                      ),
                    ],
                  ),

                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            )

        ),
        body: Container(
            margin: EdgeInsets.only(left: 0,right: 0,top: 20),
            child: Obx(() {
              if(homeController.dataLoaded.isTrue && homeController.newsDetails.value.title != null){

                return new SingleChildScrollView(
                    controller: homeController.scrollController.value,
                    child: Container(
                      child:Column(
                        children: [

                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: <Widget>[

                                    // GestureDetector(
                                    //   onTap: (){
                                    //     homeController.selectedPageIndex.value = homeController.preveoiusPageIndex.value;
                                    //     //Get.back();
                                    //     //Navigator.pop(context);
                                    //   },
                                    //   child:Icon(Icons.arrow_back,color: Colors.blue,),
                                    // ),


                                    GestureDetector(
                                      onTap: (){
                                        homeController.selectedPageIndex.value = 0;
                                        //Get.back();
                                        //Navigator.pop(context);
                                      },
                                      child:Text("প্রচ্ছদ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                                    ),


                                    homeController.newsDetails.value.bread_parent_cat_name!.isNotEmpty?
                                    Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),)
                                        :Text(''),
                                    Obx(() =>
                                        GestureDetector(
                                          onTap: (){

                                            if(homeController.categoryName.value == "আজকের পত্রিকা"){
                                              homeController.selectedPageIndex.value = 3;
                                              homeController.selectedCategoryName.value = "আজকের পত্রিকা";
                                              homeController.selectedSubCategoryName.value = "";
                                              homeController.catListShow.value = false;
                                              homeController.ajker_paper_sub_category();
                                            }else if(homeController.categoryName.value == "সারাদেশ"){

                                              homeController.subcategory_list_with_news_newsList.clear();
                                              homeController.selectedCategoryName.value = "সারাদেশ";
                                              homeController.selectedSubCategoryName.value = '';
                                              homeController.dataLoaded.value = false;
                                              //সারাদেশ page index 7
                                              homeController.selectedPageIndex.value = 7;
                                              homeController.get_saradesh_top_news();
                                              homeController.get_division();

                                            }else{

                                              if(homeController.newsDetails.value.bread_parent_cat_name != null || homeController.newsDetails.value.bread_parent_cat_name != ''){
                                                bread_cat_name = homeController.newsDetails.value.bread_parent_cat_name!;
                                                bread_cat_id = homeController.newsDetails.value.bread_parent_cat_id!;
                                              }else if(homeController.newsDetails.value.category_name != null || homeController.newsDetails.value.category_name != ''){
                                                bread_cat_name = homeController.newsDetails.value.category_name!;
                                                bread_cat_id = homeController.newsDetails.value.parent_cat_id!;
                                              }


                                              homeController.subcategory_list_with_news_newsList.clear();
                                              homeController.catId.value = bread_cat_id;
                                              homeController.selectedSubCategoryName.value = '';
                                              homeController.selectedCategoryName.value = bread_cat_name;
                                              homeController.dataLoaded.value = false;
                                              homeController.get_sub_category(bread_cat_id);
                                              //sub_category page index 2
                                              homeController.selectedPageIndex.value = 2;
                                            }


                                          },
                                          child:Visibility(visible: true,child:Text(""+homeController.newsDetails.value.bread_parent_cat_name!,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.blue),),),
                                        )
                                    ),


                                    homeController.newsDetails.value.category_name!.isNotEmpty && homeController.newsDetails.value.category_name! != homeController.newsDetails.value.bread_parent_cat_name!?
                                    Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),)
                                        :Text(''),

                                    homeController.newsDetails.value.category_name!.isNotEmpty && homeController.newsDetails.value.category_name! != homeController.newsDetails.value.bread_parent_cat_name!?
                                    Obx(() =>
                                        GestureDetector(
                                          onTap: (){

                                          },
                                          child:Visibility(visible: true,child:Text(""+homeController.newsDetails.value.category_name!,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.blue),),),
                                        )
                                    ):Text(''),

                                  ],
                                ),
                                SizedBox(height: 20,),

                                //news shoulder

                                homeController.newsDetails.value.shoulder != null?
                                Text(homeController.newsDetails.value.shoulder!,
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Color(0xffDE7A19)),
                                  textAlign: TextAlign.left,
                                ): Text(""),

                                //news title
                                homeController.newsDetails.value.title != null?
                                Text(homeController.newsDetails.value.title!,
                                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,color: Color(0xff000000)),
                                  textAlign: TextAlign.left,

                                ):Text(""),

                                //news hanger
                                homeController.newsDetails.value.hanger != null?
                                Text(homeController.newsDetails.value.hanger!,
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Color(0xffDE7A19)),
                                  textAlign: TextAlign.left,

                                ):Text(""),

                                //news reporter name
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.person, color: Colors.blueGrey ),
                                    Text(" "+homeController.newsDetails.value.reporter!,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey),),
                                  ],
                                ),

                                //news datetime edition
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.access_time, color: Colors.blueGrey ),
                                    Text(" "+homeController.newsDate.value,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey),),
                                    Text(" | "+homeController.newsEdition.value,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey),),

                                  ],
                                ),

                                SizedBox(height: 10,),

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
                                            linkUrl: homeController.newsDetails.value.generate_url
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
                                            linkUrl: homeController.newsDetails.value.generate_url
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
                                            linkUrl: homeController.newsDetails.value.generate_url
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
                                            linkUrl: homeController.newsDetails.value.generate_url
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
                                            linkUrl: homeController.newsDetails.value.generate_url
                                          //text: 'Please click on attach link to show & download pdf',
                                          // filePath: controller.searchPdfPath.value,
                                          // fileType: '*/*'
                                          //chooserTitle: 'Please click on attach link to show & download pdf'
                                        );
                                      },
                                    ),



                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                FadeInImage.assetNetwork(
                                    fit: BoxFit.fill,
                                    image:homeController.newsDetails.value.img_url!,
                                    placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                ),
                                // Center(
                                //   child: Text(homeController.newsDetails.value.photo_caption),
                                // ),


                                Html(data: "<html>\n" +
                                    "<head>\n" +
                                    "<style type=\"text/css\">\n" +
                                    "\tp{\n" +
                                    "\t\ttext-align: justify;\n" +
                                    "\t\tfont-family: SolaimanLipi;\n" +
                                    "\t\tfont-size:18px;\n" +
                                    "\t}\n" +
                                    "</style>\n" +
                                    "</head>\n" +
                                    "\n" +
                                    "<body>\n" +
                                    homeController.newsDetails.value.detail! +
                                    "</body>\n" +
                                    "</html>",

                                ),

                                SizedBox( height:20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("যুগান্তর ইউটিউব চ্যানেলে সাবস্ক্রাইব করুন",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Image.asset(
                                        //     'assets/images/youtube.jpg',
                                        //     height: 70,
                                        //     fit:BoxFit.fill),
                                        Image.asset(
                                            'assets/images/juganyoutubepng.png',
                                            // height: 70,
                                            fit:BoxFit.fill)
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox( height:20),

                                Container(
                                    child: homeController.detail_page_aro_button_newsList.length > 0?
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.calendar_today_sharp,color: Colors.black,),
                                            Text(homeController.tagNameResponse.value.tag_name.toString()),
                                          ],
                                        ),
                                        Divider(
                                            color: Colors.red
                                        ),

                                        Container(
                                            margin: EdgeInsets.only(top: 10,bottom: 10,right: 0,left: 0),
                                            alignment: Alignment.center,
                                            child:ListView.builder(
                                              primary: false,
                                              shrinkWrap: true,
                                              physics: NeverScrollableScrollPhysics(),
                                              // Let the ListView know how many items it needs to build.
                                              itemCount: homeController.detail_page_aro_button_newsList.length,
                                              // Provide a builder function. This is where the magic happens.
                                              // Convert each item into a widget based on the type of item it is.
                                              itemBuilder: (context, index) {

                                                homeController.check_two_times_is_before(homeController.detail_page_aro_button_newsList[index]["news_date"]);
                                                //final item = homeController.last_entry_newsList[index];

                                                return Container(
                                                  margin: EdgeInsets.only(top: 10),
                                                  child: Obx(() =>
                                                      GestureDetector(
                                                          onTap: (){
                                                            homeController.dataLoaded.value = false;
                                                            homeController.newsId.value = homeController.detail_page_aro_button_newsList[index]["id"];
                                                            homeController.get_news_details();
                                                            homeController.scrollController.value.animateTo(0,
                                                                duration: const Duration(seconds: 1), curve: Curves.linear);
                                                          },
                                                          child: Container(
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
                                                                            image:homeController.detail_page_aro_button_newsList[index]["img_url"],
                                                                            placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                                        ),
                                                                        Positioned(
                                                                          bottom: 20,
                                                                          left:35,
                                                                          child: homeController.detail_page_aro_button_newsList[index]["video_dis"]  == 0 ?
                                                                          Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),

                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Flexible(child:
                                                                  Text(homeController.detail_page_aro_button_newsList[index]["title"],
                                                                    style: TextStyle(color: Colors.black,fontSize: 13,fontWeight:FontWeight.bold ),
                                                                    textAlign: TextAlign.justify,
                                                                  ),

                                                                  ),

                                                                ],
                                                              )
                                                          )
                                                      ),
                                                  ),
                                                );
                                              },
                                            )

                                        ),

                                        GestureDetector(
                                          onTap: (){
                                            homeController.get_event_news_paginate(homeController.eventPage.value+1);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10,bottom: 15),
                                            alignment: Alignment.center,
                                            color: Color(0xffEEEEEE),
                                            padding: EdgeInsets.all(7),
                                            child: Text("আরও",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                                          ),
                                        ),

                                      ],
                                    ) : SizedBox()
                                ),



                                Container(
                                    child: homeController.moreCatNewsList.length > 0? Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          color: Color(0xff3B5998),
                                          padding: EdgeInsets.all(7),
                                          child: Text("আরও খবর",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white)),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(top: 15,bottom: 5,right: 0,left: 0),
                                            alignment: Alignment.center,
                                            child:GridView.builder(
                                              physics: NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 15.0,
                                                mainAxisSpacing: 10.0,
                                                //childAspectRatio: width / (height / 1.9)
                                                //childAspectRatio: 1
                                              ),
                                              itemCount: homeController.moreCatNewsList.length,
                                              itemBuilder: (context, index) {
                                                return  GestureDetector(
                                                  onTap: (){
                                                    homeController.dataLoaded.value = false;
                                                    homeController.newsId.value = homeController.moreCatNewsList[index].id.toString();
                                                    homeController.get_news_details();
                                                    homeController.scrollController.value.animateTo(0,
                                                        duration: const Duration(seconds: 1), curve: Curves.linear);
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
                                                                    image:homeController.moreCatNewsList[index].img_url!,
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

                                                          Text(homeController.moreCatNewsList[index].title!,
                                                            style: TextStyle(color: Colors.black,fontSize: 13,fontWeight:FontWeight.bold ),
                                                            textAlign: TextAlign.justify,
                                                          ),
                                                        ],
                                                      )
                                                  )
                                                  ),
                                                );
                                              },
                                            )
                                        ),
                                      ],
                                    ):SizedBox()
                                ),

                                SizedBox( height:20),

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

                                SizedBox(
                                  height: 10,
                                ),

                                Container(
                                    child: homeController.tag.value.isNotEmpty ?
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('আরওঃ '), Text(''+homeController.tag.value,style: TextStyle(color: Color(0xff217DFF)),),
                                          ],
                                        ),
                                        Divider(color: Colors.red),
                                        Obx(() =>
                                            Container(
                                                margin: EdgeInsets.only(top: 0,bottom: 5,right: 0,left: 0),
                                                alignment: Alignment.center,
                                                child:ListView.builder(
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  // Let the ListView know how many items it needs to build.
                                                  itemCount: homeController.tagNewsList.length,
                                                  // Provide a builder function. This is where the magic happens.
                                                  // Convert each item into a widget based on the type of item it is.
                                                  itemBuilder: (context, index) {

                                                    return Container(
                                                        margin: EdgeInsets.only(top: 8),
                                                        child:   GestureDetector(
                                                          onTap: (){
                                                            homeController.dataLoaded.value = false;
                                                            homeController.newsId.value = homeController.tagNewsList[index].id.toString();
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
                                                                            image:homeController.tagNewsList[index].img_url!,
                                                                            placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                                                                        ),
                                                                        Positioned(
                                                                          bottom: 20,
                                                                          left:35,
                                                                          child: homeController.tagNewsList[index].video_dis  == 0 ?
                                                                          Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),

                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Flexible(child:
                                                                  Text(homeController.tagNewsList[index].title!,
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
                                    ): Text("")
                                ),
                              ],
                            ),
                          ),


                          BottomView()

                        ],
                      ),

                    )

                );
              }else{
                return Center(
                    child: CircularProgressIndicator()

                  // child: Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: MediaQuery.of(context).size.height,
                  //   color: Colors.grey.withOpacity(0.5),
                  //   child: const Center(child: CircularProgressIndicator())  ,
                  // )
                );
              }

            })
        ),
      )


    );

  }
}