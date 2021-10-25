import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_services_list_item_widget.dart';
import '../../../global_widgets/circular_loading_widget.dart';
import '../../../models/expiring_contract_model.dart';

class SearchServicesListWidget extends StatelessWidget {
  final List<ExpiringContract> expiringContracts;

  SearchServicesListWidget({Key key, List<ExpiringContract> this.expiringContracts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (this.expiringContracts.isEmpty) {
        return CircularLoadingWidget(height: 300);
      } else {
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          primary: false,
          shrinkWrap: true,
          itemCount: expiringContracts.length,
          itemBuilder: ((_, index) {
            var _expiringContract = expiringContracts.elementAt(index);
            return SearchServicesListItemWidget(expiringContract: _expiringContract, expanded: index == 0);
          }),
        );
      }
    });
  }
}
