import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fss;

class SecureStorageServices {
  final _secureStorage = const fss.FlutterSecureStorage();

  Future<String?> read({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> write({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }
}