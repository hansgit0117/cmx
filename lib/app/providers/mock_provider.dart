import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../models/oauth20models/authenticate_model.dart';
import '../models/setting_model.dart';
import '../models/slide_model.dart';
import '../models/expiring_contract_model.dart';
import '../models/task_model.dart';
import '../models/user_model.dart';
import '../services/global_service.dart';
import '../../common/helper.dart';

class MockApiClient {
  final _globalService = Get.find<GlobalService>();
  String get baseUrl => _globalService.global.value.mockBaseUrl;
  String get apiBaseUrl => _globalService.global.value.apiBaseUrl;

  final Dio httpClient;
  final Options _options = buildCacheOptions(Duration(days: 3), forceRefresh: true);

  MockApiClient({@required this.httpClient}) {
    httpClient.interceptors.add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
  }

  Future<List<User>> getAllUsers() async {
    var response = await httpClient.get(baseUrl + "users/all.json", options: _options);
    if (response.statusCode == 200) {
      return response.data['data'].map<User>((obj) => User.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<User> getLogin(Authenticate authenticate) async {
    var params =  {
      "domainName": authenticate.domainName,
      "email": authenticate.email,
      "password": authenticate.password,
      "clientId": authenticate.clientId,
      "redirectUri": authenticate.redirectUri,
    }; 
    var response = await httpClient.post(apiBaseUrl + 'oauth2/authenticateUser',
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status <= 500;
        },
        headers: {
          HttpHeaders.acceptHeader: "application/json",          
          HttpHeaders.contentTypeHeader: "application/json",
          }
        ),
      data: jsonEncode(params),
    );
    if (response.statusCode == 200) {      
      return User.fromJson(response.data);
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<User> issueToken(Authenticate authenticate) async {
    var params = {
      "domainName": authenticate.domainName,
      "clientId": authenticate.clientId,
      "clientSecret": authenticate.clientSecret,
      "authorizationCode": authenticate.authorizationCode,
    };
    var response = await httpClient.post(apiBaseUrl + 'oauth2/token',
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status <= 500;
        },        
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
        }
      ),
      data: jsonEncode(params),
    );
    if(response.statusCode == 200) {
      return User.fromJson(response.data);
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<Slide>> getHomeSlider() async {
    // var response = await httpClient.get(baseUrl + "slides/home.json", options: _options);
    // if (response.statusCode == 200) {
    //   return response.data['results'].map<Slide>((obj) => Slide.fromJson(obj)).toList();
    // } else {
    //   throw new Exception(response.statusMessage);
    // }
    var response = await Helper.getJsonFile('config/home_slide.json');
    return response['results'].map<Slide>((obj) => Slide.fromJson(obj)).toList();
  }

  Future<List<ExpiringContract>> getAllExpiringContracts(Authenticate authenticate) async {
    var params = {
      "expiringInDays": 120
    };
    var response = await httpClient.post(apiBaseUrl + 'contract/2.0/getContractsByDate',
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status <= 500;
        },        
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          "X-AUTH-TOKEN": authenticate.xAuthToken,
          "X-CSRF-TOKEN": authenticate.xCsrfToken,
        }
      ), 
      data: jsonEncode(params),
    );
    if (response.statusCode == 200) {
      return response.data.map<ExpiringContract>((obj) => ExpiringContract.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<List<Task>> getAllTasks(Authenticate authenticate) async {
    var params = {
      "pageNumber": 0, 
      "pageSize": 25
    };
    var response = await httpClient.post('https://live.contractexperience.com/CMx_API/Common/task/2.0/user',
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status <= 500;
        },
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          "X-AUTH-TOKEN": authenticate.xAuthToken,
          "X-CSRF-TOKEN": authenticate.xCsrfToken,
        }
      ),
      data: jsonEncode(params),
    );
    if (response.statusCode == 200) {
      return response.data.map<Task>((obj) => Task.fromJson(obj)).toList();
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<Setting> getSettings() async {
    // var response = await httpClient.get(baseUrl + "settings/all.json", options: _options);
    // if (response.statusCode == 200) {
    //   return Setting.fromJson(response.data['data']);
    // } else {
    //   throw new Exception(response.statusMessage);
    // }
    var response = await Helper.getJsonFile('config/global_settings.json');
    return Setting.fromJson(response);
  }

  Future<String> getContractExpirySetting(Authenticate authenticate) async {
    var response = await httpClient.get('https://live.contractexperience.com/CMx_API/Common/configuration/2.0/name/cmx.reminder.contract.expiry.email',
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status <= 500;
        },
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          "X-AUTH-TOKEN": authenticate.xAuthToken,
          "X-CSRF-TOKEN": authenticate.xCsrfToken,
          "domain": authenticate.domainName,
        }
      ),
    );
    if (response.statusCode == 200) {
      return response.data ?? "2,5,30,60,90,120";
    } else if (response.statusCode == 204) {
      return "2,5,30,60,90,120";
    } else {
      throw new Exception(response.statusMessage);
    }
  }
}
