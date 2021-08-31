
import 'parents/media_model.dart';

class Contract extends MediaModel {
  String contractId;
  String contractNumber;
  String contractTitle;

  Contract({this.contractId, this.contractNumber, this.contractTitle});

  Contract.fromJson(Map<String, dynamic> json) {
    contractId = json['contractId'].toString();
    contractNumber = json['contractNumber'].toString();
    contractTitle = json['contractTitle'] ?? '';
    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['contractId'] = this.contractId;
    data['contractNumber'] = this.contractNumber;
    data['contractTitle'] = this.contractTitle;
    
    return data;
  }
}