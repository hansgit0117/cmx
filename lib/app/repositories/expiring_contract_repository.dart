import 'package:dio/dio.dart';
import '../models/oauth20models/authenticate_model.dart';

import '../models/expiring_contract_model.dart';
import '../providers/mock_provider.dart';

class ExpiringContractRepository {
  MockApiClient _apiClient;

  ExpiringContractRepository() {
    this._apiClient = MockApiClient(httpClient: Dio());
  }

  Future<List<ExpiringContract>> getAll(Authenticate authenticate) {
    return _apiClient.getAllExpiringContracts(authenticate);
  }
}
