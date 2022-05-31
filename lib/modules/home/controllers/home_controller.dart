
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';
import 'package:jugantor.com/api/api_client.dart';
import 'package:jugantor.com/api/api_manager.dart';
import 'package:jugantor.com/fragments/home_fragment.dart';
import 'package:jugantor.com/fragments/second_fragment.dart';
import 'package:jugantor.com/fragments/third_fragment.dart';
import 'package:jugantor.com/model/CatExtraLinkResponse.dart';
import 'package:jugantor.com/model/CategoryResponse.dart';
import 'package:http/http.dart' as http;
import 'package:jugantor.com/model/HomeCategoryWithNewsList.dart';
import 'package:jugantor.com/model/LastEntryNewsResponse.dart';
import 'package:jugantor.com/model/LeadNewsResponse.dart';
import 'package:jugantor.com/model/LsatThreeVideo.dart';
import 'package:jugantor.com/model/ShowNewsResponse.dart';
import 'package:jugantor.com/ui.dart';


class HomeController extends GetxController {

  var selectedIndex = 0.obs;
  var homecatId = 0.obs;
  var banglaDate = "".obs;
  var leadnews = LeadNewsResponse().obs;
  List<CategoryResponse> categoryList = <CategoryResponse>[].obs;
  List<CatExtraLinkResponse> catExtraLinkList = <CatExtraLinkResponse>[].obs;
  List<ShowNewsResponse> showNewsList = <ShowNewsResponse>[].obs;
  List<LastEntryNewsResponse> last_entry_newsList = <LastEntryNewsResponse>[].obs;

  List<CategoryResponse> home_categoryList = <CategoryResponse>[].obs;
  //List<LastEntryNewsResponse> category_wise_newsList = <LastEntryNewsResponse>[].obs;
  List<HomeCategoryWithNewsList> category_list_with_news_newsList = <HomeCategoryWithNewsList>[].obs;


  var scrollController = ScrollController().obs;

  final dataLoaded = false.obs;
  var button = 1.obs;

  List<LsatThreeVideo> last_VidListList = <LsatThreeVideo>[].obs;

  var myIndex = 0.obs;
  @override
  void onInit() {
    //scrollController.value.position = 0;
    //print(scrollController.value.offset.toString());
    get_bn_date();
    get_lead_news();
    get_category();
    get_extracat();
    get_show_news();
    get_last_entry_news();
    get_last_three_videos();
    //get_home_category();


    // if(scrollController.value.offset > 68){
    //
    // }
    super.onInit();
  }



  Future<dynamic> get_bn_date() async {

    //Ui.showLoaderDialog(Get.context);
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.get(ApiClient.today_bn_date);
      print('today_bn_date: ${response}');

      if(response != null){
        banglaDate.value = response.toString();

        //Navigator.of(Get.context).pop();
      }

    } catch (e) {

    }
  }

  Future<dynamic> get_lead_news() async {

    //Ui.showLoaderDialog(Get.context);
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.get(ApiClient.leadnews);
      print('today_bn_date: ${response}');

      if(response != null){
        leadnews.value = LeadNewsResponse.fromJson(response);

        print('leadnews: ${leadnews.value.title}');
        //Navigator.of(Get.context).pop();
      }

    } catch (e) {

    }
  }

  get_category() async {
    print("Calling API: "+ApiClient.category);
    try {
      final response = await http.get(Uri.parse(ApiClient.category));
      //print(response.body);
      List<CategoryResponse> list = (json.decode(response.body) as List)
          .map((data) => CategoryResponse.fromJson(data))
          .toList();
      categoryList.addAll(list);
      var cattegory = CategoryResponse();
      cattegory.cat_name = "প্রচ্ছদ";
      cattegory.id = 0;
      categoryList.add(cattegory);
      categoryList.insert(0, cattegory);
      print('categoryList: ${list.length.toString()}');

      print('categoryname: ${categoryList[0].cat_name.toString()}');

    } on SocketException {

    }
  }



  get_extracat() async {
    print("Calling API: "+ApiClient.category);
    try {
      final response = await http.get(Uri.parse(ApiClient.cat_extra_link));
      //print(response.body);
      List<CatExtraLinkResponse> list = (json.decode(response.body) as List)
          .map((data) => CatExtraLinkResponse.fromJson(data))
          .toList();
      catExtraLinkList.addAll(list);
      //print('categoryname: ${categoryList[0].cat_name.toString()}');
      //dataLoaded.value = true;
    } on SocketException {

    }
  }

  get_show_news() async {
    print("Calling API: "+ApiClient.category);
    try {
      final response = await http.get(Uri.parse(ApiClient.show_news));
      print(response.body);
      List<ShowNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => ShowNewsResponse.fromJson(data))
          .toList();
      showNewsList.addAll(list);
      print('showNewsList: ${showNewsList[0].title.toString()}');
      //dataLoaded.value = true;
    } on SocketException {

    }
  }

  get_last_entry_news() async {
    print("Calling API: "+ApiClient.last_entry_news);
    try {
      final response = await http.get(Uri.parse(ApiClient.last_entry_news));
      print(response.body);
      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();

      last_entry_newsList.clear();
      last_entry_newsList.addAll(list);
      dataLoaded.value = true;

      get_home_category();
      print('last_entry_newsList: ${last_entry_newsList[0].title.toString()}');

    } on SocketException {

    }
  }

  get_most_view_news() async {
    print("Calling API: "+ApiClient.most_view_news);
    try {
      final response = await http.get(Uri.parse(ApiClient.most_view_news));
      print(response.body);
      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();
      last_entry_newsList.clear();
      last_entry_newsList.addAll(list);
      dataLoaded.value = true;

      get_home_category();
      print('last_entry_newsList: ${last_entry_newsList[0].title.toString()}');

    } on SocketException {

    }
  }

  get_home_category() async {
    print("Calling API: "+ApiClient.home_category);
    try {
      final response = await http.get(Uri.parse(ApiClient.home_category));
      //print(response.body);
      List<CategoryResponse> list = (json.decode(response.body) as List)
          .map((data) => CategoryResponse.fromJson(data))
          .toList();
      home_categoryList.addAll(list);

      home_categoryList.forEach((element) {
        get_category_wise_news(element);

      });



    } on SocketException {

    }
  }

  get_category_wise_news(CategoryResponse category) async {
    print("Calling API: "+ApiClient.category_wise_news+'/'+category.id.toString());
    List<LastEntryNewsResponse> newsList = <LastEntryNewsResponse>[];
    try {
      final response = await http.get(Uri.parse(ApiClient.category_wise_news+'/'+category.id.toString()));
      print(response.body.toString());
      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();
      newsList.addAll(list);

      var data = HomeCategoryWithNewsList(category.cat_name,category.id,newsList);
      category_list_with_news_newsList.add(data);

     // print('category_wise_newsList: ${category_wise_newsList[0].title.toString()}');
      //return category_wise_newsList;
    } on SocketException {

    }
  }


  get_last_three_videos() async {
    print("Calling API: "+ApiClient.last_three_videos);
    try {
      final response = await http.get(Uri.parse(ApiClient.last_three_videos));
      print(response.body);
      List<LsatThreeVideo> list = (json.decode(response.body) as List)
          .map((data) => LsatThreeVideo.fromJson(data))
          .toList();
      last_VidListList.addAll(list);

    } on SocketException {

    }
  }


  Widget CustomRadioButton(String text, int index) {
    return FlatButton(

      color: (button.value == index) ? Colors.black : Colors.white,
      onPressed: () {
        button.value = index;
        if(button.value == 1){
          get_last_entry_news();
        }else{
          get_most_view_news();
        }
      },
      child: Expanded(
          child:Container(

              color: (button.value == index) ? Colors.black : Colors.white,
              child:Center(child: Text(
                text,
                style: TextStyle(
                  color: (button.value == index) ? Colors.white : Colors.black,
                ),
              ),)
               )
          ),


      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //borderSide: BorderSide(color: (button.value == index) ? Colors.green : Colors.black),

    );
  }

  getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomeFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();

      default:
        return new Text("Error");
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    //get_lead_news();
    //get_category();

  }


}

class VideoData {
  var fullImage = "";
}
