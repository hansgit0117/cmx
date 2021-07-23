import 'package:dio/dio.dart';
import '../models/oauth20models/authenticate_model.dart';

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

  Future<User> login(Authenticate authenticate) {
    return _apiClient.getLogin(authenticate);
  }

  Future<User> issueToken(Authenticate authenticate) {
    return _apiClient.issueToken(authenticate);
  }
}
