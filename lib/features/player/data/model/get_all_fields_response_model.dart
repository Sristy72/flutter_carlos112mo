class GetAllFieldsResponseModel {
  final List<dynamic> fields;
  final int totalPages;
  final int currentPage;
  final int totalFields;

  GetAllFieldsResponseModel({
    required this.fields,
    required this.totalPages,
    required this.currentPage,
    required this.totalFields,
  });

  factory GetAllFieldsResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAllFieldsResponseModel(
      fields: json['fields'] ?? [],
      totalPages: json['totalPages'] ?? 0,
      currentPage: json['currentPage'] ?? 1,
      totalFields: json['totalFields'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fields': fields,
      'totalPages': totalPages,
      'currentPage': currentPage,
      'totalFields': totalFields,
    };
  }
}
