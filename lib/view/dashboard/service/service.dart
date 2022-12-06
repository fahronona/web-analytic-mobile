import 'package:dio/dio.dart';
import 'package:web_monitor/view/dashboard/model/model.dart';

class DashboardService {
  static Future<ReadCountModel> getData() async {
    try {
      var dio = Dio();
      final response = await dio.get(
          "https://api-web-portofolio.vercel.app/read-count", options: Options(
        validateStatus: (status) {
          return true;
        },
      ));

      return ReadCountModel.fromJson(response.data);
    } catch (e) {
      return ReadCountModel.withError(e.toString());
    }
  }
}
