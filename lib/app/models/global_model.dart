class Global {
  String mockBaseUrl;
  String apiBaseUrl;

  Global({this.mockBaseUrl, this.apiBaseUrl});

  Global.fromJson(Map<String, dynamic> json) {
    mockBaseUrl = json['mock_base_url'].toString();
    apiBaseUrl = json['api_base_url'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mock_base_url'] = this.mockBaseUrl;
    data['api_base_url'] = this.apiBaseUrl;
    return data;
  }
}
