// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/utils/app_router.dart';
import 'package:test_app/view/home_view.dart';
import 'package:test_app/view/login_view.dart';
import 'package:test_app/view/sign_up_view.dart';
import 'package:test_app/view/splash_screen_view.dart';
import 'package:test_app/view_model/home_view_model.dart';

///this task is been run when the app is terminated..
void backgroundFetchHeadlessTask(String taskId) async {
    HomeViewModel().createNewBorn();
    HomeViewModel().getNewBorns();
  print('[BackgroundFetch] Headless event received.');

  BackgroundFetch.finish(taskId);
}
// var taskId = task.taskId;

// if (taskId == "com.testApp.task") {
//   print(taskId);
//   print("[BackgroundFetch] Headless event recieved");
//   // Do your work here...
//  print("Ali is boy");

//   //  BackgroundFetch.finish(taskId);
// }

void main() async {
 
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
// Configure BackgroundFetch.
      BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 15,
        forceAlarmManager: false,
        stopOnTerminate: false,
        startOnBoot: true,
        enableHeadless: true,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        requiredNetworkType: NetworkType.NONE,
      ),
      _onBackgroundFetch,
    ).then((int state) {
      print('[BackgroundFetch] configure SUCCESS:  $state');
    }).catchError((e) {
      print('[BackgroundFetch] configure ERROR:  $e');
    });
  //  print('[BackgroundFetch] configure success: $status');
// Schedule backgroundfetch for the 1st time it will execute with 1000ms delay.
// where device must be powered (and delay will be throttled by the OS).
    // BackgroundFetch.scheduleTask(TaskConfig(
    //     taskId: "com.testApp.task",
    //     delay: 1000,
    //     periodic: false,
    //     stopOnTerminate: false,
    //     enableHeadless: true));

    BackgroundFetch.start().then((int status) {
      print('[BackgroundFetch] start success:  $status');
    }).catchError((e) {
      print('[BackgroundFetch] start FAILURE:  $e');
    });
  }

  // void _onBackgroundFetchTimeout(String taskId) {
  //   print("[BackgroundFetch] TIMEOUT: $taskId");
  //   BackgroundFetch.finish(taskId);
  // }

  void _onBackgroundFetch(String taskId) async {
  
      //TODO: perform your task like : call the API’s, call the DB and local notification.
      print("[BackgroundFetch] Event received");
       HomeViewModel().createNewBorn();
       HomeViewModel().getNewBorns();
      BackgroundFetch.finish(taskId);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 823),
      builder: (BuildContext context, Widget? child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test App',
        theme: ThemeData(
          primaryColor: Color(0xFFFFFBF8),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.

          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.routeName,
        getPages: AppRouter.routes,
      ),
    );
  }
}
