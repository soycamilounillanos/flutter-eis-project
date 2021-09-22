class ListModel {
  int total;
  int page;
  int limit;
  dynamic data;

  ListModel({
    required this.total,
    required this.page,
    required this.limit,
    required this.data,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
    total: json["total"],
    page: json["page"],
    limit: json["limit"],
    data: json["data"],
  );
}
