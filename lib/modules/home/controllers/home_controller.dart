
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';
import 'package:jugantor.com/api/api_client.dart';
import 'package:jugantor.com/api/api_manager.dart';
import 'package:jugantor.com/fragments/ajker_paper_fragment.dart';
import 'package:jugantor.com/fragments/e_paper_frgment.dart';
import 'package:jugantor.com/fragments/home_fragment.dart';
import 'package:jugantor.com/fragments/news_detailse_fragment.dart';
import 'package:jugantor.com/fragments/sara_desh_district_fragment.dart';
import 'package:jugantor.com/fragments/sara_desh_fragment.dart';
import 'package:jugantor.com/fragments/sara_desh_thana_fragment.dart';
import 'package:jugantor.com/fragments/search_frgment.dart';
import 'package:jugantor.com/fragments/sob_khobor_cat_wise_fragment.dart';
import 'package:jugantor.com/fragments/sob_khobor_fragment.dart';
import 'package:jugantor.com/fragments/sub_cat_fragment.dart';
import 'package:jugantor.com/fragments/video_frgment.dart';
import 'package:jugantor.com/model/CatExtraLinkResponse.dart';
import 'package:jugantor.com/model/CategoryResponse.dart';
import 'package:http/http.dart' as http;
import 'package:jugantor.com/model/District.dart';
import 'package:jugantor.com/model/Division.dart';
import 'package:jugantor.com/model/HomeCategoryWithNewsList.dart';
import 'package:jugantor.com/model/LastEntryNewsResponse.dart';
import 'package:jugantor.com/model/LastOnlinePoll.dart';
import 'package:jugantor.com/model/LastPhotoAlbam.dart';
import 'package:jugantor.com/model/LeadNewsResponse.dart';
import 'package:jugantor.com/model/LsatThreeVideo.dart';
import 'package:jugantor.com/model/NewsDetailseResponse.dart';
import 'package:jugantor.com/model/ShowNewsResponse.dart';
import 'package:jugantor.com/model/TagNameResponse.dart';
import 'package:jugantor.com/model/Thana.dart';
import 'package:jugantor.com/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:jugantor.com/routes/app_pages.dart';
import 'package:jugantor.com/ui.dart';
import 'package:jugantor.com/utils/utils.dart';

import '../../../fragments/all_poll_fragment.dart';
import '../../../fragments/photo_gal_frgment.dart';
import '../../../model/BoxListModel.dart';
import '../../../model/CtwisePhotoRersponse.dart';
import '../../../model/PhotoCts.dart';


class HomeController extends GetxController {
  var isLoading= true.obs;
  var selectedPageIndex = 0.obs;
  var catId = 0.obs;
  var banglaDate = "".obs;

  List<CategoryResponse> categoryList = <CategoryResponse>[].obs;
  List<CatExtraLinkResponse> catExtraLinkList = <CatExtraLinkResponse>[].obs;
  List<ShowNewsResponse> showNewsList = <ShowNewsResponse>[].obs;
  List<ShowNewsResponse> moreCatNewsList = <ShowNewsResponse>[].obs;
  List<ShowNewsResponse> tagNewsList = <ShowNewsResponse>[].obs;
  List<LastEntryNewsResponse> last_entry_newsList = <LastEntryNewsResponse>[].obs;

  List<Division> division_list = <Division>[].obs;
  List<District> districtList = <District>[].obs;
  List<Thana> thanaList = <Thana>[].obs;

  List<LastEntryNewsResponse> saradesh_top_newsList = <LastEntryNewsResponse>[].obs;
  List<LastEntryNewsResponse> saradesh_division_newsList = <LastEntryNewsResponse>[].obs;
  List<LastEntryNewsResponse> saradesh_district_newsList = <LastEntryNewsResponse>[].obs;
  List<LastEntryNewsResponse> saradesh_thana_newsList = <LastEntryNewsResponse>[].obs;

  List<CategoryResponse> home_categoryList = <CategoryResponse>[].obs;
  List<CategoryResponse> sub_categoryList = <CategoryResponse>[].obs;
  List<LastEntryNewsResponse> category_wise_newsList = <LastEntryNewsResponse>[].obs;
  List<HomeCategoryWithNewsList> category_list_with_news_newsList = <HomeCategoryWithNewsList>[].obs;
  List<HomeCategoryWithNewsList> subcategory_list_with_news_newsList = <HomeCategoryWithNewsList>[].obs;
  List<HomeCategoryWithNewsList> ajker_paper_subcategory_list_with_newsList = <HomeCategoryWithNewsList>[].obs;

  List<CategoryResponse> ajkert_paper_sub_categoryList = <CategoryResponse>[].obs;

  List<dynamic> all_online_pole = <dynamic>[].obs;
  List<dynamic> all_latest_newsList = <dynamic>[].obs;
  List<dynamic> all_cat_wise_newsList = <dynamic>[].obs;
  List<dynamic> cat_wise_vidList = <dynamic>[].obs;
  List<PhotoCts> photo_cts = <PhotoCts>[].obs;
  List<Data> cat_wise_photoList = <Data>[].obs;
  List<dynamic> detail_page_aro_button_newsList = <dynamic>[].obs;

  List<BoxListModel> boxlist = <BoxListModel>[].obs;

  var eventPage = 1.obs;

  var leadnews = LeadNewsResponse().obs;
  //var cat_wise_photoListResponse = CtwisePhotoRersponse();
  var newsDetails = NewsDetailseResponse().obs;
  var tagNameResponse = TagNameResponse().obs;
  var last_online_pollResponse = LastOnlinePoll().obs;
  var categoryName = ''.obs;
  var newsDate = ''.obs;
  var newsEdition = ''.obs;
  var timeSunrise = ''.obs;
  var timeFojor = ''.obs;
  var timeZuhor = ''.obs;
  var timeAsor = ''.obs;
  var timeMagrib = ''.obs;
  var timeIsha = ''.obs;

  var scrollController = ScrollController().obs;

  final dataLoaded = false.obs;
  var button = 1.obs;

  List<LsatThreeVideo> last_VidListList = <LsatThreeVideo>[].obs;
  List<LastPhotoAlbam> last_photo_albumList = <LastPhotoAlbam>[].obs;

  var myIndex = 0.obs;

  var newsId = "".obs;
  var tag = "".obs;
  var picked = "Two";
  var verticalGroupValue = "Pending".obs;
  var spc_event_tag_id = "".obs;
  var currentDateEng = "".obs;
  var selectedCategoryName = "".obs;
  var selectedSubCategoryName = "".obs;
  var selectedDivisionName = "".obs;
  var selectedDistrictName = "".obs;
  var selectedThanaName = "".obs;
  var catListShow = false.obs;

  // Group Value for Radio Button.
  var radioButtonItem = ''.obs;
  var id = 0.obs;
  var character = SingingCharacter.lafayette.obs;

  var district_id = 0.obs;
  var district_title = ''.obs;

  var homecatApiCall = false.obs;

  var isSearch = false.obs;

  var searchQuery = ''.obs;

  var searchController = TextEditingController().obs;

  var vidDataInfo = LsatThreeVideo().obs;
  var photoDataInfo = LastPhotoAlbam().obs;
  var vidEmbed = ''.obs;

  var last_most_text =''.obs;


  var isOldPoll  = false.obs;

  var e_paper_date =''.obs;

  var mapSelectedDivisionName = ''.obs;

  @override
  void onInit() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy/MM/dd');
    e_paper_date.value = formatter.format(now);
    //print(formattedDate);

    prayerTime();

    homecatApiCall.value = false;


    //scrollController.value.position = 0;
    //print(scrollController.value.offset.toString());
    currentDateEng.value = Utils.getCurrentDateEng();
    //Get.find<SplashscreenController>();
    banglaDate.value = Get.find<SplashscreenController>().banglaDate.value;
    categoryList = Get.find<SplashscreenController>().categoryList;
    catExtraLinkList = Get.find<SplashscreenController>().catExtraLinkList;
    // last_entry_newsList = Get.find<SplashscreenController>().last_entry_newsList;
    // home_categoryList = Get.find<SplashscreenController>().home_categoryList;
    // category_list_with_news_newsList = Get.find<SplashscreenController>().category_list_with_news_newsList;

    // get_bn_date();
    // get_category();


    //get_extracat();
    get_lead_news();
    get_show_news();
    last_online_poll();
    get_last_photo_album();
    get_last_three_videos();
    get_last_entry_news1();
    //get_home_category();
    Timer(Duration(seconds: 20), () {
      //get_home_category();
    });
    super.onInit();
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

  Future<dynamic> get_news_details() async {

    print('url: ${ApiClient.newsDetails+'/'+newsId.value}');
    //Ui.showLoaderDialog(Get.context);
    APIManager _manager = APIManager();
    var response;
    try {
      //response = await _manager.get(ApiClient.newsDetails+'/'+newsId.value);
      final response = await http.get(Uri.parse(ApiClient.newsDetails+'/'+newsId.value));
      print(response.body);
     // print('newsdetails: ${response}');
      dataLoaded.value = true;
      Map<String, dynamic> user = jsonDecode(response.body);
      newsDetails.value.id = user['id'];
      newsDetails.value.title = user['title'];
      newsDetails.value.shoulder = user['shoulder'];
      newsDetails.value.hanger = user['hanger'];
      newsDetails.value.video_dis = user['video_dis'];
      newsDetails.value.generate_url = user['generate_url'];
      newsDetails.value.img_url = user['img_url'];
      newsDetails.value.parent_cat_id = user['parent_cat_id'];
      newsDetails.value.parent_cat_url = user['parent_cat_url'];
      newsDetails.value.category_name = user['category_name'];
      newsDetails.value.reporter = user['reporter'];
      newsDetails.value.news_sum = user['news_sum'];
      newsDetails.value.detail = user['detail'];
      newsDetails.value.photo_caption = user['photo_caption'];
      newsDetails.value.photo_alt_txt = user['photo_alt_txt'];
      newsDetails.value.news_tags = user['news_tags'];
      newsDetails.value.spc_event_tag_id = user['spc_event_tag_id'];
      newsDetails.value.news_date_time = user['news_date_time'];
      newsDetails.value.news_edition = user['news_edition'];
      newsDetails.value.location_name = user['location_name'];
      newsDetails.value.location_tag = user['location_tag'];
      newsDetails.value.people_name = user['people_name'];
      newsDetails.value.people_tag = user['people_tag'];
      newsDetails.value.org_name = user['org_name'];
      newsDetails.value.org_tag = user['org_tag'];
      newsDetails.value.bread_parent_cat_id = user['bread_parent_cat_id'];
      newsDetails.value.bread_parent_cat_name = user['bread_parent_cat_name'];
      newsDetails.value.bread_sub_cat_id = user['bread_sub_cat_id'];
      newsDetails.value.bread_sub_cat_name = user['bread_sub_cat_name'];
      // print('datanews: ${datanews}');
      //print('title: ${title}');


      // Map<String, dynamic> newsdata = jsonDecode(response.body);
      // newsdata.forEach((k, v) =>
      //     print("Key : $k, Value : $v")
      //   //detail_page_aro_button_newsList.add(v)
      // );
      //if(response != null){
        //newsDetails.value = NewsDetailseResponse.fromJson(response.body.toString());

      // Map<String, dynamic> newsdata = jsonDecode(response);
      // newsdata.forEach((k, v) =>
      // print("Key : $k, Value : $v")
      // //detail_page_aro_button_newsList.add(v)
      // );
      //print('newslenth: ${detail_page_aro_button_newsList.length}');


        categoryName.value = '';
        categoryName.value = newsDetails.value.bread_parent_cat_name!;
        dataLoaded.value = true;
        print('newsdetailstitle: ${newsDetails.value.title}');
        print('newsddate: ${Utils.dateTimeFormat(newsDetails.value.news_date_time!)}');
        //Navigator.of(Get.context).pop();
     // }
      newsDate.value = '';
      List<String> mainDataList  = Utils.dateTimeFormatymd(newsDetails.value.news_date_time!).split(' ');

      var amPm = '';
      if(mainDataList[2] == 'am'){
        amPm = 'এএম';
      }else{
        amPm = 'পিএম';
      }
      newsDate.value = Utils.allNewsDateConvert(mainDataList[0])+" "+ Utils.replaceEngNumberToBangla(mainDataList[1])+' '+amPm;
      if(newsDetails.value.news_edition == 1){
        newsEdition.value = "অনলাইন সংস্করণ";
      }else{
        newsEdition.value = "প্রিন্ট সংস্করণ";
      }

      get_more_cat_news(newsDetails.value.parent_cat_id.toString(),newsDetails.value.id.toString());

      spc_event_tag_id.value = '';
      spc_event_tag_id.value = newsDetails.value.spc_event_tag_id!;

      if(spc_event_tag_id.value.isNotEmpty){
        get_event_news_paginate(eventPage.value);
      }

      tag.value = '';
      if(newsDetails.value.location_name!.isNotEmpty){
        tag.value = newsDetails.value.location_name!;
      }

      if(newsDetails.value.org_name!.isNotEmpty){
        tag.value = newsDetails.value.org_name!;
      }

      if(newsDetails.value.people_name!.isNotEmpty){
        tag.value = newsDetails.value.people_name!;
      }

      if(newsDetails.value.location_name!.isNotEmpty){
        get_tag_wise_news(tag.value);
      }

      if(newsDetails.value.spc_event_tag_id!.isNotEmpty){
        get_tag_name(newsDetails.value.spc_event_tag_id.toString());
      }


      //Utils.dateBengaliNewsDetailse(Utils.dateTimeFormat(newsDetails.value.news_date_time));
    } catch (e) {

    }
  }

  Future<dynamic> get_tag_name(String tag_id) async {
    print('urltagname: ${ApiClient.tag_name+'/'+tag_id}');
    //Ui.showLoaderDialog(Get.context);
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.get(ApiClient.tag_name+'/'+tag_id);
      //response = await _manager.get(ApiClient.newsDetails+'/558122');
      print('tagname: ${response}');
      //if(response != null){
      tagNameResponse.value = TagNameResponse.fromJson(response);
      //Utils.dateBengaliNewsDetailse(Utils.dateTimeFormat(newsDetails.value.news_date_time));
    } catch (e) {

    }
  }

  Future<dynamic> last_online_poll() async {
    print('urllast_online_poll: ${ApiClient.last_online_poll}');
    //Ui.showLoaderDialog(Get.context);
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.get(ApiClient.last_online_poll);
      //response = await _manager.get(ApiClient.newsDetails+'/558122');
      print('last_online_poll: ${response}');
      //if(response != null){
      last_online_pollResponse.value = LastOnlinePoll.fromJson(response);
      //dataLoaded.value =true;
      //Utils.dateBengaliNewsDetailse(Utils.dateTimeFormat(newsDetails.value.news_date_time));
    } catch (e) {

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

  get_more_cat_news(String catid,String newsId) async {
    print("Calling API: "+ApiClient.more_cat_wise_news);
    moreCatNewsList.clear();
    try {
      final response = await http.get(Uri.parse(ApiClient.more_cat_wise_news+'/'+catid.toString()+'/'+newsId.toString()));
      print(response.body);
      List<ShowNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => ShowNewsResponse.fromJson(data))
          .toList();
      moreCatNewsList.addAll(list);
      print('moreNewsList: ${moreCatNewsList[0].title.toString()}');
      //dataLoaded.value = true;
    } on SocketException {

    }
  }

  get_tag_wise_news(String tag) async {
    print("Calling API: "+ApiClient.tag_wise_news);
    tagNewsList.clear();
    try {
      final response = await http.get(Uri.parse(ApiClient.tag_wise_news+'/'+tag));
      print(response.body);
      List<ShowNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => ShowNewsResponse.fromJson(data))
          .toList();
      tagNewsList.addAll(list);
      print('tagNewsList: ${tagNewsList[0].title.toString()}');
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
      dataLoaded.value = true;
      //Navigator.of(context).pop();
      //get_home_category();
      print('last_entry_newsList: ${last_entry_newsList[0].title.toString()}');

    } on SocketException {

    }
  }

  get_saradesh_top_news() async {
    print("Calling API: "+ApiClient.sara_desh_top_news);
    try {
      final response = await http.get(Uri.parse(ApiClient.sara_desh_top_news));
      print(response.body);
      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();

      saradesh_top_newsList.clear();
      saradesh_top_newsList.addAll(list);
      selectedPageIndex.value = 7;
      dataLoaded.value = true;
      //dataLoaded.value = true;
      //Navigator.of(context).pop();
      //get_home_category();
      print('last_entry_newsList: ${saradesh_top_newsList[0].title.toString()}');

    } on SocketException {

    }
  }

  get_division() async {
    print("Calling API: "+ApiClient.sara_desh_divisions);
    try {
      final response = await http.get(Uri.parse(ApiClient.sara_desh_divisions));
      print(response.body);
      List<Division> list = (json.decode(response.body) as List)
          .map((data) => Division.fromJson(data))
          .toList();

      division_list.clear();
      division_list.addAll(list);
      // selectedPageIndex.value = 7;
      // dataLoaded.value = true;
      //dataLoaded.value = true;
      //Navigator.of(context).pop();
      //get_home_category();
      print('division_list: ${division_list[0].division_name.toString()}');

    } on SocketException {

    }
  }
  get_district(int divisionId) async {
    print("Calling API: "+ApiClient.sara_desh_districts+divisionId.toString());
    try {
      final response = await http.get(Uri.parse(ApiClient.sara_desh_districts+divisionId.toString()));
      print(response.body);
      List<District> list = (json.decode(response.body) as List)
          .map((data) => District.fromJson(data))
          .toList();

      districtList.clear();
      districtList.addAll(list);
      // selectedPageIndex.value = 7;
      // dataLoaded.value = true;
      //dataLoaded.value = true;
      //Navigator.of(context).pop();
      //get_home_category();
      print('division_list: ${districtList[0].district_name.toString()}');

    } on SocketException {

    }
  }

  get_thana(int districtId) async {
    print("Calling API: "+ApiClient.sara_desh_thanas+districtId.toString());
    try {
      final response = await http.get(Uri.parse(ApiClient.sara_desh_thanas+districtId.toString()));
      print(response.body);
      List<Thana> list = (json.decode(response.body) as List)
          .map((data) => Thana.fromJson(data))
          .toList();

      thanaList.clear();
      thanaList.addAll(list);
      // selectedPageIndex.value = 7;
      // dataLoaded.value = true;
      //dataLoaded.value = true;
      //Navigator.of(context).pop();
      //get_home_category();
      print('Thana: ${districtList[0].district_name.toString()}');

    } on SocketException {

    }
  }

  get_saradesh_division_news(String divname) async {
    var url = ApiClient.sara_desh_division_news+'/'+divname.toString();
    print("Calling API: "+url);
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();

      saradesh_division_newsList.clear();
      saradesh_division_newsList.addAll(list);
      dataLoaded.value = true;
      //Navigator.of(context).pop();
      //get_home_category();
      print('last_entry_newsList: ${saradesh_division_newsList[0].title.toString()}');

    } on SocketException {

    }
  }

  get_saradesh_district_news(String id) async {
    var url = ApiClient.sara_desh_district_news+'/'+id;
    print("Calling API: "+url);
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);

      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();

      saradesh_district_newsList.clear();
      saradesh_district_newsList.addAll(list);
      dataLoaded.value = true;
      //dataLoaded.value = true;
      //Navigator.of(context).pop();
      //get_home_category();
      print('last_entry_newsList: ${saradesh_district_newsList[0].title.toString()}');

    } on SocketException {

    }
  }

  get_saradesh_thana_news(String thana_name) async {
    var url = ApiClient.sara_desh_thana_news+'/'+thana_name;
    print("Calling API: "+url);
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);

      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();

      saradesh_district_newsList.clear();
      saradesh_district_newsList.addAll(list);
      //dataLoaded.value = true;
      //dataLoaded.value = true;
      //Navigator.of(context).pop();
      //get_home_category();
      print('last_entry_newsList: ${saradesh_district_newsList[0].title.toString()}');

    } on SocketException {

    }
  }


  // get_saradesh_thana_news(String name) async {
  //   var url = ApiClient.sara_desh_thana_news+'/'+name;
  //   print("Calling API: "+url);
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     print(response.body);
  //     List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
  //         .map((data) => LastEntryNewsResponse.fromJson(data))
  //         .toList();
  //
  //     saradesh_thana_newsList.clear();
  //     saradesh_thana_newsList.addAll(list);
  //     dataLoaded.value = false;
  //     //dataLoaded.value = true;
  //     //Navigator.of(context).pop();
  //     //get_home_category();
  //     print('saradesh_thana_newsList: ${saradesh_thana_newsList[0].title.toString()}');
  //
  //   } on SocketException {
  //
  //   }
  // }

  get_home_category() async {
    home_categoryList.clear();
    category_list_with_news_newsList.clear();
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
      dataLoaded.value = true;

    } on SocketException {

    }
  }

  get_last_entry_news(BuildContext context) async {
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
      Navigator.of(context).pop();
      //get_home_category();
      print('last_entry_newsList: ${last_entry_newsList[0].title.toString()}');

    } on SocketException {

    }
  }

  get_most_view_news(BuildContext context) async {
    print("Calling API: "+ApiClient.most_view_news);
    try {
      final response = await http.get(Uri.parse(ApiClient.most_view_news));
      print(response.body);
      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();
      last_entry_newsList.clear();
      last_entry_newsList.addAll(list);
      //dataLoaded.value = true;
      Navigator.of(context).pop();
      //get_home_category();
      print('last_entry_newsList: ${last_entry_newsList[0].title.toString()}');

    } on SocketException {

    }
  }


  get_sub_categoryListOnly(int catId) async {
    sub_categoryList.clear();
    print("Calling API: "+ApiClient.sub_category_list+'/'+catId.toString());
    try {
      final response = await http.get(Uri.parse(ApiClient.sub_category_list+'/'+catId.toString()));
      print(response.body);
      List<CategoryResponse> list = (json.decode(response.body) as List)
          .map((data) => CategoryResponse.fromJson(data))
          .toList();
      sub_categoryList.addAll(list);
      //get_category_page_cat_wise_news(catId);



    } on SocketException {

    }
  }

  get_sub_category(int catId) async {
    sub_categoryList.clear();
    print("Calling API: "+ApiClient.sub_category_list);
    try {
      final response = await http.get(Uri.parse(ApiClient.sub_category_list+'/'+catId.toString()));
      print(response.body);
      List<CategoryResponse> list = (json.decode(response.body) as List)
          .map((data) => CategoryResponse.fromJson(data))
          .toList();
      sub_categoryList.addAll(list);
      get_category_page_cat_wise_news(catId);



    } on SocketException {

    }
  }

  ajker_paper_sub_category() async {
    ajkert_paper_sub_categoryList.clear();
    print("Calling API: "+ApiClient.ajker_paper_sub_cats);
    try {
      final response = await http.get(Uri.parse(ApiClient.ajker_paper_sub_cats));
      print(response.body);
      List<CategoryResponse> list = (json.decode(response.body) as List)
          .map((data) => CategoryResponse.fromJson(data))
          .toList();
      ajkert_paper_sub_categoryList.addAll(list);
      ajkert_paper_sub_categoryList.forEach((element) {
        get_ajker_paper_subcategory_wise_newsList(element);
      });

    } on SocketException {

    }
  }

  ajker_paper_sub_categoryOnly() async {
    ajkert_paper_sub_categoryList.clear();
    print("Calling API: "+ApiClient.ajker_paper_sub_cats);
    try {
      final response = await http.get(Uri.parse(ApiClient.ajker_paper_sub_cats));
      print(response.body);
      List<CategoryResponse> list = (json.decode(response.body) as List)
          .map((data) => CategoryResponse.fromJson(data))
          .toList();
      ajkert_paper_sub_categoryList.addAll(list);
      // ajkert_paper_sub_categoryList.forEach((element) {
      //   get_ajker_paper_subcategory_wise_newsList(element);
      // });

    } on SocketException {

    }
  }



  get_subcategory_wise_newsList(CategoryResponse categoryResponse) async {
    subcategory_list_with_news_newsList.clear();
    print("Calling API: "+ApiClient.category_wise_news+'/'+categoryResponse.id.toString());
    List<LastEntryNewsResponse> newsList = <LastEntryNewsResponse>[];
    try {
      final response = await http.get(Uri.parse(ApiClient.category_wise_news+'/'+categoryResponse.id.toString()));
      print(response.body.toString());
      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();
      newsList.addAll(list);

      var data = HomeCategoryWithNewsList(categoryResponse.cat_name,categoryResponse.id,newsList);
      subcategory_list_with_news_newsList.add(data);
      dataLoaded.value = true;
      // print('category_wise_newsList: ${category_wise_newsList[0].title.toString()}');
      //return category_wise_newsList;
    } on SocketException {

    }
  }

  get_ajker_paper_subcategory_wise_newsList(CategoryResponse categoryResponse) async {
    ajker_paper_subcategory_list_with_newsList.clear();
    print("Calling API: "+ApiClient.ajker_paper_sub_cats_wise_news+'/'+categoryResponse.id.toString());
    List<LastEntryNewsResponse> newsList = <LastEntryNewsResponse>[];
    try {
      final response = await http.get(Uri.parse(ApiClient.ajker_paper_sub_cats_wise_news+'/'+categoryResponse.id.toString()));
      print(response.body.toString());
      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();
      newsList.addAll(list);

      var data = HomeCategoryWithNewsList(categoryResponse.cat_name,categoryResponse.id,newsList);
      ajker_paper_subcategory_list_with_newsList.add(data);
      dataLoaded.value = true;
      // print('category_wise_newsList: ${category_wise_newsList[0].title.toString()}');
      //return category_wise_newsList;
    } on SocketException {

    }
  }

  get_ajker_cat_newsList(int id) async {
    category_wise_newsList.clear();
    print("Calling API: "+ApiClient.ajker_paper_sub_cats_wise_news+'/'+id.toString());
    try {
      final response = await http.get(Uri.parse(ApiClient.ajker_paper_sub_cats_wise_news+'/'+id.toString()));
      print(response.body.toString());
      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();
      category_wise_newsList.addAll(list);


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

  get_category_page_cat_wise_news(int catId) async {
    category_wise_newsList.clear();
    print("Calling API: "+ApiClient.category_wise_news+'/'+catId.toString());

    try {
      final response = await http.get(Uri.parse(ApiClient.category_wise_news+'/'+catId.toString()));
      print(response.body.toString());
      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();
      category_wise_newsList.addAll(list);
      dataLoaded.value = true;
      subcategory_list_with_news_newsList.clear();
      sub_categoryList.forEach((element) {
        get_subcategory_wise_newsList(element);

      });



    } on SocketException {

    }
  }

  get_category_page_subcat_wise_news(int catId) async {
    category_wise_newsList.clear();
    print("Calling API: "+ApiClient.category_wise_news+'/'+catId.toString());

    try {
      final response = await http.get(Uri.parse(ApiClient.category_wise_news+'/'+catId.toString()));
      print(response.body.toString());
      List<LastEntryNewsResponse> list = (json.decode(response.body) as List)
          .map((data) => LastEntryNewsResponse.fromJson(data))
          .toList();
      category_wise_newsList.addAll(list);
      dataLoaded.value = true;
      subcategory_list_with_news_newsList.clear();



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

  get_last_photo_album() async {
    last_photo_albumList.clear();
    print("last_photo_album API: "+ApiClient.last_photo_album);
    try {
      final response = await http.get(Uri.parse(ApiClient.last_photo_album));
      print(response.body);
      List<LastPhotoAlbam> list = (json.decode(response.body) as List)
          .map((data) => LastPhotoAlbam.fromJson(data))
          .toList();
      last_photo_albumList.addAll(list);

    } on SocketException {

    }
  }

  get_all_online_poll(int page) async {

    print("API: "+ApiClient.all_online_poll+page.toString());
    try {
      final response = await http.get(Uri.parse(ApiClient.all_online_poll+page.toString()));
      print(response.body);

      dataLoaded.value = true;

      Map<String, dynamic> user = jsonDecode(response.body);
      var datanews = jsonEncode(user['data']);
      print('datanews: ${datanews}');
      all_online_pole.clear();
      Map<String, dynamic> newsdata = jsonDecode(datanews);
      newsdata.forEach((k, v) =>
      all_online_pole.add(v)
      );
      print('newslenth: ${all_online_pole.length}');

    } on SocketException {

    }
  }

  get_all_latest_news(int page) async {
    all_latest_newsList.clear();

    print("API: "+ApiClient.all_latest_news+page.toString());
    try {
      final response = await http.get(Uri.parse(ApiClient.all_latest_news+page.toString()));
      print(response.body);

      dataLoaded.value = true;
      //var jsonData = json.decode(response.body);
      //var jsonData = json.decode(response.body) as Map<String, dynamic>;


      Map<String, dynamic> user = jsonDecode(response.body);
      var datanews = jsonEncode(user['data']);
     // print('datanews: ${datanews}');
      print('datanews: ${datanews}');


      Map<String, dynamic> newsdata = jsonDecode(datanews);
      newsdata.forEach((k, v) =>
          //print("Key : $k, Value : $v")
          all_latest_newsList.add(v)
      );
      print('newslenth: ${all_latest_newsList.length}');

    } on SocketException {

    }
  }

  get_all_most_view_news(int page) async {
    // all_latest_newsList.clear();
    // dataLoaded.value = false;
    // selectedPageIndex.value = 5;
    // if(button.value == 1){
    //   last_most_text.value = 'সর্বশেষ সব খবর';
    //   //get_all_latest_news(1);
    // }else{
    //   last_most_text.value = 'সর্বাধিক পঠিত';
    //   //get_all_most_view_news(1);
    // }
    print("API: "+ApiClient.all_most_viewed_news+page.toString());
    try {
      final response = await http.get(Uri.parse(ApiClient.all_most_viewed_news+page.toString()));
      print(response.body);
      dataLoaded.value = true;
      //var jsonData = json.decode(response.body);
      //var jsonData = json.decode(response.body) as Map<String, dynamic>;


      Map<String, dynamic> user = jsonDecode(response.body);
      var datanews = jsonEncode(user['data']);
      // print('datanews: ${datanews}');
      print('datanews: ${datanews}');


      Map<String, dynamic> newsdata = jsonDecode(datanews);
      newsdata.forEach((k, v) =>
      //print("Key : $k, Value : $v")
      all_latest_newsList.add(v)
      );
      print('newslenth: ${all_latest_newsList.length}');

    } on SocketException {

    }
  }

  getPhotoCats() async {
    photo_cts.clear();
    cat_wise_photoList.clear();
    var url = ApiClient.photo_cats;
    print("API photo_cats: "+url);
    try {
      final response = await http.get(Uri.parse(url));
      print('photo_cats: '+response.body);

      List jsonResponse = json.decode(response.body);
      photo_cts = jsonResponse.map((job) => new PhotoCts.fromJson(job)).toList();

      photo_cts.forEach((element) {

        get_cat_wise_photo(element.url_dis_title.toString());
      });


      dataLoaded.value = true;
      print('photo_catslenth: ${photo_cts[0].cat_name}');
      selectedPageIndex.value = 13;
    } on SocketException {

    }
  }

  get_cat_wise_photo(String ct) async {

    var url = ApiClient.photo_album_cat+"/"+ct;
    print("API: "+url);

    //Ui.showLoaderDialog(Get.context);
    APIManager _manager = APIManager();
    var response;
    try {
      response = await _manager.get(url);
      print('cat_wise_photoListResponse: ${response}');

      if(response != null){
        //cat_wise_photoListResponse = CtwisePhotoRersponse.fromJson(response);
        print('cat_wise_photoListResponse: ${CtwisePhotoRersponse.fromJson(response).data!.length}');
        cat_wise_photoList.clear();
        cat_wise_photoList.addAll(CtwisePhotoRersponse.fromJson(response).data!);
        //Navigator.of(Get.context).pop();
      }

    } catch (e) {

    }


  }

  get_cat_wise_video(int page,BuildContext context) async {
    var url = ApiClient.cat_wise_videos+"/"+vidDataInfo.value.video_cat_id.toString()+'?page='+page.toString();
    print("API: "+url);
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);

      //var jsonData = json.decode(response.body);
      //var jsonData = json.decode(response.body) as Map<String, dynamic>;


      Map<String, dynamic> user = jsonDecode(response.body);
      var datanews = jsonEncode(user['data']);
      // print('datanews: ${datanews}');
      print('datanews: ${datanews}');


      Map<String, dynamic> newsdata = jsonDecode(datanews);
      newsdata.forEach((k, v) =>
      //print("Key : $k, Value : $v")
      cat_wise_vidList.add(v)
      );
      dataLoaded.value = true;
      print('newslenth: ${all_cat_wise_newsList.length}');

    } on SocketException {

    }
  }

  get_all_cat_wise_news(int page,BuildContext context) async {
    var url = ApiClient.all_cat_wise_news+"/"+catId.value.toString()+'?page='+page.toString();
    print("API: "+url);
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);

      //var jsonData = json.decode(response.body);
      //var jsonData = json.decode(response.body) as Map<String, dynamic>;


      Map<String, dynamic> user = jsonDecode(response.body);
      var datanews = jsonEncode(user['data']);
      // print('datanews: ${datanews}');
      print('datanews: ${datanews}');


      Map<String, dynamic> newsdata = jsonDecode(datanews);
      newsdata.forEach((k, v) =>
      //print("Key : $k, Value : $v")
      all_cat_wise_newsList.add(v)
      );
      dataLoaded.value = true;
      //print('newslenth: ${all_cat_wise_newsList.length}');

    } on SocketException {

    }
  }

  get_event_news_paginate(int page) async {
    var url = ApiClient.event_news_paginate+'/'+spc_event_tag_id.value+'?page='+page.toString();
    print("API: "+url);
    try {
      final response = await http.get(Uri.parse(url));
      print('Arobuttonnews: '+response.body);

      //var jsonData = json.decode(response.body);
      //var jsonData = json.decode(response.body) as Map<String, dynamic>;


      Map<String, dynamic> user = jsonDecode(response.body);
      var datanews = jsonEncode(user['data']);
     // print('datanews: ${datanews}');
      print('datanews: ${datanews}');


      Map<String, dynamic> newsdata = jsonDecode(datanews);
      newsdata.forEach((k, v) =>
          //print("Key : $k, Value : $v")
      detail_page_aro_button_newsList.add(v)
      );
      print('newslenth: ${detail_page_aro_button_newsList.length}');

    } on SocketException {

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
    print("Calling API: "+ApiClient.cat_extra_link);
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


  Widget CustomRadioButton(String text, int index,BuildContext  context) {
    return FlatButton(

      //color: (button.value == index) ? Colors.black : Colors.white,
      color: (button.value == index) ? Colors.black : Colors.white,
      onPressed: () {
        button.value = index;
        if(button.value == 1){
          Ui.showLoaderDialog(context);
          get_last_entry_news(context);

        }else{
          Ui.showLoaderDialog(context);
          get_most_view_news(context);
          //Navigator.of(context).pop();
        }
      },
     // child: Expanded(
          child:Container(
            width: Get.width/3,

              child:Center(child: Text(
                text,
                style: TextStyle(
                  color: (button.value == index) ? Colors.white : Colors.black,
                ),
              ),),
              decoration: BoxDecoration(
                color: (button.value == index) ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
               ),
         //),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //borderSide: BorderSide(color: (button.value == index) ? Colors.green : Colors.black),

    );
  }

  getDrawerItemWidget(int pos) {
    switch (pos) {
        case 0:
        return new HomeFragment();
        case 1:
        return new NewsDetailseFragment();
        case 2:
        return new SubCatFragment();
        case 3:
        return new AjkerPaperFragment();
        case 4:
        return new EpaperFragment();
        case 5:
        return new SobKhoborFragment();
        case 6:
        return new SobKhoborCatWiseFragment();
        case 7:
        return new SaraDeshFragment();
        case 8:
        return new SaraDeshDistrictFragment();
        case 9:
        return new SaraDeshThanaFragment();
        case 10:
        return new SearchFragment();
        case 11:
        return new VideoFragment();
        case 12:
        return new AllPollFragment();
        case 13:
        return new PhotoGalFragment();






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

  void prayerTime() {



    tz.initializeTimeZones();
    //final location = tz.getLocation('America/New_York');
    final location = tz.getLocation('Asia/Dhaka');

    // Definitions
    DateTime date = tz.TZDateTime.from(DateTime.now(), location);
    Coordinates coordinates = Coordinates(23.8103, 90.4125);

    // Parameters
    CalculationParameters params = CalculationMethod.MuslimWorldLeague();
    params.madhab = Madhab.Hanafi;
    PrayerTimes prayerTimes =
    PrayerTimes(coordinates, date, params, precision: true);

    // Prayer times
    DateTime fajrTime = tz.TZDateTime.from(prayerTimes.fajr!, location);
    DateTime sunriseTime = tz.TZDateTime.from(prayerTimes.sunrise!, location);
    DateTime dhuhrTime = tz.TZDateTime.from(prayerTimes.dhuhr!, location);
    DateTime asrTime = tz.TZDateTime.from(prayerTimes.asr!, location);
    DateTime maghribTime = tz.TZDateTime.from(prayerTimes.maghrib!, location);
    DateTime ishaTime = tz.TZDateTime.from(prayerTimes.isha!, location);

    DateTime ishabeforeTime =
    tz.TZDateTime.from(prayerTimes.ishabefore!, location);
    DateTime fajrafterTime = tz.TZDateTime.from(prayerTimes.fajrafter!, location);

    // Convenience Utilities
    String current =
    prayerTimes.currentPrayer(date: DateTime.now()); // date: date
    DateTime? currentPrayerTime = prayerTimes.timeForPrayer(current);
    String next = prayerTimes.nextPrayer();
    DateTime? nextPrayerTime = prayerTimes.timeForPrayer(next);

    // Sunnah Times
    SunnahTimes sunnahTimes = SunnahTimes(prayerTimes);
    DateTime middleOfTheNight =
    tz.TZDateTime.from(sunnahTimes.middleOfTheNight, location);
    DateTime lastThirdOfTheNight =
    tz.TZDateTime.from(sunnahTimes.lastThirdOfTheNight, location);

    List<String> sunriseStr = sunriseTime.toString().split('.');
    print('sunriseTime formatted'+DateFormat('hh:mm a').format(DateTime.parse(sunriseStr[0])));
    var sunrise = DateFormat('hh:mm a').format(DateTime.parse(sunriseStr[0])).toString();

    List<String> sunriseStrFinal = sunrise.split(' ');
    print('sunriseTime final'+sunriseStrFinal[0]);
    timeSunrise.value = Utils.replaceEngNumberToBangla(sunriseStrFinal[0]);

    List<String> fozorStr = fajrTime.toString().split('.');
    var fozor = DateFormat('hh:mm a').format(DateTime.parse(fozorStr[0])).toString();
    List<String> FozorStrFinal = fozor.split(' ');
    timeFojor.value = Utils.replaceEngNumberToBangla(FozorStrFinal[0]);

    List<String> zohorrStr = dhuhrTime.toString().split('.');
    var zohor = DateFormat('hh:mm a').format(DateTime.parse(zohorrStr[0])).toString();
    List<String> zohorStrFinal = zohor.split(' ');
    timeZuhor.value = Utils.replaceEngNumberToBangla(zohorStrFinal[0]);


    List<String> asorStr = asrTime.toString().split('.');
    var asor = DateFormat('hh:mm a').format(DateTime.parse(asorStr[0])).toString();
    List<String> asorStrFinal = asor.split(' ');
    timeAsor.value = Utils.replaceEngNumberToBangla(asorStrFinal[0]);

    List<String> magribStr = maghribTime.toString().split('.');
    var magrib = DateFormat('hh:mm a').format(DateTime.parse(magribStr[0])).toString();
    List<String> magribStrFinal = magrib.split(' ');
    timeMagrib.value = Utils.replaceEngNumberToBangla(magribStrFinal[0]);

    List<String> isahStr = ishaTime.toString().split('.');
    var isah = DateFormat('hh:mm a').format(DateTime.parse(isahStr[0])).toString();
    List<String> isahStrStrFinal = isah.split(' ');
    timeIsha.value = Utils.replaceEngNumberToBangla(isahStrStrFinal[0]);


   //  // Qibla Direction
   //  var qiblaDirection = Qibla.qibla(coordinates);
   //
   //  print('***** Current Time');
   // // print('fajrTime formatted'+DateFormat('hh:mm a').format(DateTime.parse('2022-06-28 20:11:43')));
   //  print('local time:\t$date');
   //
   //  print('\n***** Prayer Times');
   //  print('fajrTime:\t$fajrTime');
   //  print('sunriseTime:\t$sunriseTime');
   //  print('dhuhrTime:\t$dhuhrTime');
   //  print('asrTime:\t$asrTime');
   //  print('maghribTime:\t$maghribTime');
   //  print('ishaTime:\t$ishaTime');
   //
   //  print('ishabeforeTime:\t$ishabeforeTime');
   //  print('fajrafterTime:\t$fajrafterTime');
   //
   //  print('\n***** Convenience Utilities');
   //  print('current:\t$current\t$currentPrayerTime');
   //  print('next:   \t$next\t$nextPrayerTime');
   //
   //  print('\n***** Sunnah Times');
   //  print('middleOfTheNight:  \t$middleOfTheNight');
   //  print('lastThirdOfTheNight:  \t$lastThirdOfTheNight');
   //
   //  print('\n***** Qibla Direction');
   //  print('qibla:  \t$qiblaDirection');
  }


  String check_two_times_is_before(String end_time){
    // var format = DateFormat("HH:mm");
    // var start = format.parse(start_time);
    // var end = format.parse(end_time);
    //
    // if(start.isAfter(end)) {
    //   end = end.add(Duration(days: 1));
    //   Duration diff = end.difference(start);
    //   final hours = diff.inHours;
    //   final minutes = diff.inMinutes % 60;
    //   print('$hours hours $minutes minutes');
    // }

    String str = '';
    final f = new DateFormat('yyyy-MM-dd hh:mm:ss');

    print('CurrentTime: '+f.format(new DateTime.now()));

    //DateTime dt1 = DateTime.parse("2021-12-23 11:47:00");
    DateTime dt1 = DateTime.parse(f.format(new DateTime.now()));
    DateTime dt2 = DateTime.parse(end_time);

    Duration diff = dt1.difference(dt2);
    print("diff:" + diff.toString());
    print("DT1:" + dt1.toString());
    print("DT2:" + dt2.toString());



    int days = diff.inDays;
    int hours = diff.inHours % 24;
    int minutes = diff.inMinutes % 60;
    int seconds = diff.inSeconds % 60;
    print("Difference in Days: " + days.toString());
    print("Difference in Hours: " + hours.toString());
    print("Difference in Minutes: " + minutes.toString());
    print("Difference in Seconds: " + seconds.toString());
    if(diff.inDays > 0){
      str = diff.inDays.toString();
    }
    if(diff.inHours > 0){
      str = diff.inHours.toString();
    }

    if(diff.inMinutes >= 60){
      if(diff.inHours > 0){
        str = diff.inHours.toString();
      }
    }else{
      str = diff.inMinutes.toString();
    }

    print("returnTimeDiff: " + str);

    return str;

  }

}

class VideoData {
  var fullImage = "";
}
