import 'package:example/src/core/errors/storage_error.dart';
import 'package:example/src/core/interfaces/usecases.dart';
import 'package:example/src/modules/auth/data/models/login_response_model.dart';
import 'package:example/src/modules/auth/data/repo/interface/auth_repo.dart';
import 'package:example/src/modules/auth/data/repo/interface/auth_store_repo.dart';
import 'package:example/src/modules/auth/domain/converters/login_response_converter.dart';
import 'package:example/src/modules/auth/domain/entities/params/login_param.dart';
import 'package:example/src/modules/auth/domain/usecases/login_interactor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:warped_getx/warped_getx.dart';

import 'login_interactor_test.mocks.dart';

@GenerateMocks([AuthRepo, AuthStoreRepo])
void main() {
  group('LoginInteractor', () {
    late AuthStoreRepo storeRepo;
    late AuthRepo repo;
    late LoginInteractor interactor;

    var param = const LoginParam(
      username: "username",
      password: "password",
    );

    var mockResponse = LoginResponseModel.fake();
    var mockReturn = LoginResponseConverter.fromModel(mockResponse).data;

    setUp(() {
      storeRepo = MockAuthStoreRepo();
      repo = MockAuthRepo();
      interactor = LoginInteractor(repo: repo, storeRepo: storeRepo);
    });

    test('is a Usecase', () {
      expect(interactor, isA<Usecase>());
    });

    group('', () {
      setUp(() {
        when(repo.login(param)).thenAnswer((e) async => mockResponse);
        when(storeRepo.storeToken(mockResponse.token))
            .thenAnswer((realInvocation) async {});
      });

      test('calls AuthRepo', () {
        interactor.call(param);
        verify(repo.login(param));
        verifyNoMoreInteractions(repo);
      });

      test('saves obtained token', () async {
        await interactor.call(param);
        verify(storeRepo.storeToken(mockResponse.token));
        verifyNoMoreInteractions(storeRepo);
      });

      test('throws StorageError when storing token failed', () {
        when(storeRepo.storeToken(mockResponse.token)).thenThrow(Exception());
        expect(interactor.call(param), throwsA(const StorageError()));
      });

      test('returns converted Result when OK', () async {
        final data = await interactor.call(param);
        expect(data, mockReturn);
      });

      test('throws Failure when something wrong', () async {
        when(repo.login(param)).thenThrow(const ServerError(message: "hello"));
        expect(interactor.call(param), throwsA(const TypeMatcher<Failure>()));
      });
    });
  });
}
