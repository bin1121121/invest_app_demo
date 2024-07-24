import 'package:invest_app_flutter_test/core/local/app_database.dart';
import 'package:invest_app_flutter_test/ui/base/base_viewmodel.dart';
import 'package:invest_app_flutter_test/utils/app_assets.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class NotificationViewModel extends BaseViewModel {
  List<NotificationLocalData> _notifications = [];
  late final AppDatabase _appDatabase;
  Future onInit() async {
    setLoading(true);
    _appDatabase = Provider.of<AppDatabase>(context, listen: false);
    await _appDatabase.notificationLocalDao.deleteAllNotifications();
    await _appDatabase.notificationLocalDao
        .insertAllNotifications(_generateNotification());
    _notifications =
        await _appDatabase.notificationLocalDao.getAllNotifications();
    setLoading(false);
    notifyListeners();
  }

  List<NotificationLocalData> _generateNotification() {
    final Uuid uuid = Uuid();
    // final String uuidV4 = uuid.v4();
    final List<NotificationLocalData> notifications = [
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.img_notification_1,
        description: "Apple stocks just increased. Check it out now.",
        createdAt: DateTime(2024, 7, 12),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.img_notification_2,
        description:
            "Check out today\’s best inves-tor. You\’ll learn from him",
        createdAt: DateTime.now(),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.img_notification_3,
        description: "Where do you see yourself in the next ages.",
        createdAt: DateTime(2024, 7, 10),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.img_notification_1,
        description: "Apple stocks just increased. Check it out now.",
        createdAt: DateTime(2024, 7, 12),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.img_notification_2,
        description:
            "Check out today\’s best inves-tor. You\’ll learn from him",
        createdAt: DateTime.now(),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.img_notification_3,
        description: "Where do you see yourself in the next ages.",
        createdAt: DateTime(2024, 7, 10),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.img_notification_1,
        description: "Apple stocks just increased. Check it out now.",
        createdAt: DateTime(2024, 7, 12),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.img_notification_2,
        description:
            "Check out today\’s best inves-tor. You\’ll learn from him",
        createdAt: DateTime.now(),
      ),
      NotificationLocalData(
        id: uuid.v4(),
        thumbnail: AppAssets.img_notification_3,
        description: "Where do you see yourself in the next ages.",
        createdAt: DateTime(2024, 7, 10),
      ),
    ];
    return notifications;
  }

  void deleteNotificationById(String id) {
    _appDatabase.notificationLocalDao.deleteNotificationById(id);
    _notifications.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  List<NotificationLocalData> get notifications => _notifications;
}
