import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Ui {

  static showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      backgroundColor: Colors.transparent,
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          //Container(margin: EdgeInsets.only(left: 7),child:Text("অপেক্ষা করুন..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }


}
