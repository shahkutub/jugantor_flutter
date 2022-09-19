// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
// import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
//
//
// //timer_count_down: ^2.2.1
// //   flutter_countdown_timer: ^4.1.0
//
// class FlutterStopWatch extends StatefulWidget {
//   @override
//   _FlutterStopWatchState createState() => _FlutterStopWatchState();
// }
//
// class _FlutterStopWatchState extends State<FlutterStopWatch> {
//   // bool flag = true;
//   //  late Stream<int>? timerStream = null;
//   //  late StreamSubscription<int> timerSubscription;
//   // String hoursStr = '00';
//   // String minutesStr = '00';
//   // String secondsStr = '00';
//   //
//   // Stream<int> stopWatchStream() {
//   //   StreamController<int>? streamController = null;
//   //   Timer? timer = null;
//   //   Duration timerInterval = Duration(seconds: 1);
//   //   int counter = 0;
//   //
//   //   void stopTimer() {
//   //     if (timer != null) {
//   //       timer!.cancel();
//   //       timer = null;
//   //       counter = 0;
//   //       streamController!.close();
//   //     }
//   //   }
//   //
//   //   void tick(_) {
//   //     counter++;
//   //     streamController!.add(counter);
//   //     if (!flag) {
//   //       stopTimer();
//   //     }
//   //   }
//   //
//   //   void startTimer() {
//   //     timer = Timer.periodic(timerInterval, tick);
//   //   }
//   //
//   //   streamController = StreamController<int>(
//   //     onListen: startTimer,
//   //     onCancel: stopTimer,
//   //     onResume: startTimer,
//   //     onPause: stopTimer,
//   //   );
//   //
//   //   return streamController.stream;
//   // }
//   //
//   // void startWatch(){
//   //   timerStream = stopWatchStream();
//   //   timerSubscription = timerStream!.listen((int newTick) {
//   //     setState(() {
//   //       hoursStr = ((newTick / (60 * 60)) % 60)
//   //           .floor()
//   //           .toString()
//   //           .padLeft(2, '0');
//   //       minutesStr = ((newTick / 60) % 60)
//   //           .floor()
//   //           .toString()
//   //           .padLeft(2, '0');
//   //       secondsStr =
//   //           (newTick % 60).floor().toString().padLeft(2, '0');
//   //     });
//   //   });
//   // }
//   //
//   // @override
//   // Widget build(BuildContext context) {
//   //   startWatch();
//   //
//   //   return Scaffold(
//   //     //appBar: AppBar(title: Text("Flutter StopWatch")),
//   //     body: Center(
//   //       child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: [
//   //           Text(
//   //             "$hoursStr:$minutesStr:$secondsStr",
//   //             style: TextStyle(
//   //               fontSize: 20.0,
//   //             ),
//   //           ),
//   //           SizedBox(height: 30.0),
//   //           Row(
//   //             mainAxisAlignment: MainAxisAlignment.center,
//   //             children: [
//   //               RaisedButton(
//   //                 padding:
//   //                 EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//   //                 onPressed: () {
//   //                   timerStream = stopWatchStream();
//   //                   timerSubscription = timerStream!.listen((int newTick) {
//   //                     setState(() {
//   //                       hoursStr = ((newTick / (60 * 60)) % 60)
//   //                           .floor()
//   //                           .toString()
//   //                           .padLeft(2, '0');
//   //                       minutesStr = ((newTick / 60) % 60)
//   //                           .floor()
//   //                           .toString()
//   //                           .padLeft(2, '0');
//   //                       secondsStr =
//   //                           (newTick % 60).floor().toString().padLeft(2, '0');
//   //                     });
//   //                   });
//   //                 },
//   //                 color: Colors.green,
//   //                 child: Text(
//   //                   'START',
//   //                   style: TextStyle(
//   //                     fontSize: 20.0,
//   //                   ),
//   //                 ),
//   //               ),
//   //               SizedBox(width: 40.0),
//   //               RaisedButton(
//   //                 padding:
//   //                 EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//   //                 onPressed: () {
//   //                   timerSubscription.cancel();
//   //                   timerStream = null;
//   //                   setState(() {
//   //                     hoursStr = '00';
//   //                     minutesStr = '00';
//   //                     secondsStr = '00';
//   //                   });
//   //                 },
//   //                 color: Colors.red,
//   //                 child: Text(
//   //                   'RESET',
//   //                   style: TextStyle(
//   //                     color: Colors.white,
//   //                     fontSize: 20.0,
//   //                   ),
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   void onEnd() {
//     print('stonEnd');
//   }
//   // final CountdownController _controller =
//   // new CountdownController(autoStart: true);
//   CountdownTimerController? controller = null;
//   //int endTime = DateTime.now().millisecondsSinceEpoch + 60000 * 120;
//   int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
//   @override
//   Widget build(BuildContext context) {
//
//     controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
//
//     return Container(
//       height: 20,
//       width: 100,
//       child: CountdownTimer(
//         controller: controller,
//         onEnd: onEnd,
//         endTime: endTime,
//       ),
//     );
//
//     //   Scaffold(
//     //
//     //   body: Center(
//     //     child: Column(
//     //       mainAxisAlignment: MainAxisAlignment.center,
//     //       crossAxisAlignment: CrossAxisAlignment.center,
//     //       children: <Widget>[
//     //         // Container(
//     //         //   padding: const EdgeInsets.symmetric(
//     //         //     horizontal: 16,
//     //         //   ),
//     //         //   child: Row(
//     //         //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //         //     children: <Widget>[
//     //         //       // Start
//     //         //       ElevatedButton(
//     //         //         child: Text('Start'),
//     //         //         onPressed: () {
//     //         //           _controller.start();
//     //         //         },
//     //         //       ),
//     //         //       // Pause
//     //         //       ElevatedButton(
//     //         //         child: Text('Pause'),
//     //         //         onPressed: () {
//     //         //           _controller.pause();
//     //         //         },
//     //         //       ),
//     //         //       // Resume
//     //         //       ElevatedButton(
//     //         //         child: Text('Resume'),
//     //         //         onPressed: () {
//     //         //           _controller.resume();
//     //         //         },
//     //         //       ),
//     //         //       // Stop
//     //         //       ElevatedButton(
//     //         //         child: Text('Restart'),
//     //         //         onPressed: () {
//     //         //           _controller.restart();
//     //         //         },
//     //         //       ),
//     //         //     ],
//     //         //   ),
//     //         // ),
//     //         // Countdown(
//     //         //   // controller: _controller,
//     //         //   seconds: 120,
//     //         //   build: (_, double time) => Text(
//     //         //     time.toString(),
//     //         //     style: TextStyle(
//     //         //       fontSize: 100,
//     //         //     ),
//     //         //   ),
//     //         //   interval: Duration(milliseconds: 100),
//     //         //   onFinished: () {
//     //         //     ScaffoldMessenger.of(context).showSnackBar(
//     //         //       SnackBar(
//     //         //         content: Text('Timer is done!'),
//     //         //       ),
//     //         //     );
//     //         //   },
//     //         // ),
//     //
//     //         CountdownTimer(
//     //           controller: controller,
//     //           onEnd: onEnd,
//     //           endTime: endTime,
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }