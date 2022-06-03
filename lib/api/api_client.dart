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


  static String newsDetails = '${baseUrl}api/ver1/news';
  static String more_cat_wise_news = '${baseUrl}api/ver1/more_cat_wise_news';
  static String tag_wise_news = '${baseUrl}api/ver1/tag_wise_news';



}
