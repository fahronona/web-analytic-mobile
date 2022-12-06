class ReadCountModel {
  String status = "";
  List<DataCountModel> data = [];
  String error = "";

  ReadCountModel.withError(String errorMessage) {
    error = errorMessage;
  }

  ReadCountModel({this.status = "", this.data = const []});

  ReadCountModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    json["data"].forEach((v) {
      data.add(DataCountModel.fromJson(v));
    });
  }
}

class DataCountModel {
  String action = "";
  int count = 0;
  String date = "";

  DataCountModel({this.action = "", this.count = 0, this.date = ""});

  DataCountModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    count = json['count'];
    date = json["date"];
  }
}
