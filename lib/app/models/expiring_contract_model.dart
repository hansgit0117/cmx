import 'package:flutter/material.dart';

import '../../common/ui.dart';
import 'parents/media_model.dart';

class ExpiringContract extends MediaModel {
  String contractNumber;
  String contractTitle;
  String contractOwner;
  String expiryDate;
  String status;
  String contractId;
  String iconUrl;
  Color color;

  ExpiringContract({this.color, this.contractId, this.contractNumber, this.contractOwner, this.contractTitle, this.status, this.expiryDate});

  ExpiringContract.fromJson(Map<String, dynamic> json) {
    contractNumber = json['contractNumber'];
    contractTitle = json['contractTitle'];
    expiryDate = json['expiryDate'];
    contractOwner = json['contractOwner'];
    contractId = json['contractId'];
    status = json['status'];
    switch (status) {
      case 'Draft' : color = Ui.parseColor('#ff9f43'); iconUrl = "assets/icon/draft.png"; break;
      case 'Active' : color = Ui.parseColor('#ee5253'); iconUrl = "assets/icon/active.png"; break;
      case 'Approved' : color = Ui.parseColor('#0abde3'); iconUrl = "assets/icon/approved.png"; break;
      case 'Archived' : color = Ui.parseColor('#5f27cd'); iconUrl = "assets/icon/archived.png"; break;
      case 'Cancelled' : color = Ui.parseColor('#10ac84'); iconUrl = "assets/icon/cancelled.png"; break;
      case 'Completed' : color = Ui.parseColor('#ff9f43'); iconUrl = "assets/icon/completed.png"; break;
      case 'Expired' : color = Ui.parseColor('#ee5253'); iconUrl = "assets/icon/expired.png"; break;
      case 'External Review Completed' : color = Ui.parseColor('#0abde3'); iconUrl = "assets/icon/external.png"; break;
      case 'Inactive/On Hold' : color = Ui.parseColor('#5f27cd'); iconUrl = "assets/icon/inactive.png"; break;
      case 'Requested Changes' : color = Ui.parseColor('#10ac84'); iconUrl = "assets/icon/request.png"; break;
      case 'Sent for external Review' : color = Ui.parseColor('#ff9f43'); iconUrl = "assets/icon/sent_external_review.png"; break;
      case 'Sent for Review & Approval' : color = Ui.parseColor('#ee5253'); iconUrl = "assets/icon/sent_review_approval.png"; break;
      case 'Signed' : color = Ui.parseColor('#0abde3'); iconUrl = "assets/icon/signature.png"; break;
      case 'Sent for Signature' : color = Ui.parseColor('#10ac84'); iconUrl = "assets/icon/sent_signature.png"; break;


      default: color = Ui.parseColor('#ababab'); iconUrl = "assets/icon/draft.png"; break;
    }
    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['contractNumber'] = this.contractNumber;
    data['contractTitle'] = this.contractTitle;
    data['contractOwner'] = this.contractOwner;
    data['expiryDate'] = this.expiryDate;
    data['status'] = this.status;
    data['contractId'] = this.contractId;
    data['color'] = this.color.toString();
    return data;
  }
}
