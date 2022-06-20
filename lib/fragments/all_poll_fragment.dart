import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';

class AllPollFragment extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    double height = Get.height;
    double width = Get.width;


    return new Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Obx(() {
          if(homeController.dataLoaded.isTrue){
            return new SingleChildScrollView(
              controller: homeController.scrollController.value,

                child: Container(
                  child:Column(
                    children: [
                      //top
                      Container(
                        padding: EdgeInsets.all(5),
                        //decoration: BoxDecoration(color: Colors.grey),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: <Widget>[
                            Container(
                              //height: 80,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    GestureDetector(
                                      onTap: (){

                                      },
                                      child:Text("প্রচ্ছদ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                                    ),

                                    Text("   >>",style: TextStyle(color: Colors.grey,fontSize: 15),),
                                    Text("     অনলাইন জরিপ",style: TextStyle(color: Colors.black,fontSize: 15),)


                                  ],
                                ),
                            ),

                          ],
                        ),
                      ),

                     SizedBox(
                       height: 20,
                     ),

                     Stack(
                       children: [

                         Align(
                           child: Container(
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.all(Radius.circular(5)),
                                 border: Border.all(color: Color(0xffD37D2A))
                               //color: Colors.amber,
                             ),
                             padding: EdgeInsets.all(15),
                             //height: Get.height,
                             width: Get.width,
                             margin: EdgeInsets.only(top: 17),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,

                               children: [
                                 SizedBox(height: 20,),
                                 Container(
                                   margin: EdgeInsets.all(10),
                                   child: Column(
                                     children: [
                                       Text(
                                         homeController.last_online_pollResponse.value.ques!
                                         ,style: TextStyle(
                                           color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold
                                       ),
                                         textAlign: TextAlign.justify,
                                       ),
                                       SizedBox(height: 20,),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: <Widget>[
                                           Transform.scale(
                                             scale: 1.5,
                                             child:  Radio(
                                               value: 1,
                                               groupValue: homeController.id.value,
                                               onChanged: (val) {
                                                 homeController.radioButtonItem.value = 'হ্যাঁ';
                                                 homeController.id.value = 1;
                                               },
                                               toggleable: true,
                                             ),
                                           ),

                                           Text(
                                             'হ্যাঁ',
                                             style: new TextStyle(fontSize: 17.0),
                                           ),

                                           Transform.scale(
                                             scale: 1.5,
                                             child:Radio(
                                               value: 2,
                                               groupValue: homeController.id.value,
                                               onChanged: (val) {
                                                 homeController.radioButtonItem.value = 'না';
                                                 homeController.id.value = 2;
                                               },
                                             ),
                                           ),

                                           Text(
                                             'না',
                                             style: new TextStyle(
                                               fontSize: 17.0,
                                             ),
                                           ),

                                           Transform.scale(
                                             scale: 1.5,
                                             child: Radio(
                                               value: 3,
                                               groupValue: homeController.id.value,
                                               onChanged: (val) {
                                                 homeController.radioButtonItem.value = 'মন্তব্য নেই';
                                                 homeController.id.value = 3;
                                               },
                                             ),
                                           ),

                                           Text(
                                             'মন্তব্য নেই',
                                             style: new TextStyle(fontSize: 17.0),
                                           ),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                                 SizedBox(height: 20,),
                                 Container(
                                   alignment: Alignment.center,
                                   child: GestureDetector(
                                     child:Container(
                                       padding: EdgeInsets.all(10),
                                       margin: EdgeInsets.only(left: 100,right: 100),
                                       alignment: Alignment.center,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10),
                                           color: Colors.green
                                       ),
                                       child: Text('মতামত দিন',style: TextStyle(color: Colors.white),),
                                     ),
                                   ),

                                 ),
                                 SizedBox(height: 20,),
                               ],

                             ),
                           ),
                           alignment: Alignment.topCenter,

                         ),
                         Align(
                           child: Container(

                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.all(Radius.circular(10)),
                               color: Color(0xffD37D2A),
                             ),
                             child: Text('অনলাইন জরিপ',style: TextStyle(color: Colors.white),),
                             padding: EdgeInsets.all(10),
                           ),
                           alignment: Alignment.topCenter,
                         ),



                       ],
                     ),

                      SizedBox(
                        height: 20,
                      ),


                      Stack(
                        children: [

                          Align(
                            child:Expanded(
                              child: Container(
                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(color: Color(0xffD37D2A)),
                                  color: Color(0xffF0F0ED)
                                  //color: Colors.amber,
                                ),
                                //padding: EdgeInsets.all(15),
                                //height: Get.height,

                                width: Get.width,
                                margin: EdgeInsets.only(top: 17),
                                child: Container(

                                    child: Obx(() => ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: homeController.all_online_pole.length,
                                        itemBuilder: (BuildContext context, int index) {

                                          var votes = homeController.all_online_pole[index]["votes"];
                                          var regex = RegExp("i:\\d+");
                                          var nn = regex.allMatches(votes).map((e) => e.input.split(':')[1]);

                                          // { o -> o.value.split(':')[1]
                                          // }

                                           List<String> voteList = [];
                                          nn.forEach((element) {
                                            voteList.add(element);
                                            print(''+element.toString());
                                          });

                                          // nn.forEach{
                                          // voteList.add(it)
                                          // //println(it)
                                          // }


                                          // val y = voteList[1].toFloat()
                                          // val n = voteList[3].toFloat()
                                          // val nc = voteList[5].toFloat()
                                          // val total = y + n + nc
                                          // val yp = y / total * 100
                                          // val np = n / total * 100
                                          // val ncp = nc / total * 100

                                          return Column(
                                            children: [

                                              // Expanded(
                                              //   child:
                                              Container(
                                                  padding: EdgeInsets.all(10.0),
                                                 // color: Colors.grey,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        homeController.all_online_pole[index]["ques"],
                                                        style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),
                                                        textAlign: TextAlign.center,
                                                      ),

                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        children:[
                                                          Expanded(
                                                            flex:65,
                                                            child: Container(
                                                              color: Colors.green,
                                                              child: Text('box1'),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex:34,
                                                            child: Container(
                                                              color: Colors.red,
                                                              child: Text('box2'),
                                                            ),
                                                          ),

                                                          Expanded(
                                                            flex:1,
                                                            child: Container(
                                                              color: Colors.blue,
                                                              child: Text(''),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],

                                                  )



                                              ),
                                              //),



                                              // Container(
                                              //     padding: EdgeInsets.all(4.0),
                                              //     width: 200.0,
                                              //     child: Text(
                                              //       "Institution Name",
                                              //       style: TextStyle(fontSize: 18),
                                              //     )),
                                              // Container(
                                              //     padding: EdgeInsets.all(4.0),
                                              //     width: 100.0,
                                              //     child: Text(
                                              //       "",
                                              //       style: TextStyle(fontSize: 18),
                                              //     )),
                                            ],
                                          );
                                        }
                                    ),),
                                  padding: EdgeInsets.only(top: 20),


                                ),
                              ),
                            ),
                            alignment: Alignment.topCenter,

                          ),
                          Align(
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color(0xffD37D2A),
                              ),
                              child: Text('পুরনো ফলাফল',style: TextStyle(color: Colors.white),),
                              padding: EdgeInsets.all(10),
                            ),
                            alignment: Alignment.topCenter,
                          ),



                        ],
                      ),

                      //last entry, mostview
                      Obx(() =>
                          Container(
                              margin: EdgeInsets.only(left: 0,right: 0),
                              //alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Flexible(child:
                                  homeController.CustomRadioButton("সর্বশেষ", 1,context),
                                  //flex: 1,),
                                  SizedBox(width: 20,),
                                  //Flexible(child:
                                  homeController.CustomRadioButton("সর্বাধিক পঠিত", 2,context),
                                  // flex: 1,),

                                ],
                              )
                          ),
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
                                  //final item = homeController.last_entry_newsList[index];

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
                                                Flexible(child:
                                                Text(homeController.last_entry_newsList[index].title!,
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
                  ),


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