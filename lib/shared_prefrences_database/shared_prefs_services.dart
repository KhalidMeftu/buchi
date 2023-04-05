import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  static LocalStorageServices? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageServices> getinstance() async {
    _instance ??= LocalStorageServices();

    _preferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  getDownloadStatus() {
    var status = _getFromDisk('status');
    if (status == null) {
      return null;
    }
    return status;
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences!.get(key);
    return value;
  }
}
