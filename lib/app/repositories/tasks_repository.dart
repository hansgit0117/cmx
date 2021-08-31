import 'package:dio/dio.dart';
import '../models/oauth20models/authenticate_model.dart';
import '../models/task_model.dart';

import '../providers/mock_provider.dart';

class TasksRepository {
  MockApiClient _apiClient;

  TasksRepository() {
    this._apiClient = MockApiClient(httpClient: Dio());
  }

  Future<List<Task>> getAll(Authenticate authenticate) {
    return _apiClient.getAllTasks(authenticate);
  }
}
