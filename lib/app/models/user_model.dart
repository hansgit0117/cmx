import 'parents/media_model.dart';

class User extends MediaModel {
  String name;
  String email;
  String password;
  String apiToken;
  String deviceToken;
  String phone;
  bool verifiedPhone;
  String verificationId;
  String address;
  String bio;

  bool auth;

  User({this.name, this.email, this.password, this.apiToken, this.deviceToken, this.phone, this.verifiedPhone, this.verificationId, this.address, this.bio});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    apiToken = json['apiToken'];
    deviceToken = json['deviceToken'];
    phone = json['phone'];
    verifiedPhone = json['verifiedPhone'];
    verificationId = json['verificationId'];
    address = json['address'];
    bio = json['bio'];
    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['apiToken'] = this.apiToken;
    data['deviceToken'] = this.deviceToken;
    data['phone'] = this.phone;
    data['verifiedPhone'] = this.verifiedPhone;
    data['verificationId'] = this.verificationId;
    data['address'] = this.address;
    data['bio'] = this.bio;
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    return data;
  }

  Map toRestrictMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["email"] = email;
    map["name"] = name;
    map["thumb"] = mediaThumb;
    map["device_token"] = deviceToken;
    return map;
  }
}
