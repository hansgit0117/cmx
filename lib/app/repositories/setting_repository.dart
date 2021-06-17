import 'package:dio/dio.dart';

import '../models/setting_model.dart';
import '../providers/mock_provider.dart';

class SettingRepository {
  MockApiClient _apiClient;

  SettingRepository() {
    this._apiClient = MockApiClient(httpClient: Dio());
  }

  Future<Setting> get() {
    return _apiClient.getSettings();
  }
}
