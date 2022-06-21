import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/settings_service.dart';

import 'routes/app_pages.dart';
initServices() async {
  await Get.putAsync<SettingsService>(() async => await SettingsService());
}
main(List<String> args) async {
  // WidgetsFlutterBinding.ensureInitialized();
   await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // var  text = "a:3:{i:0;i:210;i:1;i:46;i:2;i:12;}";
    // List<String> result = text.split(';');
    // print('split'+result[1]);
    // print('split'+result[3]);
    // print('split'+result[5]);
    //
    // List<String> resultA = result[1].split(':');
    // print('a: '+resultA[1]);
    //
    // List<String> resultB = result[3].split(':');
    // print('b: '+resultB[1]);
    //
    // List<String> resultC = result[5].split(':');
    // print('c: '+resultC[1]);



    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(fontFamily: 'SolaimanLipi'),
      //theme: ThemeData(fontFamily: 'Roboto'),
      //  theme: Get.find<SettingsService>().getLightTheme(),
      //  darkTheme: Get.find<SettingsService>().getDarkTheme(),

    );

    //   MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(primarySwatch: Colors.indigo),
    //   home: HomePage(),
    // );
  }


}
