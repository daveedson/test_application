abstract class LocalCache{
   ///Retrieves access token for authorizing requests
  Future<dynamic> getToken(String key);

  ///Saves access token for authorizing requests
  Future<dynamic> saveToken(String key,String value);
}