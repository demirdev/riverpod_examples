class Configuration {
  late String baseURL;

  Configuration({required this.baseURL});

  Configuration.fromJson(Map<String, dynamic> json) {
    baseURL = json['baseURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['baseURL'] = this.baseURL;
    return data;
  }
}
