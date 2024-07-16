import 'package:drift/drift.dart';
import 'package:invest_app_flutter_test/core/local/app_database.dart';
part 'user_model_dao.g.dart';

@DriftAccessor(tables: [UserModel])
class UserModelDao extends DatabaseAccessor<AppDatabase>
    with _$UserModelDaoMixin {
  UserModelDao(AppDatabase db) : super(db);

  Future<UserModelData?> getUserByEmailAndPassword(
          String email, String password) =>
      (select(userModel)
            ..where((tbl) =>
                tbl.email.equals(email) & tbl.password.equals(password)))
          .getSingleOrNull();

  Future<int> insertUser(UserModelData user) async {
    return await deleteUser().then((_) {
      return into(userModel).insert(user);
    });
  }

  Future<List<UserModelData>> getALlUser() => (select(userModel)).get();

  Future<void> deleteUserByEmail(String email) =>
      (delete(userModel)..where((tbl) => tbl.email.equals(email))).go();

  Future<void> deleteUser() => (delete(userModel)).go();
}
