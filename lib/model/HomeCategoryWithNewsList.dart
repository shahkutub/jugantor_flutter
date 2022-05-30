
import 'package:jugantor.com/model/LastEntryNewsResponse.dart';

class HomeCategoryWithNewsList{
  String cat_name;
  int id;
  List<LastEntryNewsResponse> category_wise_newsList = List<LastEntryNewsResponse>();

  HomeCategoryWithNewsList(this.cat_name, this.id, this.category_wise_newsList);


}