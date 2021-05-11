import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final dynamic args;

  ActionButton({this.text, this.args});

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: () => Get.toNamed('/agpeya_text', arguments: args),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text.toUpperCase(),
              style: context.textTheme.bodyText1.copyWith(color: Colors.white)),
          Icon(Icons.navigate_next)
        ],
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith((state) =>
            EdgeInsets.only(left: 20, right: 7, top: 12, bottom: 12)),
        overlayColor:
            MaterialStateProperty.resolveWith((state) => Color(0xFFA49131)),
        shape: MaterialStateProperty.resolveWith((state) =>
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0))),
      ),
    );
  }
}
