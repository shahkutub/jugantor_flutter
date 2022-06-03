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

                     // SizedBox( height:20),

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
                                  //Get.back();
                                  // if(homeController.showNewsList[index].cat_name == "প্রচ্ছদ"){
                                  //   //homeController.selectedIndex.value = 0;
                                  // }else{
                                  //   // homeController.selectedIndex.value = 1;
                                  // }
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

                      SizedBox( height:20),

                      Container(
                          margin: EdgeInsets.only(left: 0,right: 0),
                          //alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(child: homeController.CustomRadioButton("সর্বশেষ", 1),flex: 1,),
                              SizedBox(width: 20,),
                              Flexible(child: homeController.CustomRadioButton("সর্বাধিক পঠিত", 2),flex: 1,),

                            ],
                          )
                      ),


                      Obx(() =>
                          Container(
                              margin: EdgeInsets.only(top: 10,bottom: 5,right: 0,left: 0),
                              alignment: Alignment.center,
                              child:ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                // Let the ListView know how many items it needs to build.
                                itemCount: homeController.last_entry_newsList.length,
                                // Provide a builder function. This is where the magic happens.
                                // Convert each item into a widget based on the type of item it is.
                                itemBuilder: (context, index) {
                                  final item = homeController.last_entry_newsList[index];

                                  return Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child:   GestureDetector(
                                        onTap: (){
                                          //Get.back();
                                          // if(homeController.showNewsList[index].cat_name == "প্রচ্ছদ"){
                                          //   //homeController.selectedIndex.value = 0;
                                          // }else{
                                          //   // homeController.selectedIndex.value = 1;
                                          // }
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
                                                        child: homeController.last_entry_newsList[index].video_dis  == 1 ?
                                                        Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),

                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Flexible(child: Text(homeController.last_entry_newsList[index].title!,
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
                                       // Let the ListView know how many items it needs to build.
                                       itemCount: homeController.tagNewsList.length,
                                       // Provide a builder function. This is where the magic happens.
                                       // Convert each item into a widget based on the type of item it is.
                                       itemBuilder: (context, index) {

                                         return Container(
                                             margin: EdgeInsets.only(top: 8),
                                             child:   GestureDetector(
                                               onTap: (){
                                                 //Get.back();
                                                 // if(homeController.showNewsList[index].cat_name == "প্রচ্ছদ"){
                                                 //   //homeController.selectedIndex.value = 0;
                                                 // }else{
                                                 //   // homeController.selectedIndex.value = 1;
                                                 // }
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
                                                               child: homeController.tagNewsList[index].video_dis  == 1 ?
                                                               Text("") : Image.asset("assets/images/video_icon.png", height: 30, width: 30,),

                                                             ),
                                                           ],
                                                         ),
                                                       ),
                                                       Flexible(child: Text(homeController.tagNewsList[index].title!,
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