/*
 * Copyright (c) 2020 .
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/search/controllers/search_controller.dart';
import 'circular_loading_widget.dart';

class FilterBottomSheetWidget extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 90,
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Get.theme.focusColor.withOpacity(0.4), blurRadius: 30, offset: Offset(0, -30)),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: ListView(
              padding: EdgeInsets.only(top: 20, bottom: 15, left: 4, right: 4),
              children: [
                ExpansionTile(
                  title: Text("Available Provider".tr, style: Get.textTheme.bodyText2),
                  children: [
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      value: true,
                      onChanged: (value) {
                        // setState(() {
                        //   _con.filter?.open = value;
                        // });
                      },
                      title: Text(
                        "Only Available".tr,
                        style: Get.textTheme.bodyText1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        maxLines: 1,
                      ),
                    ),
                  ],
                  initiallyExpanded: true,
                ),
                GetX(initState: (_) {
                  print("initState");
                  controller.getCategories();
                }, builder: (_) {
                  if (controller.categories.isEmpty) {
                    return CircularLoadingWidget(height: 100);
                  }
                  return ExpansionTile(
                    title: Text("Categories".tr, style: Get.textTheme.bodyText2),
                    children: List.generate(controller.categories.length, (index) {
                      var _category = controller.categories.elementAt(index);
                      return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: false,
                        onChanged: (value) {
                          // setState(() {
                          //   _con.filter?.open = value;
                          // });
                        },
                        title: Text(
                          _category.name,
                          style: Get.textTheme.bodyText1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      );
                    }),
                    initiallyExpanded: true,
                  );
                }),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 45),
            child: Row(
              children: [
                Expanded(child: Text("Filter".tr, style: Get.textTheme.headline5)),
                MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    Get.back();
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Get.theme.accentColor.withOpacity(0.15),
                  child: Text("Apply".tr, style: Get.textTheme.subtitle1),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: (Get.width / 2) - 30),
            decoration: BoxDecoration(
              color: Get.theme.focusColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Get.theme.focusColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(3),
              ),
              //child: SizedBox(height: 1,),
            ),
          ),
        ],
      ),
    );
  }
}
