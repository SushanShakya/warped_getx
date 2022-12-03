import 'package:example/src/modules/auth/data/repo/interface/auth_store_repo.dart';
import 'package:example/src/modules/auth/data/repo/memory_auth_store_repo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MemoryAuthStoreRepo', () {
    late MemoryAuthStoreRepo repo;

    var token = '123';

    setUp(() {
      repo = MemoryAuthStoreRepo();
    });

    test('is a AuthStoreRepo', () {
      expect(repo, isA<AuthStoreRepo>());
    });

    test('executes normally if no error', () {
      repo.storeToken(token);
    });

    test('getting token without storing returns null', () async {
      final res = await repo.getToken();
      expect(res, null);
    });

    test('gets stored token', () async {
      await repo.storeToken(token);
      final data = await repo.getToken();
      expect(data, token);
    });
  });
}
