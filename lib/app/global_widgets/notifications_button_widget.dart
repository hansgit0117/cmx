import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsButtonWidget extends StatelessWidget {
  const NotificationsButtonWidget({
    this.iconColor,
    this.labelColor,
    Key key,
  }) : super(key: key);

  final Color iconColor;
  final Color labelColor;

  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: () {

      },
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          Icon(
            Icons.notifications_outlined,
            color: iconColor ?? Get.theme.hintColor,
            size: 28,
          ),
          Container(
            child: Text(
              "0",
              textAlign: TextAlign.center,
              style: Get.textTheme.caption.merge(
                TextStyle(color: Get.theme.primaryColor, fontSize: 10),
              ),
            ),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(color: labelColor ?? Get.theme.accentColor, borderRadius: BorderRadius.all(Radius.circular(10))),
            constraints: BoxConstraints(minWidth: 15, maxWidth: 15, minHeight: 15, maxHeight: 15),
          ),
        ],
      ),
      color: Colors.transparent,
    );
  }
}
