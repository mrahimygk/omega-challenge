import 'package:omega/model/Autogenerated.dart';
import 'package:omega/service/api/notification_api.dart';
import 'package:omega/service/db/dao/notification_dao.dart';
import 'package:omega/service/db/database_provider.dart';
import 'package:omega/service/repository/notification_repository.dart';
import 'package:sqflite/sqflite.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final dao = NotificationDao();
  final api = NotificationApi();

  @override
  DatabaseProvider databaseProvider;

  NotificationRepositoryImpl(this.databaseProvider);

  @override
  Future insert(Notification data) async {
    final db = await databaseProvider.db();
    await db.insert(notificationTable, dao.toMap(data),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  @override
  Future update(Notification data) async {
    final db = await databaseProvider.db();
    await db.update(notificationTable, dao.toMap(data),
        where: '$notificationColArticleId = ?', whereArgs: [data.articleId]);
  }

  @override
  Future delete(Notification data) async {
    final db = await databaseProvider.db();
    await db.delete(notificationTable,
        where: '$notificationColArticleId = ?', whereArgs: [data.articleId]);
  }

  @override
  Future<Notification> getFromDb(String articleId) async {
    final db = await databaseProvider.db();
    List<Map> map = await db.query(notificationTable,
        limit: 1,
        columns: [
          notificationColArticleId,
          notificationColTitle,
          notificationColContent,
          notificationColDescription,
          notificationColUrl,
          notificationColUserDisplayName,
          notificationColShortDescriptionLenght,
          notificationColShortTitleLenght,
          notificationColPublishDate,
          notificationColCreateDate,
          notificationColApprovedDate,
          notificationColExpireDate,
          notificationColUpdateDate,
          notificationColLastViewDate,
          notificationColShamsiPublishDate,
          notificationColShamsiCreateDate,
          notificationColShamsiApprovedDate,
          notificationColShamsiExpireDate,
          notificationColShamsiUpdateDate,
          notificationColShamsiLastViewDate,
          notificationColCreateByUser,
          notificationColApprovedByUser,
//          notificationColExtraFieldValues,
          notificationColRelatedUrl,
//          notificationColCategory,
          notificationColCategoryName,
          notificationColImageUrl,
          notificationColVoteTotal,
          notificationColVoteNumber,
          notificationColPoId,
          notificationColPortalId,
          notificationHasSeen
        ],
        where: '$articleId = ?',
        whereArgs: [articleId]);
    if (map.length > 0) {
      return dao.fromList(map).first;
    }
    return null;
  }

  @override
  Future<List<Notification>> getUnSeen() async {
    final db = await databaseProvider.db();
    List<Map> map = await db.query(notificationTable,
        columns: [
          notificationColArticleId,
          notificationColTitle,
          notificationColContent,
          notificationColDescription,
          notificationColUrl,
          notificationColUserDisplayName,
          notificationColShortDescriptionLenght,
          notificationColShortTitleLenght,
          notificationColPublishDate,
          notificationColCreateDate,
          notificationColApprovedDate,
          notificationColExpireDate,
          notificationColUpdateDate,
          notificationColLastViewDate,
          notificationColShamsiPublishDate,
          notificationColShamsiCreateDate,
          notificationColShamsiApprovedDate,
          notificationColShamsiExpireDate,
          notificationColShamsiUpdateDate,
          notificationColShamsiLastViewDate,
          notificationColCreateByUser,
          notificationColApprovedByUser,
//          notificationColExtraFieldValues,
          notificationColRelatedUrl,
//          notificationColCategory,
          notificationColCategoryName,
          notificationColImageUrl,
          notificationColVoteTotal,
          notificationColVoteNumber,
          notificationColPoId,
          notificationColPortalId,
          notificationHasSeen
        ],
        where: "$notificationHasSeen = ? AND datetime($notificationColExpireDate) > datetime('now')",
        whereArgs: ['false']);
    if (map.length > 0) {
      return dao.fromList(map);
    }
    return null;
  }

  @override
  Future<List<Notification>> getAllFromDb() async {
    final db = await databaseProvider.db();
    List<Map> map = await db.query(
      notificationTable,
      columns: [
        notificationColArticleId,
        notificationColTitle,
        notificationColContent,
        notificationColDescription,
        notificationColUrl,
        notificationColUserDisplayName,
        notificationColShortDescriptionLenght,
        notificationColShortTitleLenght,
        notificationColPublishDate,
        notificationColCreateDate,
        notificationColApprovedDate,
        notificationColExpireDate,
        notificationColUpdateDate,
        notificationColLastViewDate,
        notificationColShamsiPublishDate,
        notificationColShamsiCreateDate,
        notificationColShamsiApprovedDate,
        notificationColShamsiExpireDate,
        notificationColShamsiUpdateDate,
        notificationColShamsiLastViewDate,
        notificationColCreateByUser,
        notificationColApprovedByUser,
//        notificationColExtraFieldValues,
        notificationColRelatedUrl,
//        notificationColCategory,
        notificationColCategoryName,
        notificationColImageUrl,
        notificationColVoteTotal,
        notificationColVoteNumber,
        notificationColPoId,
        notificationColPortalId,
        notificationHasSeen,
      ],
    );
    if (map.length > 0) {
      return dao.fromList(map);
    }
    return null;
  }

  @override
  Future updateNotifications() async {
    final response = await api.fetchAll(Map<String, dynamic>());
    final db = await databaseProvider.db();
    Batch batch = db.batch();
    response['list'].forEach((n) {
      batch.insert(notificationTable, dao.toMap(Notification.fromJson(n)),
          conflictAlgorithm: ConflictAlgorithm.ignore);
    });
    await batch.commit(noResult: true);
  }
}
