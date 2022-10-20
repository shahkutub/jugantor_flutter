import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../modules/home/controllers/home_controller.dart';

class FullScreenModal extends ModalRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // implement the search field
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const SizedBox(
                    width: 10,
                  ),
                  // This button is used to close the search modal
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'))
                ],
              ),

              Center(
                child: Container(
                    child: PhotoView(
                      imageProvider: NetworkImage(homeController.bigphoto.value),
                    )

                )

                // InteractiveViewer(
                //   panEnabled: true, // Set it to false
                //  // boundaryMargin: EdgeInsets.all(100),
                //   minScale: 0.5,
                //   maxScale: 2,
                //   child: FadeInImage.assetNetwork(
                //       height: 250,
                //       width: Get.width,
                //       fit: BoxFit.fill,
                //       image:homeController.bigphoto.value,
                //       placeholder:"assets/images/jugantordefault.jpg" // your assets image path
                //   ),
                // ),
              )

            ],
          ),
        ),
      ),
    );
  }

  // animations for the search modal
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // add fade animation
    return FadeTransition(
      opacity: animation,
      // add slide animation
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}