import 'base_api.dart';

class NotificationApi {
  final BaseApi api = BaseApi();

  Future<dynamic> fetchAll(Map<String, dynamic> params) async {
    return api.get(NOTIFICATIONS_URL, params);
  }
}

const NOTIFICATIONS_URL = "/Article/GetList/2766";
