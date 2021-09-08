import 'parents/model.dart';

class Notification extends Model {
  String id;
  String type;
  Map<String, dynamic> data;
  bool read;
  String createdAt;
  String owner;
  String contractNumber;
  String status;

  Notification({this.id, this.type, this.data, this.read, this.createdAt});

  Notification.fromJson(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'];
      type = jsonMap['type'] != null ? jsonMap['type'].toString() : '';
      data = jsonMap['data'] != null ? {} : {};
      read = jsonMap['read_at'] != null ? true : false;
      createdAt = jsonMap['created_at'];
    } catch (e) {
      id = '';
      type = '';
      data = {};
      read = false;
      createdAt = '';
      print(e);
    }
  }

  Map markReadMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["read_at"] = !read;
    return map;
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['data'] = this.data;
    data['read'] = this.read;
    data['createdAt'] = this.createdAt;
    data['owner'] = this.owner;
    data['contractNumber'] = this.contractNumber;
    data['status'] = this.status;
    
    return data;
  }
}
