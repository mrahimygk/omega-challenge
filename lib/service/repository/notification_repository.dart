import 'package:omega/model/Autogenerated.dart';
import 'package:omega/service/repository/base_repo.dart';

abstract class NotificationRepository implements BaseRepo<Notification> {

  Future getUnSeen();
  Future updateNotifications();
}
