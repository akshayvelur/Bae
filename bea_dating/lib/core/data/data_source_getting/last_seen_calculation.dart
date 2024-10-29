import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

lastSeenCalculation(Timestamp timeStamp) {
  DateTime daytme = timeStamp.toDate();
  // String lastSeen=DateFormat('hh:mm a').format(daytme);
  DateTime now = DateTime.now();
  DateTime yesterday = now.subtract(const Duration(days: 1));
  DateTime twoday = now.subtract(const Duration(days: 2));
  DateTime threeday = now.subtract(const Duration(days: 3));
  DateTime fourday = now.subtract(const Duration(days: 4));
  DateTime fiveday = now.subtract(const Duration(days: 5));
  DateTime sixday = now.subtract(const Duration(days: 6));
  DateTime sevenday = now.subtract(const Duration(days: 7));
  DateTime oneweek = now.subtract(const Duration(days: 8));

  if (daytme.day == now.day &&
      daytme.month == now.month &&
      daytme.year == now.year) {
    // If it's today, show time
    return "last seen today at "+DateFormat('hh:mm a').format(daytme);
  } else if (daytme.day == yesterday.day &&
      daytme.month == yesterday.month &&
      daytme.year == yesterday.year) {
    // If it's yesterday, show 'Yesterday'
    return 'last seen Yesterday';
  } else if (daytme.day == twoday.day &&
      daytme.month == twoday.month &&
      daytme.year == twoday.year) {
    return "last seen 2 days ago";
  }else if (daytme.day == threeday.day &&
      daytme.month == threeday.month &&
      daytme.year == threeday.year) {
    return "last seen 3 days ago";
  }else if (daytme.day == fourday.day &&
      daytme.month == fourday.month &&
      daytme.year == fourday.year) {
    return "last seen 4 days ago";
  }else if (daytme.day == fiveday.day &&
      daytme.month == fiveday.month &&
      daytme.year == fiveday.year) {
    return " last seen 5 days ago";
  }else if (daytme.day == sixday.day &&
      daytme.month == sixday.month &&
      daytme.year == sixday.year) {
    return "last seen 6 days ago";
  }else if (daytme.day == sevenday.day &&
      daytme.month == sevenday.month &&
      daytme.year == sevenday.year) {
    return "last seen 7 days ago";
  } 
  else if (daytme.day >= oneweek.day &&
      daytme.month >= oneweek.month &&
      daytme.year >= oneweek.year) {
    return "last seen 1 week ago";
  } 
  else {
    // If it's older than yesterday, show date
    return DateFormat('dd/MM/yyyy').format(daytme);
  }
}
// for message list
lastSeenCalculationChatlist(Timestamp timeStamp) {
  DateTime daytme = timeStamp.toDate();
  // String lastSeen=DateFormat('hh:mm a').format(daytme);
  DateTime now = DateTime.now();
  DateTime yesterday = now.subtract(const Duration(days: 1));
  DateTime twoday = now.subtract(const Duration(days: 2));
  DateTime threeday = now.subtract(const Duration(days: 3));
  DateTime fourday = now.subtract(const Duration(days: 4));
  DateTime fiveday = now.subtract(const Duration(days: 5));
  DateTime sixday = now.subtract(const Duration(days: 6));
  DateTime sevenday = now.subtract(const Duration(days: 7));
  DateTime oneweek = now.subtract(const Duration(days: 8));

  if (daytme.day == now.day &&
      daytme.month == now.month &&
      daytme.year == now.year) {
    // If it's today, show time
    return DateFormat('hh:mm a').format(daytme);
  } else if (daytme.day == yesterday.day &&
      daytme.month == yesterday.month &&
      daytme.year == yesterday.year) {
    // If it's yesterday, show 'Yesterday'
    return 'Yesterday';
  } else if (daytme.day == twoday.day &&
      daytme.month == twoday.month &&
      daytme.year == twoday.year) {
    return "2 days ago";
  }else if (daytme.day == threeday.day &&
      daytme.month == threeday.month &&
      daytme.year == threeday.year) {
    return "3 days ago";
  }else if (daytme.day == fourday.day &&
      daytme.month == fourday.month &&
      daytme.year == fourday.year) {
    return "4 days ago";
  }else if (daytme.day == fiveday.day &&
      daytme.month == fiveday.month &&
      daytme.year == fiveday.year) {
    return "5 days ago";
  }else if (daytme.day == sixday.day &&
      daytme.month == sixday.month &&
      daytme.year == sixday.year) {
    return "6 days ago";
  }else if (daytme.day == sevenday.day &&
      daytme.month == sevenday.month &&
      daytme.year == sevenday.year) {
    return "7 days ago";
  } 
  else if (daytme.day >= twoday.day &&
      daytme.month >= sevenday.month &&
      daytme.year >= sevenday.year) {
    return "1 week ago";
  } 
  else {
    // If it's older than yesterday, show date
    return DateFormat('dd/MM/yyyy').format(daytme);
  }
}
