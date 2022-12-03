abstract class AuthStoreRepo {
  Future<void> storeToken(String token);
  Future<String?> getToken();
}
