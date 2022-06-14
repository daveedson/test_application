import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/config/services/local/repositores/local_cache.dart';

class LocalCacheImplementation implements LocalCache {
  
  @override
  getStringValue(name)async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
  String? persitValue = prefs.getString(name);
  return persitValue;
  }

  @override
  setIntValue(String name, int value) async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(name, value);
  }

  @override
  setStringValue(String name, String value)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(name, value);
  }
  @override 
  getIntValue(name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? persitValue = prefs.getInt(name);
  return persitValue;
}
@override
removeValue(name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(name);
}
  

}
