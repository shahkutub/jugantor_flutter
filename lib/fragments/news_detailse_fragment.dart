import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';
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
                      Text(homeController.newsDetails.value.title!,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),
                        textAlign: TextAlign.justify,

                      ),

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

                          GestureDetector(
                            child:Container(
                              //height: 80,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/facebook.svg',
                                height: 35, width: 35,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff4469B3),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(
                            child:Container(
                              //height: 80,
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/images/messenger.svg',
                                height: 30, width: 30,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff00B0ED),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
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
                        alignment: Alignment.centerLeft,
                        color: Color(0xff3B5998),
                        padding: EdgeInsets.all(7),
                        child: Text("আরও খবর",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.white)),
                      ),

                      SizedBox( height:20),
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