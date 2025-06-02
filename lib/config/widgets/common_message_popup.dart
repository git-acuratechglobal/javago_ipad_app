import 'package:flutter/material.dart';

class CommonPopUp{
 static Future<void> showMessageDialog(BuildContext context,{required String message,required void Function()? onPressed}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content:
          Text(message),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}