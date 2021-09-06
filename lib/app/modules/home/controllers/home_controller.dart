import 'package:get/get.dart';

import '../../../services/auth_service.dart';
import '../../../models/task_model.dart';
import '../../../repositories/tasks_repository.dart';
import '../../../models/oauth20models/authenticate_model.dart';
import '../../../../common/ui.dart';
import '../../../models/address_model.dart';
import '../../../models/expiring_contract_model.dart';
import '../../../models/slide_model.dart';
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
    await getContractExpirySetting(authenticate);
    super.onInit();
  }

  Future refreshHome({bool showMessage = false}) async {
    await getSlider();
    await getExpiringContracts(authenticate);
    await getTasks(authenticate);
    if (showMessage) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "Home page refreshed successfully".tr));
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
      Get.put(HomeController());
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
}
