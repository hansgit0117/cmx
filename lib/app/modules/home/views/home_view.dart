import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/home_search_bar_widget.dart';
import '../../../global_widgets/notifications_button_widget.dart';
import '../../../models/slide_model.dart';
import '../controllers/home_controller.dart';
import '../widgets/address_widget.dart';
import '../widgets/expiring_contract_widget.dart';
import '../widgets/slide_item_widget.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () async {
            controller.refreshHome(showMessage: true);
          },
          child: CustomScrollView(
            primary: true,
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: 280,
                elevation: 0.5,
                // pinned: true,
                floating: true,
                iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
                title: Text(
                  "Home".tr,
                  style: Get.textTheme.headline6,
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: new Icon(Icons.sort, color: Colors.black87),
                  onPressed: () => {Scaffold.of(context).openDrawer()},
                ),
                actions: [NotificationsButtonWidget()],
                bottom: HomeSearchBarWidget(),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Obx(() {
                    return Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: <Widget>[
                        CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 7),
                            height: 310,
                            viewportFraction: 1.0,
                            onPageChanged: (index, reason) {
                              controller.currentSlide.value = index;
                            },
                          ),
                          items: controller.slider.map((Slide slide) {
                            return SlideItemWidget(slide: slide);
                          }).toList(),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: controller.slider.map((Slide slide) {
                              return Container(
                                width: 20.0,
                                height: 5.0,
                                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: controller.currentSlide.value == controller.slider.indexOf(slide) ? Colors.black87 : Colors.black87.withOpacity(0.4)),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  }),
                ).marginOnly(bottom: 42),
              ),
              SliverToBoxAdapter(
                child: Wrap(
                  children: [
                    AddressWidget(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(child: Text("Expiring Contracts".tr, style: Get.textTheme.headline5)),
                          MaterialButton(
                            elevation: 0,
                            onPressed: () {
                              
                            },
                            shape: StadiumBorder(),
                            color: Get.theme.accentColor.withOpacity(0.1),
                            child: Text("View All".tr, style: Get.textTheme.subtitle1),
                          ),
                        ],
                      ),
                    ),
                    ExpiringContractWidget(),
                    Container(
                      color: Get.theme.primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(child: Text("Contract Analytics".tr, style: Get.textTheme.headline5)),
                          MaterialButton(
                            elevation: 0,
                            onPressed: () {},
                            shape: StadiumBorder(),
                            color: Get.theme.accentColor.withOpacity(0.1),
                            child: Text("View All".tr, style: Get.textTheme.subtitle1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
