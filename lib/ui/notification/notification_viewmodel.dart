import 'package:invest_app_flutter_test/core/local/app_database.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:uuid/uuid.dart';

class NotificationViewModel extends BaseViewModel {
  NotificationViewModel({required this.appDatabase});
  List<NotificationLocalData> _notifications = [];
  final AppDatabase appDatabase;
  Future onInit() async {
    setLoading(true);
    await appDatabase.notificationLocalDao.deleteAllNotifications();
    await appDatabase.notificationLocalDao
        .insertAllNotifications(_generateNotification());
    _notifications =
        await appDatabase.notificationLocalDao.getAllNotifications();
    setLoading(false);
    notifyListeners();
  }

  List<NotificationLocalData> _generateNotification() {
    final Uuid uuid = Uuid();
    // final String uuidV4 = uuid.v4();
    final List<NotificationLocalData> notifications = [
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.imgNotification1,
        description: "Apple stocks just increased. Check it out now.",
        createdAt: DateTime(2024, 7, 12),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.imgNotification2,
        description: "Check out today’s best inves-tor. You’ll learn from him",
        createdAt: DateTime.now(),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.imgNotification3,
        description: "Where do you see yourself in the next ages.",
        createdAt: DateTime(2024, 7, 10),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.imgNotification1,
        description: "Apple stocks just increased. Check it out now.",
        createdAt: DateTime(2024, 7, 12),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.imgNotification2,
        description: "Check out today’s best inves-tor. You’ll learn from him",
        createdAt: DateTime.now(),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.imgNotification3,
        description: "Where do you see yourself in the next ages.",
        createdAt: DateTime(2024, 7, 10),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.imgNotification1,
        description: "Apple stocks just increased. Check it out now.",
        createdAt: DateTime(2024, 7, 12),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.imgNotification2,
        description: "Check out today’s best inves-tor. You’ll learn from him",
        createdAt: DateTime.now(),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.imgNotification3,
        description: "Where do you see yourself in the next ages.",
        createdAt: DateTime(2024, 7, 10),
      ),
    ];
    return notifications;
  }

  void deleteNotificationById(String id) {
    appDatabase.notificationLocalDao.deleteNotificationById(id);
    _notifications.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  List<NotificationLocalData> get notifications => _notifications;
}
