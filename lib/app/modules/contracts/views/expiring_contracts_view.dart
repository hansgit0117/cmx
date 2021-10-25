
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../widgets/contracts_list_item_widget.dart';
import '../widgets/contracts_grid_item_widget.dart';
import '../../../global_widgets/search_bar_widget.dart';
import '../controllers/contracts_controller.dart';

class ExpiringContractsView extends GetView<ContractsController> {
  final controller = Get.put(ContractsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Expiring Contracts".tr,
            style: Get.textTheme.headline6,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
            onPressed: () => {Get.back()},
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.refreshContracts(showMessage: true);
          },
          child: ListView(
            primary: true,
            children: [
              // SearchBarWidget().paddingSymmetric(horizontal: 20, vertical: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Row(children: [
                  Expanded(
                    child: Text(
                      "Expiring Contracts".tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          controller.layout.value = ContractsLayout.LIST;
                        },
                        icon: Obx(() {
                          return Icon(
                            Icons.format_list_bulleted,
                            color: controller.layout.value == ContractsLayout.LIST ? Get.theme.accentColor : Get.theme.focusColor,
                          );
                        }),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.layout.value = ContractsLayout.GRID;
                        },
                        icon: Obx(() {
                          return Icon(
                            Icons.apps,
                            color: controller.layout.value == ContractsLayout.GRID ? Get.theme.accentColor : Get.theme.focusColor,
                          );
                        }),
                      )
                    ],
                  ),
                ]),
              ),
              Obx(() {
                return Offstage(
                  offstage: controller.layout.value != ContractsLayout.GRID,
                  child: StaggeredGridView.countBuilder(
                    primary: false,
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: controller.expiringContracts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ContractsGridItemWidget(expiringContract: controller.expiringContracts.elementAt(index), heroTag: "heroTag");
                    },
                    staggeredTileBuilder: (int index) => new StaggeredTile.fit(Get.mediaQuery.orientation == Orientation.portrait ? 2 : 4),
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                  ),
                );
              }),
              Obx(() {
                return Offstage(
                  offstage: controller.layout.value != ContractsLayout.LIST,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: controller.expiringContracts.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemBuilder: (context, index) {
                      return ContractsListItemWidget(
                        heroTag: 'category_list',
                        expanded: index == 0,
                        expiringContract: controller.expiringContracts.elementAt(index),
                      );
                    },
                  ),
                );
              }),
              // Container(
              //   child: ListView(
              //       primary: false,
              //       shrinkWrap: true,
              //       children: List.generate(controller.expiringContracts.length, (index) {
              //         return Obx(() {
              //           var _category = controller.expiringContracts.elementAt(index);
              //           return Padding(
              //             padding: const EdgeInsetsDirectional.only(start: 20),
              //             child: Text(_category.contractTitle),
              //           );
              //         });
              //       })),
              // ),
            ],
          ),
        ));
  }
}
