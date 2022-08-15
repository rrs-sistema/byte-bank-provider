import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void showToast(BuildContext context, String msg, Color colo, {int duration = 5, int gravity}) {
    Toast.show(msg, context, backgroundColor: colo , duration: duration, gravity: gravity);
  }