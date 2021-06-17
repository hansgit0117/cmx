import 'package:flutter/material.dart';

import '../../common/ui2.dart';
import 'parents/media_model.dart';

class ExpiringContract extends MediaModel {
  String name;
  String contractNumber;
  String contractTitle;
  String expiringDate;
  Color color;
  List<ExpiringContract> subExpiringContracts;

  ExpiringContract({this.name, this.color, this.subExpiringContracts});

  ExpiringContract.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = Ui.parseColor(json['color'] != null ? json['color'].toString() : '#000000');
    contractNumber = json['contractNumber'];
    contractTitle = json['contractTitle'];
    expiringDate = json['expiringDate'];
    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    data['color'] = this.color.toString();
    return data;
  }
}
