import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/rich_text_parser.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';
import 'package:flutter_html/flutter_html.dart';
class NewsDetailseFragment extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    double height = Get.height;
    double width = Get.width;

    return new Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Obx(() {
          if(homeController.dataLoaded.isTrue){
            return new SingleChildScrollView(
               // controller: homeController.scrollController.value,
                child: Container(
                  child:Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Text("প্রচ্ছদ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                          Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                          Obx(() =>
                              Visibility(visible: true,child:Text(""+homeController.categoryName.value,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.blue),),),
                          ),

                        ],
                      ),
                      SizedBox(height: 20,),

                      //news title
                      Text(homeController.newsDetails.value.title,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),
                        textAlign: TextAlign.justify,

                      ),

                      //news reporter name
                      Row(
                        children: <Widget>[
                          Icon(Icons.person, color: Colors.blueGrey ),
                          Text(" "+homeController.newsDetails.value.reporter,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey),),
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

                          GestureDetector(
                            child:Container(
                              //height: 80,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/facebook.svg',
                                height: 40, width: 40,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.indigoAccent,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(
                            child:Container(
                              //height: 80,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/messenger.svg',
                                height: 40, width: 40,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.indigoAccent,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),

                          SizedBox(width: 10,),
                          GestureDetector(
                            child:Container(
                              //height: 80,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/twitter.svg',
                                height: 40, width: 40,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.indigoAccent,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(
                            child:Container(
                              //height: 80,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/whatsapp.svg',
                                height: 40, width: 40,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.indigoAccent,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
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
                                color: Colors.indigoAccent,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),

                        ],
                      ),
                      Html(data: "<html>\n" +
                          "<head>\n" +
                          "<style type=\"text/css\">\n" +
                          "\tp{\n" +
                          "\t\ttext-align: justify;\n" +
                          "\t\tfont-family: SolaimanLipi;\n" +
                          "\t}\n" +
                          "</style>\n" +
                          "</head>\n" +
                          "\n" +
                          "<body>\n" +
                          homeController.newsDetails.value.detail +
                          "</body>\n" +
                          "</html>",
                        defaultTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),


                          ),

                    ],
                  ),
                  // child: Row(
                  //   children: <Widget>[
                  //     Text("প্রচ্ছদ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                  //     Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                  //     Obx(() =>
                  //         Visibility(visible: true,child:Text(""+homeController.categoryName.value,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.blue),),),
                  //     ),
                  //
                  //   ],
                  // ),
                )

            );
          }else{
            return Center(child: CircularProgressIndicator());
          }

        })
    );

    // return new Container(
    //     child: Obx(() {
    //       if (homeController.dataLoaded.isTrue) {
    //         return new SingleChildScrollView(
    //             //controller: homeController.scrollController.value,
    //             child: Container(
    //               child: Column(
    //
    //                 children: <Widget>[
    //
    //                   Obx(() =>
    //                       Container(
    //                         margin: EdgeInsets.only(top: 15, bottom: 5, right: 20, left: 20),
    //                         child:Obx(() {
    //                           return Row(
    //                             children: [
    //                               // Text("প্রচ্ছদ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
    //                               // Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),

    //                               Obx(() =>
    //                                   Visibility(visible: true,child:Text(""+homeController.categoryName.value,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.blue),),),
    //                               ),
    //                               //Text(" >> ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
    //                             ],
    //                           );
    //                         })
    //
    //                       )
    //                   ),
    //
    //
    //                 ],
    //               ),
    //             )
    //
    //         );
    //       } else {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //     })
    // );
  }
}