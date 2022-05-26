import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';



class HomeController extends GetxController {
  //var taskData = List<TaskData>().obs;
  TextEditingController addTaskController;
  dynamic argumentData = Get.arguments;


  @override
  void onInit() {
    addTaskController = TextEditingController();
    //_getData();
    super.onInit();
  }

  // void _getData() {
  //   DatabaseHelper.instance.queryAllRows().then((value) {
  //     value.forEach((element) {
  //       taskData.add(TaskData(id: element['id'], title: element['title']));
  //     });
  //   });
  // }
  //
  // void addData() async {
  //   await DatabaseHelper.instance
  //       .insert(TaskData(title: addTaskController.text));
  //   taskData.insert(
  //       0, TaskData(id: taskData.length, title: addTaskController.text));
  //   addTaskController.clear();
  // }
  //
  // void deleteTask(int id) async {
  //   await DatabaseHelper.instance.delete(id);
  //
  //   taskData.removeWhere((element) => element.id == id);
  // }
}
