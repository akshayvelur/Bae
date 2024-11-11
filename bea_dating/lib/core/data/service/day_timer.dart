import 'dart:async';

import 'package:bea_dating/core/data/data_uploading/boost_service.dart';

void scheduleDailyTask() {

  print("dailty");
  DateTime now = DateTime.now();
  // Calculate time until next day starts (midnight)
  DateTime nextDay = DateTime(now.year, now.month, now.day + 1);
  Duration timeUntilMidnight = nextDay.difference(now);
  //print("dailty${nextDay.difference(now)}");
  // Schedule a timer to call the function at midnight
  Timer(timeUntilMidnight, () {
    // Call your daily function
    yourDailyFunction();

    // Schedule the function to repeat at the same time each day
    scheduleDailyTask();
  });
}

void yourDailyFunction() {
    Boost boost=Boost();
  print("Daily function executed at ${DateTime.now()}");
 boost.boostService(5);
  // Place the code you want to execute here
}
