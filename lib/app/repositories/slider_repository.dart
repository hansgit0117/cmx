import 'package:dio/dio.dart';

import '../models/slide_model.dart';
import '../providers/mock_provider.dart';

class SliderRepository {
  MockApiClient _apiClient;

  SliderRepository() {
    this._apiClient = MockApiClient(httpClient: Dio());
  }

  Future<List<Slide>> getHomeSlider() {
    return _apiClient.getHomeSlider();
  }
}
