class StoreCategories {
  late List<String> list;

  StoreCategories({required this.list});

  StoreCategories.fromJson(List<dynamic> json) {
    list = json.cast<String>();
  }
}
