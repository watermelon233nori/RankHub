import 'package:hive_flutter/hive_flutter.dart';

class HiveServices {
  static Future<void> init() async {
    await Hive.initFlutter();
    //Hive.registerAdapter(YourModelAdapter());
  }

  static Future<bool> isCacheValid(String key, Duration cacheDuration) async {
    final lastUpdateBox = await Hive.openBox<DateTime>('lastUpdateBox');
    DateTime? lastCacheTime = lastUpdateBox.get(key);
    return lastCacheTime != null &&
        DateTime.now().difference(lastCacheTime) < cacheDuration;
  }

  static Future<void> saveAllToHive<T>(
      String boxName, List<T> data, dynamic Function(T) keyMapper) async {
    final box = await Hive.openBox<T>(boxName);
    await box.clear();
    for (var item in data) {
      await box.put(keyMapper(item), item);
    }
  }

  static Future<void> saveToHive<T>(
      String boxName, T data, dynamic Function(T) keyMapper) async {
    final box = await Hive.openBox<T>(boxName);
    await box.put(keyMapper(data), data);
  }
}
