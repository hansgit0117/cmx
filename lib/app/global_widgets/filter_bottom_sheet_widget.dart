
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/search/controllers/search_controller.dart';
import 'circular_loading_widget.dart';

class FilterBottomSheetWidget extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 90,
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Get.theme.focusColor.withOpacity(0.4), blurRadius: 30, offset: Offset(0, -30)),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
              padding: EdgeInsets.only(top: 20, bottom: 15, left: 4, right: 4),
              child: controller.expiringContractStatus.isEmpty ? CircularLoadingWidget(height: 100)
                : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: 
                    StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return ExpansionTile(
                          title: Text("Contract Status".tr, style: Get.textTheme.bodyText2),
                          children: List.generate(controller.expiringContractStatus.length, (index) {
                            var _expiringContractStatus = controller.expiringContractStatus.elementAt(index);
                            return CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.trailing,
                              value: _expiringContractStatus.isCheck,
                              onChanged: (value) {
                                controller.itemChange(value, index);
                                controller.update();
                              },
                              title: Text(
                                _expiringContractStatus.title,
                                style: Get.textTheme.bodyText1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                maxLines: 1,
                              ),
                            );
                          }),
                          initiallyExpanded: true,
                        );
                      }
                    ),
                )
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 45),
            child: Row(
              children: [
                Expanded(child: Text("Filter".tr, style: Get.textTheme.headline5)),
                MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    controller.filterExpiringContracts();
                    Get.back();
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Get.theme.accentColor.withOpacity(0.15),
                  child: Text("Apply".tr, style: Get.textTheme.subtitle1),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: (Get.width / 2) - 30),
            decoration: BoxDecoration(
              color: Get.theme.focusColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Get.theme.focusColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(3),
              ),
              //child: SizedBox(height: 1,),
            ),
          ),
        ],
      ),
    );
  }
}
