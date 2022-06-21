
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {


    return Container(

      child: Column(
        children: [
          Row(
            children: [
              Text('সম্পাদক : ',style: TextStyle(fontSize: 13,color: Colors.white),
                textAlign: TextAlign.justify,),
              Text('সাইফুল আলম',style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,),
              Text(' , ',style: TextStyle(fontSize: 13,color: Colors.white),
                textAlign: TextAlign.justify,),

              Text('প্রকাশক : ',style: TextStyle(fontSize: 13,color: Colors.white),
                textAlign: TextAlign.justify,),

              Text('সালমা ইসলাম',style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,),

            ],
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),

          Text('প্রকাশক কর্তৃক ক-২৪৪ প্রগতি সরণি, কুড়িল (বিশ্বরোড), '
              'বারিধারা, ঢাকা-১২২৯ থেকে প্রকাশিত এবং যমুনা প্রিন্টিং এন্ড পাবলিশিং লিঃ থেকে মুদ্রিত। ''পিএবিএক্স : ৯৮২৪০৫৪-৬১, '
              'রিপোর্টিং : ৯৮২৩০৭৩, বিজ্ঞাপন : ৯৮২৪০৬২, ফ্যাক্স : ৯৮২৪০৬৩, '
              'সার্কুলেশন : ৯৮২৪০৭২। ফ্যাক্স : ৯৮২৪০৬৬'
              'E-mail: jugantor.mail@gmail.com',style: TextStyle(fontSize: 15,color: Colors.white),
            textAlign: TextAlign.center,),
          SizedBox(height: 20,),

        ],
      ),
      width: Get.width,
      padding: EdgeInsets.all(15),
      color: Colors.black,
      alignment: Alignment.center,

    );
  }

}