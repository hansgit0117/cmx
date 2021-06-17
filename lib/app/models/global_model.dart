class Global {
  String mockBaseUrl;

  Global({this.mockBaseUrl});

  Global.fromJson(Map<String, dynamic> json) {
    mockBaseUrl = json['mock_base_url'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mock_base_url'] = this.mockBaseUrl;
    return data;
  }
}
