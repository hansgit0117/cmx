import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class ExpiringContractWidget extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.only(bottom: 15),
      child: Obx(() {
        return ListView.builder(
            primary: false,
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            itemCount: controller.expiringContracts.length,
            itemBuilder: (_, index) {
              var _expiringContracts = controller.expiringContracts.elementAt(index);
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.ROOT, arguments: _expiringContracts);
                },
                child: Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsetsDirectional.only(end: 20, start: index == 0 ? 20 : 0),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [_expiringContracts.color.withOpacity(1), _expiringContracts.color.withOpacity(0.5)],
                        begin: AlignmentDirectional.topStart,
                        //const FractionalOffset(1, 0),
                        end: AlignmentDirectional.bottomEnd,
                        stops: [0.1, 0.9],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 30, top: 30),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 30, top: 30),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: (_expiringContracts.iconUrl.toLowerCase().endsWith('.svg')
                              ? SvgPicture.network(
                                  _expiringContracts.iconUrl,
                                  color: _expiringContracts.color,
                                )
                              : Image.asset(
                                  _expiringContracts.iconUrl,
                                  fit: BoxFit.cover,
                                  color: _expiringContracts.color,
                                )).marginSymmetric(vertical: 16, horizontal: 0)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 10, top: 10),
                        child: Text(
                          _expiringContracts.contractTitle ?? '',
                          maxLines: 2,
                          style: Get.textTheme.bodyText2.merge(TextStyle(color: Get.theme.primaryColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
