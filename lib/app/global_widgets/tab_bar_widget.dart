/*
 * Copyright (c) 2020 .
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController {
  final selected = Rx<ChipWidget>();

  @override
  void onInit() {
    super.onInit();
  }

  bool isSelected(ChipWidget chipWidget) => selected.value.id == chipWidget.id;

  void toggleSelected(
    ChipWidget chipWidget,
  ) {
    if (!isSelected(chipWidget)) {
      selected.value = chipWidget;
    }
  }
}

class TabBarWidget extends GetView<TabBarController> implements PreferredSize {
  TabBarWidget({
    Key key,
    @required this.tabs,
  }) {
    if (controller.selected.firstRebuild) {
      controller.selected.value = tabs.elementAt(0);
    }
    tabs[0] = Padding(padding: EdgeInsetsDirectional.only(start: 15), child: tabs.elementAt(0));
    tabs[tabs.length - 1] = Padding(padding: EdgeInsetsDirectional.only(end: 15), child: tabs[tabs.length - 1]);
  }

  final List<Widget> tabs;

  Widget buildTabBar() {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      height: 60,
      child: ListView(primary: false, shrinkWrap: true, scrollDirection: Axis.horizontal, children: tabs),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildTabBar();
  }

  @override
  Widget get child => buildTabBar();

  @override
  Size get preferredSize => new Size(Get.width, 60);
}

class ChipWidget extends StatelessWidget {
  ChipWidget({
    Key key,
    @required this.text,
    this.onSelected,
    @required this.id,
  }) : super(key: key);

  final String text;
  final int id;
  final ValueChanged<int> onSelected;
  final controller = Get.find<TabBarController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RawChip(
        elevation: 0,
        label: Text(text),
        labelStyle: controller.isSelected(this) ? Get.textTheme.bodyText2.merge(TextStyle(color: Get.theme.primaryColor)) : Get.textTheme.bodyText2,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        backgroundColor: Get.theme.focusColor.withOpacity(0.1),
        selectedColor: Get.theme.accentColor,
        selected: controller.isSelected(this),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        showCheckmark: false,
        pressElevation: 0,
        onSelected: (bool value) {
          controller.toggleSelected(this);
          onSelected(id);
        },
      ).marginSymmetric(horizontal: 5);
    });
  }
}
