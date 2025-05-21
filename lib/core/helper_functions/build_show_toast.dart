 import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void buildShowToast({required String message, required Color color}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
     );
  }