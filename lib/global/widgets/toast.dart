import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM, // Toast position: BOTTOM, CENTER, TOP
        timeInSecForIosWeb: 1, // Duration for iOS
        backgroundColor: Colors.black, // Background color of the toast
        textColor: Colors.white, // Text color of the toast
        fontSize: 16.0 // Font size of the toast message
        );
  }
}
