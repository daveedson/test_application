abstract class LocalCache{
   ///Retrieves access token for authorizing requests
  setStringValue(String name, String value);

  ///Saves access token for authorizing requests
  setIntValue(String name, int value); 

  getStringValue(name);

  getIntValue(name);

  removeValue(name);
}