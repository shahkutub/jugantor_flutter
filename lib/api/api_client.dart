class ApiClient {
  String api_token = '';
  static String baseUrl = 'https://www.jugantor.com/';

  static String today_bn_date = '${baseUrl}api/ver1/today_bn_date';
  static String category = '${baseUrl}api/ver1/category_list';
  static String home_category = '${baseUrl}api/ver1/category_list_body';
  static String leadnews = '${baseUrl}api/ver1/lead_news';
  static String cat_extra_link = '${baseUrl}api/ver1/cat_extra_link';
  static String show_news = '${baseUrl}api/ver1/show_news';
  static String last_entry_news = '${baseUrl}api/ver1/last_entry_news';
  static String most_view_news = '${baseUrl}api/ver1/most_view_news';
  static String category_wise_news = '${baseUrl}api/ver1/category_wise_news';
  static String last_photo_album = '${baseUrl}api/ver1/last_photo_album';
  static String last_three_videos = '${baseUrl}api/ver1/last_three_videos';
  static String cat_wise_videos = '${baseUrl}api/ver1/video_list_cat';
  static String photo_album_cat = '${baseUrl}api/ver1/photo_album_cat';
  static String last_online_poll = '${baseUrl}api/ver1/last_online_poll';


  static String newsDetails = '${baseUrl}api/ver1/news';
  static String more_cat_wise_news = '${baseUrl}api/ver1/more_cat_wise_news';
  static String tag_wise_news = '${baseUrl}api/ver1/tag_wise_news';
  static String tag_name = '${baseUrl}api/ver1/event_stream';
  static String event_news_paginate = '${baseUrl}api/ver1/event_news_paginate';


  static String sub_category_list = '${baseUrl}api/ver1/sub_category_list';


  static String ajker_paper_sub_cats = '${baseUrl}api/ver1/todays_sub_cats';
  static String ajker_paper_sub_cats_wise_news = '${baseUrl}api/ver1/todays_subcat_wise_news';



  static String all_latest_news = '${baseUrl}api/ver1/all_latest_news?page=';
  static String all_most_viewed_news = '${baseUrl}api/ver1/all_most_viewed_news?page=';
  static String all_cat_wise_news = '${baseUrl}api/ver1/all_cat_wise_news';

  static String all_online_poll = '${baseUrl}api/ver1/all_online_poll?page=';


  static String sara_desh_top_news = '${baseUrl}api/ver1/category_wise_news_21/11';
  static String sara_desh_division_news = '${baseUrl}api/ver1/division_news';
  static String sara_desh_district_news = '${baseUrl}api/ver1/district_news';
  static String sara_desh_thana_news = '${baseUrl}api/ver1/thana_news';
  static String sara_desh_divisions = '${baseUrl}api/ver1/divisions';
  static String sara_desh_districts = '${baseUrl}api/ver1/districts/';
  static String sara_desh_thanas = '${baseUrl}api/ver1/thanas/';



}
