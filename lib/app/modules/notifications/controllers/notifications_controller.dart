import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../home/controllers/home_controller.dart';
import '../../contracts/controllers/contracts_controller.dart';
import '../../../../common/ui.dart';
import '../../../models/notification_model.dart';
import '../../../models/expiring_contract_model.dart';

class NotificationsController extends GetxController {
  final notifications = <Notification>[].obs;
  // NotificationRepository _notificationRepository;
  ContractsController contractsController;

  NotificationsController() {
    // _notificationRepository = new NotificationRepository();
  }

  @override
  void onInit() async {
    await refreshNotifications();
    
    super.onInit();
  }

  Future refreshNotifications({bool showMessage}) async {
    await getNotifications();
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "List of notifications refreshed successfully".tr));
    }
  }

  Future getNotifications() async {
    try {
      notifications.value = await this.toNotification(Get.find<HomeController>().expiringContracts);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  List<Notification> toNotification(List<ExpiringContract> expiringContracts) {
    
    final notifications = <Notification>[];
    for (var expiringContract in expiringContracts) {
      DateTime datetime = new DateFormat('LLLL dd, yyyy').parse(expiringContract.expiryDate);
      // print(datetime.subtract(Duration(days:1)));
      // print(DateTime.now().year - 1);
      // print(datetime.compareTo(datetime)); 
      if (DateTime.now().subtract(Duration(days:1)).compareTo(datetime) == 0) {
        Notification notification;
        notification = Notification();
        notification.id = expiringContract.contractId ?? '';
        notification.type = expiringContract.contractTitle ?? '';
        notification.read = false;
        notification.createdAt = expiringContract.expiryDate ?? '';
        notifications.add(notification);
      }
    }
    return notifications;
  }
}
