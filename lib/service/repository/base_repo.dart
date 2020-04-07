import 'package:omega/service/db/database_provider.dart';

abstract class BaseRepo<T> {
  DatabaseProvider databaseProvider;

  Future insert(T data);

  Future update(T data);

  Future delete(T data);

  Future<T> getFromDb(String id);

  Future<List<T>> getAllFromDb();
}
