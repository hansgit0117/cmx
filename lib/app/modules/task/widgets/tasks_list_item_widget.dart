import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/task_model.dart';
import '../../../../common/ui.dart';
import '../../../routes/app_pages.dart';

class TasksListItemWidget extends StatelessWidget {
  final Task task;
  final String heroTag;
  final bool expanded;
  
  TasksListItemWidget({Key key, this.task, this.heroTag, this.expanded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: Ui.getBoxDecoration(
          border: Border.fromBorderSide(BorderSide.none),
          gradient: new LinearGradient(
              colors: [task.color.withOpacity(0.5), task.color.withOpacity(0.1)],
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
                Get.toNamed(Routes.TASKS, arguments: task);
                //Navigator.of(context).pushNamed('/Details', arguments: RouteArgument(id: '0', param: market.id, heroTag: heroTag));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: (task.mediaUrl.toLowerCase().endsWith('.svg')
                        ? SvgPicture.network(
                            task.mediaUrl,
                            color: task.color,
                            height: 100,
                          )
                        : Image.asset(
                          task.iconUrl,
                          fit: BoxFit.cover,
                          color: task.color,
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
                      task.contract.contractTitle ?? '',
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
                "Contract Number:   " + task.contract.contractNumber,
                maxLines: 2,
                style: Get.textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 60, top: 10),
              child: Text(
                "Contract Title:   " + task.contract.contractTitle,
                maxLines: 2,
                style: Get.textTheme.bodyText2,
              ),
            ), 
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 60, top: 10),
              child: Text(
                "Type:   " + task.taskType,
                maxLines: 2,
                style: Get.textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 60, top: 10),
              child: Text(
                "User Name:   " + task.firstName + task.lastName,
                maxLines: 2,
                style: Get.textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 60, top: 10),
              child: Text(
                "Assgined:   " + DateFormat('MM/dd/yyyy, hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(task.assignDate), isUtc: true)),
                maxLines: 2,
                style: Get.textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 60, top: 10, bottom: 10),
              child: Text(
                "Status:   " + task.taskStatus,
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
