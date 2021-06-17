import 'package:get/get.dart';

import '../../account/controllers/account_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../messages/controllers/messages_controller.dart';
import '../../search/controllers/search_controller.dart';
import '../../tasks/controllers/tasks_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<TasksController>(
      () => TasksController(),
    );
    Get.lazyPut<MessagesController>(
      () => MessagesController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
  }
}
