/*
 * Written By Honesty (c) 2021 .
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../search/views/search_view.dart';
import '../../contracts/views/expiring_contracts_view.dart';
import '../../notifications/views/notifications_view.dart';
import '../../task/views/task_view.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';

class RootController extends GetxController {
  final currentIndex = 0.obs;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is int) {
      changePageInRoot(Get.arguments as int);
    } else {
      changePageInRoot(0);
    }
    super.onInit();
  }

  List<Widget> pages = [
    HomeView(),
    ExpiringContractsView(),
    TaskView(),
    NotificationsView(),
    // SearchView(),
  ];

  Widget get currentPage => pages[currentIndex.value];

  /**
   * change page in route
   * */
  void changePageInRoot(int _index) {
    currentIndex.value = _index;
  }

  void changePageOutRoot(int _index) {
    currentIndex.value = _index;
    Get.offNamedUntil(Routes.ROOT, (Route route) {
      if (route.settings.name == Routes.ROOT) {
        return true;
      }
      return false;
    }, arguments: _index);
  }

  void changePage(int _index) {
    if (Get.currentRoute == Routes.ROOT) {
      changePageInRoot(_index);
    } else {
      changePageOutRoot(_index);
    }
  }
}
