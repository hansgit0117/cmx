import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../services/auth_service.dart';
import '../../../../common/ui.dart';
import '../../notifications/controllers/notification_helper.dart';
import '../../../models/address_model.dart';
import '../../../models/expiring_contract_model.dart';
import '../../../models/slide_model.dart';
import '../../../models/notification_model.dart';
import '../../../models/oauth20models/authenticate_model.dart';
import '../../../models/task_model.dart';
import '../../../repositories/tasks_repository.dart';
import '../../../repositories/expiring_contract_repository.dart';
import '../../../repositories/slider_repository.dart';
import '../../../repositories/cmx_global_settings_repository.dart';

class HomeController extends GetxController {
  SliderRepository _sliderRepo;
  ExpiringContractRepository _expiringContractRepository;
  TasksRepository _tasksRepository;
  CmxGlobalSettingsRepository _cmxGlobalSettingsRepository;
  Authenticate authenticate;

  final addresses = <Address>[].obs;
  final slider = <Slide>[].obs;
  final currentSlide = 0.obs;
  final expiringContracts = <ExpiringContract>[].obs;
  final featured = <ExpiringContract>[].obs;
  final tasks = <Task>[].obs;
  final contractExpirySetting = "".obs;
  final notifications = <Notification>[].obs;

  HomeController() {
    _sliderRepo = new SliderRepository();
    _expiringContractRepository = new ExpiringContractRepository();
    _cmxGlobalSettingsRepository = new CmxGlobalSettingsRepository();
    _tasksRepository = new TasksRepository();
  }

  @override
  Future<void> onInit() async {
    authenticate = await Get.find<AuthService>().authenticate.value;
    await refreshHome();
    super.onInit();
  }

  Future refreshHome({bool showMessage = false}) async {
    await getSlider();
    await getExpiringContracts(authenticate);
    await getTasks(authenticate);
    await getContractExpirySetting(authenticate);
    await refreshNotifications();

    Get.put(HomeController());
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "Home page refreshed successfully".tr));
    }
  }

  Future refreshNotifications({bool showMessage}) async {
    await getNotifications();
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "List of notifications refreshed successfully".tr));
    }
  }  

  Future getSlider() async {
    try {
      slider.value = await _sliderRepo.getHomeSlider();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getExpiringContracts(Authenticate authenticate) async {
    try {
      expiringContracts.value = await _expiringContractRepository.getAll(authenticate);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getTasks(Authenticate authenticate) async {
    try {
      tasks.value = await _tasksRepository.getAll(authenticate);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getContractExpirySetting(Authenticate authenticate) async {
    try {
      contractExpirySetting.value = await _cmxGlobalSettingsRepository.getContractExpirySetting(authenticate);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getNotifications() async {
    try {
      await LocalNotificationHelper().cancelAllNotifications();
      notifications.value = await this.toNotification();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }  

  List<Notification> toNotification() {
    LocalNotificationHelper().showNotification();
    final notificationsList = <Notification>[];
    // notifications from expiring contracts
    for (var expiringContract in expiringContracts) {
      DateTime datetime = new DateFormat('LLLL dd, yyyy').parse(expiringContract.expiryDate);
      final contractExpirySettingList = contractExpirySetting.split(",");
      for (var item in contractExpirySettingList) {        
        String title = "This contract will be expired in " + item + " days.";
        String body = expiringContract.contractTitle??"";
        DateTime scheduledDateTime = datetime.subtract(Duration(days: int.parse(item)));
        if (scheduledDateTime.isAfter(DateTime.now())) {
          LocalNotificationHelper().scheduleNotification(title, body, scheduledDateTime);

          if (DateTime.now().compareTo(scheduledDateTime.subtract(Duration(days:1))) == 0 
              || DateTime.now().compareTo(scheduledDateTime) == 0
              || DateTime.now().compareTo(datetime.subtract(Duration(days:1))) == 0
              || DateTime.now().compareTo(datetime) == 0) {
            Notification notification;
            notification = Notification();
            notification.id = expiringContract.contractId ?? '';
            notification.type = expiringContract.contractTitle ?? '';
            notification.read = false;
            notification.createdAt = expiringContract.expiryDate ?? '';
            notificationsList.add(notification);
          }     
        }
      }
    }
    // print("Contracts Notifications");
    // print(notificationsList);

    // notifications from tasks
    for (var task in tasks) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(task.assignDate), isUtc: true);
      String title = "Please complete this task.";
      String body = task.contract.contractTitle??"";
      if (task.taskStatus != 'COMPLETED') {
        for (var i = 1; i < 10; i++) {
          DateTime upcomingDateTime = DateTime.now().add(Duration(days: i));
          LocalNotificationHelper().scheduleNotification(title, body, DateTime(upcomingDateTime.year, upcomingDateTime.month, upcomingDateTime.day));
        }
      }
      
      if (DateTime.now().compareTo(dateTime.subtract(Duration(days:1))) == 0
          || DateTime.now().compareTo(dateTime) == 0) {
            Notification notification;
            notification = Notification();
            notification.id = task.recipientId ?? '';
            notification.type = task.contract.contractTitle ?? '';
            notification.read = false;
            notification.createdAt = DateFormat('MM/dd/yyyy, hh:mm a').format(dateTime) ?? '';
            notificationsList.add(notification);
      }
    }
    // print("Tasks Notifications");
    // print(notificationsList);
    return notificationsList;
  }  
}
