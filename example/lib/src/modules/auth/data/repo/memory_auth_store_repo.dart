import 'package:example/src/modules/auth/data/repo/interface/auth_store_repo.dart';

class MemoryAuthStoreRepo implements AuthStoreRepo {
  String? _token;

  @override
  Future<void> storeToken(String token) async {
    _token = token;
  }

  @override
  Future<String?> getToken() async {
    return _token;
  }
}
