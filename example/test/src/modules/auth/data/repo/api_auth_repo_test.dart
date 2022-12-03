import 'package:dio/dio.dart';
import 'package:example/src/modules/auth/data/models/login_response_model.dart';
import 'package:example/src/modules/auth/data/repo/api_auth_repo.dart';
import 'package:example/src/modules/auth/data/repo/interface/auth_repo.dart';
import 'package:example/src/modules/auth/domain/entities/params/login_param.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:warped_getx/warped_getx.dart' hide Response;

import '../../../../../fixtures/fixture_reader.dart';
import 'api_auth_repo_test.mocks.dart';

@GenerateMocks([Dio, Response])
void main() {
  group('FakeAuthRepo', () {
    late Dio dio;
    late ApiAuthRepo repo;

    var param = const LoginParam(
      username: "username",
      password: "password",
    );

    var mockResponse = MockResponse();

    var mockData = jsonFixture('login_response_fixture.json');

    setUp(() {
      dio = MockDio();
      repo = ApiAuthRepo(dio: dio);
    });

    test('is a AuthRepo', () {
      expect(repo, isA<AuthRepo>());
    });

    group('login', () {
      setUp(() {
        when(mockResponse.data).thenAnswer((realInvocation) => mockData);
        when(dio.post(
          '/auth/login',
          data: {'username': param.username, 'password': param.password},
        )).thenAnswer((e) async => mockResponse);
      });

      test('calls dio.post', () {
        repo.login(param);
        verify(dio.post(
          '/auth/login',
          data: {'username': param.username, 'password': param.password},
        ));
        verifyNoMoreInteractions(dio);
      });

      test('returns data when ok', () async {
        final data = await repo.login(param);
        expect(data, LoginResponseModel.fromJson(mockData));
      });

      test('throws server failure when res.data is null', () async {
        when(mockResponse.data).thenAnswer((realInvocation) => null);
        expect(repo.login(param), throwsA(const TypeMatcher<Failure>()));
      });

      test('throws server error when something goes wrong', () {
        when(dio.post(
          '/auth/login',
          data: {'username': param.username, 'password': param.password},
        )).thenThrow(Exception());
        expect(repo.login(param), throwsA(const TypeMatcher<ServerError>()));
      });
    });
  });
}
