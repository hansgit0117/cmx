import 'package:get/get.dart';
import '../../contracts/controllers/contracts_controller.dart';
import '../controllers/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(),
    );
    // Get.lazyPut<ContractsController>(
    //   () => ContractsController(),
    // );
  }
}
