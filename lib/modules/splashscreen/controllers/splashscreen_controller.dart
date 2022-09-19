import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:jugantor.com/api/api_client.dart';
import 'package:jugantor.com/api/api_manager.dart';
import 'package:jugantor.com/model/CatExtraLinkResponse.dart';
import 'package:jugantor.com/model/CategoryResponse.dart';
import 'package:jugantor.com/model/HomeCategoryWithNewsList.dart';
import 'package:jugantor.com/model/LastEntryNewsResponse.dart';
import 'package:jugantor.com/routes/app_pages.dart';
import 'package:http/http.dart' as http;
class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  var banglaDate = "".obs;
  List<CategoryResponse> categoryList = <CategoryResponse>[].obs;
  List<CatExtraLinkResponse> catExtraLinkList = <CatExtraLinkResponse>[].obs;
  List<LastEntryNewsResponse> last_entry_newsList = <LastEntryNewsResponse>[].obs;
  List<CategoryResponse> home_categoryList = <CategoryResponse>[].obs;
  List<HomeCategoryWithNewsList> category_list_with_news_newsList = <HomeCategoryWithNewsList>[].obs;

  @override
  void onInit() {
    print('called');
    // Timer(Duration(seconds: 3), () {
    //   // if (Get.find<AuthService>().isAuth) {
    //      Get.offAllNamed(Routes.HOME);
    //   // } else {
    //   //   Get.offAllNamed(Routes.LOGIN);
    //   // }
    // });

    get_bn_date();
    get_extracat();
    get_category();

    //get_last_entry_news1();
    super.onInit();
  }

  get_category() async {
    categoryList.clear();
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
      Get.offAllNamed(Routes.HOME);
    } on SocketException {

    }
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
  get_extracat() async {
    catExtraLinkList.clear();
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

  get_last_entry_news1() async {
    print("Calling API: "+ApiClient.last_entry_news);
    try {
      final response = await http.get(Uri.parse(ApiClient.last_entry_news));
      print(response.body);
      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();

      last_entry_newsList.clear();
      last_entry_newsList.addAll(list);
      //dataLoaded.value = true;
      //Navigator.of(context).pop();
      get_home_category();
      print('last_entry_newsList: ${last_entry_newsList[0].title.toString()}');

    } on SocketException {

    }
  }
  get_home_category() async {
    home_categoryList.clear();
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
      //dataLoaded.value = true;
      Get.offAllNamed(Routes.HOME);
    } on SocketException {

    }
  }
  get_category_wise_news(CategoryResponse category) async {
    category_list_with_news_newsList.clear();
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
}
