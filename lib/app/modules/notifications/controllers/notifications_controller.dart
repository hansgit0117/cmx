import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../contracts/controllers/contracts_controller.dart';
import '../../../models/notification_model.dart';

class NotificationsController extends GetxController {
  final notifications = <Notification>[].obs;
  ContractsController contractsController;

  NotificationsController() {}

  @override
  void onInit() async {
    super.onInit();
    notifications.value = Get.find<HomeController>().notifications;
  }
}
