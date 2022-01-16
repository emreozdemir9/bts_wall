import 'dart:io';

import 'package:connectivity/connectivity.dart';

class MyUtils {
  // check internet connection
  static Future<bool> checkInternet() async {
    try {
      var connectivityResult =
          await Connectivity().checkConnectivity(); // User defined class
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      }
    } on SocketException catch (e) {
      print('checkInternet --- [SocketException] ---- IS :');
      print(e);
      print('checkInternet --- [SocketException] ---- IS :');
    }
    return false;
  }

  // check null and empty
  static bool isNullOrEmpty(variable) {
    return variable == null || variable.isEmpty;
  }

  // check is not null and empty
  static bool isNotNullOrEmpty(variable) {
    return !isNullOrEmpty(variable);
  }
}