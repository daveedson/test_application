import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/config/services/local/repositores/local_cache.dart';

class LocalCacheImplementation implements LocalCache {
  
  @override
  Future<void> getToken(String key) async {
   final prefs = await SharedPreferences.getInstance();
   prefs.getString(key);
  }

  @override
  Future<void> saveToken(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
  }
}