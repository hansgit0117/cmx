import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../models/expiring_contract_model.dart';

import '../../../../common/ui.dart';
import '../../../routes/app_pages.dart';

class ContractsListItemWidget extends StatelessWidget {
  final ExpiringContract expiringContract;
  final String heroTag;
  final bool expanded;

  ContractsListItemWidget({Key key, this.expiringContract, this.heroTag, this.expanded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: Ui.getBoxDecoration(
          border: Border.fromBorderSide(BorderSide.none),
          gradient: new LinearGradient(
              colors: [expiringContract.color.withOpacity(0.5), expiringContract.color.withOpacity(0.1)],
              begin: AlignmentDirectional.topStart,
              //const FractionalOffset(1, 0),
              end: AlignmentDirectional.topEnd,
              stops: [0.0, 0.5],
              tileMode: TileMode.clamp)),
      child: Theme(
        data: Get.theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: this.expanded,
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          title: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Theme.of(context).accentColor.withOpacity(0.08),
              onTap: () {
                Get.toNamed(Routes.EXPIRING_CONTRACTS, arguments: expiringContract);
                //Navigator.of(context).pushNamed('/Details', arguments: RouteArgument(id: '0', param: market.id, heroTag: heroTag));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: (expiringContract.mediaUrl.toLowerCase().endsWith('.svg')
                        ? SvgPicture.network(
                            expiringContract.mediaUrl,
                            color: expiringContract.color,
                            height: 100,
                          )
                        : Image.asset(
                          expiringContract.iconUrl,
                          fit: BoxFit.cover,
                          color: expiringContract.color,
                        )).marginSymmetric(vertical: 10, horizontal: 10),
                        // : CachedNetworkImage(
                        //     fit: BoxFit.cover,
                        //     imageUrl: expiringContract.mediaUrl,
                        //     placeholder: (context, url) => Image.asset(
                        //       'assets/img/loading.gif',
                        //       fit: BoxFit.cover,
                        //     ),
                        //     errorWidget: (context, url, error) => Icon(Icons.error_outline),
                        //   )),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      expiringContract.contractTitle ?? '',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: Get.textTheme.bodyText2,
                    ),
                  ),
                  // TODO get service for each category
                  // Text(
                  //   "(" + category.services.length.toString() + ")",
                  //   overflow: TextOverflow.fade,
                  //   softWrap: false,
                  //   style: Get.textTheme.caption,
                  // ),
                ],
              )),
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 60, top: 10),
              child: Text(
                "Number:   " + expiringContract.contractNumber,
                maxLines: 2,
                style: Get.textTheme.bodyText2,
              ),
            ), 
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 60, top: 10),
              child: Text(
                "Owner:   " + expiringContract.contractOwner,
                maxLines: 2,
                style: Get.textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 60, top: 10),
              child: Text(
                "Expiry Date:   " + expiringContract.expiryDate,
                maxLines: 2,
                style: Get.textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 60, top: 10, bottom: 10),
              child: Text(
                "Status:   " + expiringContract.status,
                maxLines: 2,
                style: Get.textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
