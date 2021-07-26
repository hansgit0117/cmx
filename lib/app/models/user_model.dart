import 'parents/media_model.dart';

class User extends MediaModel {
  String authorizationCode;
  String redirectUri;

  String alternateContactPhone;
  String createdBy;
  String emailId;
  String firstName;
  String idp;
  String initials;
  String lang;
  String lastName;
  String middleName;
  String modifiedBy;
  String primaryContactPhone;
  String profilePicture;
  String qrCode;
  String requestLink;
  String secretKey;
  String timeZone;
  String userGroups;
  String userType;
  String xAuthToken;
  String accessToken;
  String refreshToken;
  String tokenType;

  int createdDate;
  int expiresIn;
  int idVal;
  int lastLoginDate;
  int lockCount;
  int modifiedDate;
  int statusId;

  bool auth;
  bool isActive;
  bool isApprover;
  bool isMFAEnabled;
  bool notificationsState;

  User({
    this.authorizationCode,
    });

  User.fromJson(Map<String, dynamic> json) {
    authorizationCode = json['authorizationCode']?? null;
    auth = json['isAuthenticated']?? null;
    redirectUri = json['redirectUri']?? null;
    accessToken = json['accessToken']?? null;
    refreshToken = json['refreshToken']?? null;
    tokenType = json['tokenType']?? null;
    expiresIn = json['expiresIn']?? null;
    xAuthToken = json['xAuthToken']?? null;

    if (json['user'] != null) {
      alternateContactPhone = json['user']['alternateContactPhone']?? null;
      createdBy = json['user']['createdBy']?? null;
      emailId = json['user']['emailID']?? null;
      firstName = json['user']['firstName']?? null;
      idp = json['user']['idp']?? null;
      initials = json['user']['initials']?? null;
      lang = json['user']['lang']?? null;
      lastName = json['user']['lastName']?? null;
      middleName = json['user']['middleName']?? null;
      modifiedBy = json['user']['modifiedBy']?? null;
      primaryContactPhone = json['user']['primaryContactPhone']?? null;
      profilePicture = json['user']['profilePicture']?? null;
      qrCode = json['user']['qrCode']?? null;
      requestLink = json['user']['requestLink']?? null;
      secretKey = json['user']['secretKey']?? null;
      timeZone = json['user']['timeZone']?? null;
      userGroups = json['user']['userGroups']?? null;
      userType = json['user']['userType']['type']?? null;
      createdDate = json['user']['createdDate']?? null;
      idVal = json['user']['idVal']?? null;
      lastLoginDate = json['user']['lastLoginDate']?? null;
      lockCount = json['user']['lockCount']?? null;
      modifiedDate = json['user']['modifiedDate']?? null;
      statusId = json['user']['statusId']?? null;
      isActive = json['user']['isActive']?? null;
      isApprover = json['user']['isApprover']?? null;
      isMFAEnabled = json['user']['isMFAEnabled']?? null;
      notificationsState = json['user']['notificationsState']?? null;
    }
    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['authorizationCode'] = this.authorizationCode;
    data['isAuthenticated'] = this.auth;
    data['redirectUri'] = this.redirectUri;
    data['alternateContactPhone'] = this.alternateContactPhone;
    data['createdBy'] = this.createdBy;
    data['emailID'] = this.emailId;
    data['firstName'] = this.firstName; 
    data['idp'] = this.idp; 
    data['initials'] = this.initials; 
    data['lang'] = this.lang; 
    data['lastName'] = this.lastName;
    data['middleName'] = this.middleName;
    data['modifiedBy'] = this.modifiedBy;
    data['primaryContactPhone'] = this.primaryContactPhone;
    data['profilePicture'] = this.profilePicture;
    data['qrCode'] = this.qrCode;
    data['requestLink'] = this.requestLink;
    data['secretKey'] = this.secretKey; 
    data['timeZone'] = this.timeZone;
    data['userGroups'] = this.userGroups; 
    data['userType'] = this.userType;
    data['createdDate'] = this.createdDate; 
    data['idVal'] = this.idVal;
    data['lastLoginDate'] = this.lastLoginDate;
    data['lockCount'] = this.lockCount;
    data['modifiedDate'] = this.modifiedDate; 
    data['statusId'] = this.statusId; 
    data['isActive'] = this.isActive;
    data['isApprover'] = this.isApprover;
    data['isMFAEnabled'] = this.isMFAEnabled;
    data['notificationsState'] = this.notificationsState;
    data['xAuthToken'] = this.xAuthToken;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['expiresIn'] = this.expiresIn;

    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    return data;
  }

  Map toRestrictMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["thumb"] = mediaThumb;
    return map;
  }
}
