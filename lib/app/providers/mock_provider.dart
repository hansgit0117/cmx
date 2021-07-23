import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get.dart';
import '../models/oauth20models/authenticate_model.dart';
import 'package:meta/meta.dart';

import '../models/setting_model.dart';
import '../models/slide_model.dart';
import '../models/expiring_contract_model.dart';
import '../models/user_model.dart';
import '../services/global_service.dart';
import '../../common/helper.dart';

class MockApiClient {
  final _globalService = Get.find<GlobalService>();
  String get baseUrl => _globalService.global.value.mockBaseUrl;

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
    var response = await httpClient.post('https://api.contractexperience.com/CMx_API/Common/userDetails/1.0/authenticateUser',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      }),
      data: jsonEncode(params),
    );
    if (response.statusCode == 200) {
      return User.fromJson(response.data['data']);
    } else {
      throw new Exception(response.statusMessage);
    }
  }

  Future<User> issueToken(Authenticate authenticate) async {
    print(authenticate);
    var response = await Helper.getJsonFile('config/expiring_contract.json');
    return User.fromJson(response.data['data']);
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

  Future<List<ExpiringContract>> getAllExpiringContracts() async {
    var response = await Helper.getJsonFile('config/expiring_contract.json');
    return response['results'].map<ExpiringContract>((obj) => ExpiringContract.fromJson(obj)).toList();
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
}
