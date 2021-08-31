import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../models/task_model.dart';
import '../../../../common/ui.dart';
import '../../../routes/app_pages.dart';

class TasksGridItemWidget extends StatelessWidget {
  final Task task;
  final String heroTag;

  TasksGridItemWidget({Key key, this.task, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      onTap: () {
        Get.toNamed(Routes.TASKS, arguments: task);
        //Navigator.of(context).pushNamed('/Details', arguments: RouteArgument(id: '0', param: market.id, heroTag: heroTag));
      },
      child: Container(
        decoration: Ui.getBoxDecoration(),
        child: Wrap(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [task.color.withOpacity(1), task.color.withOpacity(0.1)],
                    begin: AlignmentDirectional.topStart,
                    //const FractionalOffset(1, 0),
                    end: AlignmentDirectional.bottomEnd,
                    stops: [0.1, 0.9],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
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
                  )).marginSymmetric(vertical: 10, horizontal: 40),  
                  // : CachedNetworkImage(
                  //     fit: BoxFit.cover,
                  //     imageUrl: expiringContract.iconUrl,
                  //     placeholder: (context, url) => Image.asset(
                  //       'assets/img/loading.gif',
                  //       fit: BoxFit.cover,
                  //     ),
                  //     errorWidget: (context, url, error) => Icon(Icons.error_outline),
                  //   )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    task.contract.contractTitle ?? '',
                    style: Theme.of(context).textTheme.bodyText2,
                    softWrap: false,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  // TODO load subcategories of each category
                  // if ((category.subCategories?.length ?? 0) > 0) Divider(height: 25, thickness: 0.5),
                  // Wrap(
                  //   spacing: 5,
                  //   children: List.generate(category.subCategories?.length ?? 0, (index) {
                  //     var _category = category.subCategories.elementAt(index);
                  //     return GestureDetector(
                  //       onTap: () {
                  //         Get.toNamed(Routes.CATEGORY, arguments: _category);
                  //         //printInfo(info: _category.name);
                  //       },
                  //       child: Container(
                  //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  //         child: Text(_category.name, style: Get.textTheme.caption.merge(TextStyle(fontSize: 10))),
                  //         decoration: BoxDecoration(
                  //             color: Get.theme.primaryColor,
                  //             border: Border.all(
                  //               color: Get.theme.focusColor.withOpacity(0.2),
                  //             ),
                  //             borderRadius: BorderRadius.all(Radius.circular(20))),
                  //       ),
                  //     );
                  //   }),
                  //   runSpacing: 5,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
