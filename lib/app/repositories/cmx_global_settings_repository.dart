import 'package:dio/dio.dart';

import '../models/oauth20models/authenticate_model.dart';
import '../providers/mock_provider.dart';

class CmxGlobalSettingsRepository {
  MockApiClient _apiClient;

  CmxGlobalSettingsRepository() {
    this._apiClient = MockApiClient(httpClient: Dio());
  }

  Future<String> getContractExpirySetting(Authenticate authenticate) {
    return _apiClient.getContractExpirySetting(authenticate);
  }
}
