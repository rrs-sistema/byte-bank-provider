import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

void showMessageBar({ @required BuildContext context, @required String message, @required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
