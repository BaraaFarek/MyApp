class ErrorModel {
  // final int status;
  final String error;

  ErrorModel({required this.error});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      // status: jsonData[ApiKey.status],
      error: jsonData['error'],
    );
  }
}
