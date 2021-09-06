import 'package:get/get.dart';

import '../../../../common/ui.dart';
// import '../../../models/category_model.dart';
// import '../../../models/e_service_model.dart';
// import '../../../repositories/category_repository.dart';
// import '../../../repositories/e_service_repository.dart';

class SearchController extends GetxController {
  final heroTag = "".obs;
  // final categories = <Category>[].obs;

  // final eServices = <EService>[].obs;
  // EServiceRepository _eServiceRepository;
  // CategoryRepository _categoryRepository;

  SearchController() {
    // _eServiceRepository = new EServiceRepository();
    // _categoryRepository = new CategoryRepository();
  }

  @override
  void onInit() async {
    await refreshSearch();
    super.onInit();
  }

  @override
  void onReady() {
    heroTag.value = Get.arguments as String;
    super.onReady();
  }

  Future refreshSearch({bool showMessage}) async {
    // await searchEServices();
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "List of services refreshed successfully".tr));
    }
  }

  // Future searchEServices({String keywords}) async {
  //   try {
  //     eServices.value = await _eServiceRepository.getAll();
  //     if (keywords != null && keywords.isNotEmpty) {
  //       eServices.value = eServices.where((EService _service) {
  //         return _service.title.toLowerCase().contains(keywords.toLowerCase());
  //       }).toList();
  //     }
  //   } catch (e) {
  //     Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
  //   }
  // }

  // Future getCategories() async {
  //   try {
  //     _categoryRepository.getAll().then((value) {
  //       categories.clear();
  //       return value;
  //     }).then((value) {
  //       categories.value = value;
  //     });
  //   } catch (e) {
  //     Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
  //   }
  // }
}
