import 'package:get/get.dart';
import 'package:jugantor.com/home/bindings/home_binding.dart';
import 'package:jugantor.com/home/views/home_page.dart';
import 'package:jugantor.com/splashscreen/bindings/splashscreen_binding.dart';
import 'package:jugantor.com/splashscreen/views/splashscreen_view.dart';




part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [

    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),

    // GetPage(
    //   name: _Paths.SEARCH,
    //   page: () => SearchPage(),
    //   binding: SearchBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.DETAILS,
    //   page: () => DetailsPage(),
    //   binding: DetailsBinding(),
    // ),

  ];
}
