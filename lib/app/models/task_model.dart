import 'package:flutter/material.dart';
import 'contract_model.dart';
import 'parents/media_model.dart';

import '../../common/ui.dart';

class Task extends MediaModel {
  String assignDate;
  String completionDate;
  Contract contract;
  String taskId;
  String recipientId;
  String taskName;
  String packageGuid;
  String taskStatus;
  String taskType;
  String email;
  String firstName;
  String lastName;
  int userId;
  String iconUrl;
  Color color;

  Task({this.taskId, this.recipientId, this.taskName, this.packageGuid, this.taskStatus, this.taskType});

  Task.fromJson(Map<String, dynamic> json) {
    assignDate = json['assignDate'].toString() ?? '';
    completionDate = json['completionDate'].toString() ?? '';
    contract = Contract.fromJson(json['contract']) ?? '';
    taskId = json['id'].toString() ?? '';
    recipientId = json['recipientId'].toString() ?? '';
    taskName = json['name'] ?? '';
    packageGuid = json['packageGuid'] ?? '';
    email = json['user']['email'] ?? '';
    firstName = json['user']['firstName'] ?? '';
    lastName = json['user']['lastName'] ?? '';
    userId = json['user']['userId'] ?? '';
    taskStatus = json['status'] ?? '';
    taskType = json['type'] ?? '';

    switch (taskStatus) {
      case 'COMPLETED' : color = Ui.parseColor('#0abde3'); break;
      case 'PENDING' : color = Ui.parseColor('#ccc900'); break;
      case 'REQUEST CHANGES' : color = Ui.parseColor('#5f27cd'); break;

      default: color = Ui.parseColor('#ababab'); break;
    }

    switch (taskType) {
      case 'Review Task' : iconUrl = "assets/icon/review.png"; break;
      case 'Custom Task' : iconUrl = "assets/icon/custom.png"; break;
      case 'Milestone Task' : iconUrl = "assets/icon/milestone.png"; break;
      case 'External Review' : iconUrl = "assets/icon/external.png"; break;
      case 'Request Task' : iconUrl = "assets/icon/request.png"; break;
      case 'Signature Task' : iconUrl = "assets/icon/signature.png"; break;

      default: iconUrl = "assets/icon/active.png"; break;
    }
    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['assignDate'] = this.assignDate;
    data['completionDate'] = this.completionDate;
    // data['contract'] = this.contract;
    data['id'] = this.taskId;
    data['recipientId'] = this.recipientId;
    data['name'] = this.taskName;
    data['packageGuid'] = this.packageGuid;
    data['status'] = this.taskStatus;
    data['type'] = this.taskType;
    
    return data;
  }
}
