import 'package:flutter/material.dart';

class ErrorShow {
  static void showSnackBar(BuildContext? context, String message) {
    if (context != null) {
      final snackBar = SnackBar(
        backgroundColor: Colors.amber[400],
        content:
            Center(child: Text(message, style: const TextStyle(color: Colors.black))),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
