import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/home/controllers/home_controller.dart';



class HomePage extends StatelessWidget {
  final HomeController _taskController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Text("Todo App"),
      actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          //Get.toNamed(Routes.SEARCH);
        },
      )

    ],
    ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          _displayDialog(context);
        },
        label: const Text(''),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[

            Expanded(
              // child: Obx(() => ListView.builder(
              //       itemCount: _taskController.taskData.length,
              //       itemBuilder: (context, index) => ListTile(
              //         leading: Text(_taskController.taskData[index].title),
              //         trailing: IconButton(
              //             icon: Icon(Icons.remove_red_eye),
              //             // onPressed: () => _taskController
              //             //     .deleteTask(_taskController.taskData[index].id)
              //           onPressed: () {
              //             Get.toNamed(Routes.DETAILS, arguments: [
              //               {"id": _taskController.taskData[index].id}
              //             ]);
              //           },
              //         ),
              //       ),
              //     )),
            ),
          ],
        ),
      ),
    );
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add todo'),
            content: TextField(
              controller: _taskController.addTaskController,
              textInputAction: TextInputAction.done,
              //keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: "Enter your todo"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Submit'),
                onPressed: () {
                 // _taskController.addData();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

}
