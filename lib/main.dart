import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jugantor.com/model/BoxListModel.dart';
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
