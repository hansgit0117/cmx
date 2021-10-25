import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/expiring_contract_model.dart';
import '../../../models/expiring_contract_status_model.dart';
import '../../home/controllers/home_controller.dart';

class SearchController extends GetxController {
  final heroTag = "".obs;
  final expiringContracts = <ExpiringContract>[].obs;
  final expiringContractsAfterSearch = <ExpiringContract>[].obs;
  final expiringContractsAfterFilter = <ExpiringContract>[].obs;
  List<ExpiringContractStatusModel> expiringContractStatus = ExpiringContractStatusModel.getExpiringContractStatus();
  // final expiringContractStatus = <Map>[
  //   {
  //     "title": "asdfdsafds",
  //     "isCheck": false
  //   },
  //   {
  //     "title": "mnbv",
  //     "isCheck": false
  //   },
  //   {
  //     "title": "piopiopio",
  //     "isCheck": false
  //   }        
  // ].obs;

  SearchController() {
    // _eServiceRepository = new EServiceRepository();
    // _categoryRepository = new CategoryRepository();
  }

  @override
  void onInit() async {
    await refreshSearch();
    super.onInit();
    expiringContracts.value = Get.find<HomeController>().expiringContracts;
    expiringContractsAfterFilter.value = expiringContracts;
    expiringContractsAfterSearch.value = expiringContractsAfterFilter;
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

  Future searchContract({String keywords}) async {
    try {
      // expiringContracts.value = await _eServiceRepository.getAll();
      if (keywords != null && keywords.isNotEmpty) {
        expiringContractsAfterSearch.value = expiringContractsAfterFilter.where((ExpiringContract _expiringContract) {
          return _expiringContract.contractTitle.toLowerCase().contains(keywords.toLowerCase());
        }).toList();
      } else {
        expiringContractsAfterSearch.value = expiringContractsAfterFilter;
      }
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  void filterExpiringContracts () {
    try {
      expiringContractsAfterFilter.value = expiringContracts.where((ExpiringContract _expiringContract) {
        bool returnValue = false;
        expiringContractStatus.forEach((element) {
          if (_expiringContract.status == element.title)
            returnValue = element.isCheck;
        });
        return returnValue;
      }).toList();
      expiringContractsAfterSearch.value = expiringContractsAfterFilter;
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  void itemChange (bool value, int index) {
    expiringContractStatus[index].isCheck = value;
    update();
  }
}
