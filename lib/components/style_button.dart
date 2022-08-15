  import 'package:flutter/material.dart';

ButtonStyle styleButton(Color colorCancel) {
    return ButtonStyle(
      foregroundColor:MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(colorCancel),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: colorCancel, width: 3),
        ),
      ),
    );
  }