import 'dart:async';

import 'package:omega/model/Autogenerated.dart';
import 'package:omega/service/db/database_provider.dart';
import 'package:omega/service/repository/notification_repo_implementation.dart';

class NotificationBloc {
  final repo = NotificationRepositoryImpl(DatabaseProvider.get);
  final notificationController =
      StreamController<List<Notification>>.broadcast();

  NotificationBloc() {
    getNotifications();
  }

  getNotifications() async {
    notificationController.add(await repo.getAllFromDb());
  }

  updateNotifications() async {
    await repo.updateNotifications();
    getNotifications();
  }

  insert(data) async {
    await repo.insert(data);
    getNotifications();
  }

  update(data) async {
    await repo.update(data);
    getNotifications();
  }

  setToSeen(Notification notification) async {
    notification.hasSeen = true;
    await repo.update(notification);
    getNotifications();
  }

  dispose() {
    notificationController.close();
  }
}