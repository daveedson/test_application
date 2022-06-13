abstract class LocalCache{
   ///Retrieves access token for authorizing requests
  Future<void> getToken(String key);

  ///Saves access token for authorizing requests
  Future<void> saveToken(String key,String value);
}