import '../parents/media_model.dart';  

class Authenticate extends MediaModel {
  String domainName;
  String email;
  String password;
  String clientId = "fds";
  String redirectUri = "fdsfsd";

  Authenticate();

  Authenticate.fromJson(Map<String, dynamic> json) {
    domainName =  json['domainName'];
    clientId = json['clientId'];
    redirectUri = json['redirectUri'];
    email = json['email'];
    password = json['password'];
    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['domainName'] = this.domainName;
    data['clientId'] = this.clientId;
    data['redirectUri'] = this.redirectUri;
    data['email'] = this.email;
    data['password'] = this.password;
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    return data;
  }
}