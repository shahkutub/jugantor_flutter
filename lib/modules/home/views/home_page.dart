import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/modules/home/controllers/home_controller.dart';
import 'package:jugantor.com/utils/utils.dart';

class HomePage extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    //homeController.get_bn_date(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Color(0xff2A394D),
        title: Stack(alignment: Alignment.center,
          children: <Widget>[
            // Container(
            //   alignment: Alignment.centerLeft,
            //   child: Text('N-PMS'),),
            Container(

              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // Obx(() =>
                  //
                  // ),
                  Obx(() =>
                    homeController.banglaDate.value != null?
                      Text(""+Utils.currentDateBengali()+' ,   '+homeController.banglaDate.value,
                      style: TextStyle(color: Colors.white,fontSize: 15),
                      textAlign:TextAlign.center,
                    ):Text('')
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: (){
                          // ajker paper page index 3
                          Get.back();
                          homeController.selectedPageIndex.value = 3;
                          homeController.selectedCategoryName.value = "আজকের পত্রিকা";
                          homeController.selectedSubCategoryName.value = "";
                          homeController.catListShow.value = false;
                          homeController.ajker_paper_sub_category();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text("আজকের পত্রিকা",
                            style: TextStyle(color: Colors.white,fontSize: 15),
                            textAlign:TextAlign.center,
                          ),
                        ),
                        
                      ),
                      GestureDetector(
                        onTap: (){
                          homeController.selectedPageIndex.value = 4;
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text("|  ই-পেপার",
                            style: TextStyle(color: Colors.white,fontSize: 15),
                            textAlign:TextAlign.center,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          homeController.selectedPageIndex.value = 4;
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text("|  বেটা ভার্সন",
                            style: TextStyle(color: Colors.white,fontSize: 15),
                            textAlign:TextAlign.center,
                          ),
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            )
          ],
        ),

    ),

        body:Scaffold(
          backgroundColor: Colors.white,
          body: Scaffold(
              backgroundColor: Colors.white,
              appBar:AppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                title:Obx(() => homeController.isSearch.value == false?
                Stack(alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Container(
                      //height: 80,
                        alignment: Alignment.centerLeft,
                        child:GestureDetector(
                            onTap: (){
                              homeController.selectedPageIndex.value = 0;
                            },
                            child:SvgPicture.asset(
                              'assets/images/jugantorlogo.svg',
                              height: 40, width: 130,

                            )
                        )
                    ),
                    //https://www.google.com/search?q=poddasetu+jugantor

                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.search),
                        //tooltip: 'Increase volume by 10',
                        onPressed: () {
                          homeController.isSearch.value = true;
                        },
                      ),
                    )
                  ],
                ):
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    color: Colors.white,
                    borderRadius:  BorderRadius.circular(32),
                  ),
                  child: TextField(
                    controller: homeController.searchController.value,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: 'Search ...',
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: (){
                              //homeController.isSearch.value = false;
                              homeController.searchQuery.value = homeController.searchController.value.text.toString();
                              homeController.selectedPageIndex.value = 10;
                            },
                            icon: Icon(Icons.search,color: Colors.green,),
                          ),
                          IconButton(
                            onPressed: (){
                              homeController.isSearch.value = false;
                              homeController.selectedPageIndex.value = 0;
                             // Get.back();
                            },
                            icon: Icon(Icons.clear,color: Colors.red,),
                          ),
                        ],
                      ),

                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                )

              ),
              drawer: new Drawer(
                backgroundColor: Colors.white,
                  child:  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Obx(() =>
                           homeController.categoryList.length > 0?
                            Container(
                                padding: EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child:GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5.0,
                                      mainAxisSpacing: 5.0,
                                      childAspectRatio: 3
                                  ),
                                  itemCount: homeController.categoryList.length,
                                  itemBuilder: (context, index) {
                                    return  GestureDetector(
                                      onTap: (){
                                        Get.back();
                                        if(homeController.categoryList[index].cat_name == "প্রচ্ছদ"){
                                          homeController.selectedPageIndex.value = 0;
                                        }else if(homeController.categoryList[index].cat_name == "সারাদেশ"){
                                          homeController.selectedCategoryName.value = "সারাদেশ";
                                          homeController.dataLoaded.value = false;
                                          homeController.get_saradesh_top_news();
                                          homeController.get_division();
                                        }else{
                                          homeController.subcategory_list_with_news_newsList.clear();
                                          homeController.catId.value = homeController.categoryList[index].id!;
                                          homeController.selectedSubCategoryName.value = "";
                                          homeController.selectedCategoryName.value = homeController.categoryList[index].cat_name.toString();
                                          homeController.dataLoaded.value = false;
                                          homeController.get_sub_category(homeController.categoryList[index].id!);
                                          //sub_category page index 2
                                          homeController.selectedPageIndex.value = 2;
                                        }
                                      },


                                      child: Obx(() => Text(homeController.categoryList[index].cat_name!,
                                        style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold ),),
                                      ),
                                    );
                                  },
                                )
                            ):SizedBox()
                        ),

                        Divider(
                          thickness: 2.0,
                          color: Colors.grey,
                        ),

                        Container(
                          margin: EdgeInsets.only(right: 15,left: 15,bottom: 40),
                          child: Column(
                            children: [
                              Row(

                                children: <Widget>[
                                  Flexible(
                                    child: GestureDetector(
                                      child: Row(
                                        children: [
                                          Icon(Icons.library_books_outlined),
                                          Text(" আজকের পত্রিকা")
                                        ],
                                      ),
                                      onTap: (){
                                        Get.back();
                                        homeController.selectedPageIndex.value = 3;
                                        homeController.selectedSubCategoryName.value = "";
                                        homeController.selectedCategoryName.value = "আজকের পত্রিকা";
                                        homeController.catListShow.value = false;
                                        homeController.ajker_paper_sub_category();
                                      },
                                    ), flex: 1,),
                                  Flexible(child: GestureDetector(
                                    child: Row(
                                      children: [
                                        Icon(Icons.library_books_outlined,color: Colors.green,),
                                        Text(" দ্বিতীয় সংস্করণ")
                                      ],
                                    ),
                                    onTap: (){
                                      Get.back();
                                      homeController.selectedPageIndex.value = 3;
                                      homeController.selectedCategoryName.value = "আজকের পত্রিকা";
                                      homeController.selectedSubCategoryName.value = "দ্বিতীয় সংস্করণ";
                                      homeController.catListShow.value = false;

                                      homeController.get_ajker_cat_newsList(33);
                                      homeController.ajker_paper_sub_categoryOnly();
                                    },
                                  ),
                                   flex: 1,)
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: <Widget>[
                                  Flexible(child: GestureDetector(
                                    child:Row(
                                      children: [
                                        Icon(Icons.photo),
                                        Text(" ছবি")
                                      ],
                                    ),
                                    onTap: (){

                                    },
                                  ), flex: 1,),
                                  Flexible(child: GestureDetector(
                                    child: Row(
                                      children: [
                                        Icon(Icons.video_library_sharp,),
                                        Text(" ভিডিও")
                                      ],
                                    ),
                                    onTap: (){

                                    },
                                  ),
                                   flex: 1,)
                                ],
                              )
                            ],
                          ),
                        ),



                      ],
                    ),
                  )
              ),


              body:Obx(() {
                return Container(
                  child:homeController.getDrawerItemWidget(homeController.selectedPageIndex.value),
                );
              }
          ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                homeController.scrollController.value.animateTo(0,
                    duration: const Duration(seconds: 3), curve: Curves.linear);
              },
              child: Icon(Icons.arrow_circle_up_sharp,color: Colors.red,size: 40,),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,

            ),
        ),
        )
    );
  }

}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}