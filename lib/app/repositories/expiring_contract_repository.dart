import 'package:dio/dio.dart';

import '../models/expiring_contract_model.dart';
import '../providers/mock_provider.dart';

class ExpiringContractRepository {
  MockApiClient _apiClient;

  ExpiringContractRepository() {
    this._apiClient = MockApiClient(httpClient: Dio());
  }

  Future<List<ExpiringContract>> getAll() {
    return _apiClient.getAllExpiringContracts();
  }
}
