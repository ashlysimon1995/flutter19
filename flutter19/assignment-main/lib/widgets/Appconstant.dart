import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Appconstant {
  BuildContext? context;
  void toast({required String toast, Color? clr, Toast? toastLength}) {
    Fluttertoast.showToast(
      msg: toast,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      backgroundColor: clr ?? Colors.red,
    );
  }
}
