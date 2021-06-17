import 'package:flutter/material.dart';

import '../../common/ui.dart';
import 'parents/media_model.dart';

class Slide extends MediaModel {
  String title;
  String description;
  String localImagePath;
  Color textColor;

  Slide({this.title, this.description, this.textColor});

  Slide.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    textColor = Ui.parseColor(json['textColor'] != null ? json['textColor'].toString() : '#000000');
    localImagePath = json['localImagePath'];
    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['textColor'] = this.textColor.toString();
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    return data;
  }
}
