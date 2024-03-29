import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/model/BoxListModel.dart';
import 'package:jugantor.com/settings_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'routes/app_pages.dart';
initServices() async {
    await Get.putAsync<SettingsService>(() async => await SettingsService());
}
main(List<String> args) async {
    // WidgetsFlutterBinding.ensureInitialized();
    // WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    await initServices();
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);



    @override
    Widget build(BuildContext context) {



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
