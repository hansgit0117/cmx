import 'package:dio/dio.dart';

import '../models/user_model.dart';
import '../providers/mock_provider.dart';

class UserRepository {
  MockApiClient _apiClient;

  UserRepository() {
    this._apiClient = MockApiClient(httpClient: Dio());
  }

  Future<List<User>> getAll() {
    return _apiClient.getAllUsers();
  }

  Future<User> login() {
    return _apiClient.getLogin();
  }
}
