class ApiClient {
  String api_token = '';
  static String baseUrl = 'https://www.jugantor.com/';

  static String today_bn_date = '${baseUrl}api/ver1/today_bn_date';
  static String category = '${baseUrl}api/ver1/category_list';
  static String home_category = '${baseUrl}api/ver1/category_list_body';
  static String leadnews = '${baseUrl}api/ver1/lead_news';
  static String cat_extra_link = '${baseUrl}api/ver1/cat_extra_link';
  static String show_news = '${baseUrl}api/ver1/show_news';


}
