import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/address_model.dart';
import '../../../models/expiring_contract_model.dart';
import '../../../models/slide_model.dart';
import '../../../repositories/expiring_contract_repository.dart';
import '../../../repositories/slider_repository.dart';

class HomeController extends GetxController {
  SliderRepository _sliderRepo;
  ExpiringContractRepository _expiringContractRepository;

  final addresses = <Address>[].obs;
  final slider = <Slide>[].obs;
  final currentSlide = 0.obs;

  final expiringContracts = <ExpiringContract>[].obs;
  final featured = <ExpiringContract>[].obs;

  HomeController() {
    _sliderRepo = new SliderRepository();
    _expiringContractRepository = new ExpiringContractRepository();
  }

  @override
  Future<void> onInit() async {
    await refreshHome();
    super.onInit();
  }

  Future refreshHome({bool showMessage = false}) async {
    await getSlider();
    await getExpiringContracts();
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

  Future getExpiringContracts() async {
    try {
      expiringContracts.value = await _expiringContractRepository.getAll();
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }
}
