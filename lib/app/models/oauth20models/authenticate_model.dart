import '../parents/media_model.dart';  

class Authenticate {
  String domainName;
  String email;
  String password;
  String clientId = "7dc53df5-703e-49b3-8670-b1c468f47f1f";
  String clientSecret = "BhUDJq";
  String redirectUri = "https://test.contractexperience.com/CMx_API/2.0/oauth2/redirect";
  String authorizationCode;

  Authenticate();

  Authenticate.fromJson(Map<String, dynamic> json) {
    domainName =  json['domainName'];
    clientId = json['clientId'];
    redirectUri = json['redirectUri'];
    email = json['email'];
    password = json['password'];
    // super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['domainName'] = this.domainName;
    data['clientId'] = this.clientId;
    data['redirectUri'] = this.redirectUri;
    data['email'] = this.email;
    data['password'] = this.password;
    // if (this.media != null) {
    //   data['media'] = this.media.toJson();
    // }
    return data;
  }
}