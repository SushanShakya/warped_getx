import 'package:dio/dio.dart';
import 'package:example/src/modules/common/domain/entities/paginated.dart';
import 'package:example/src/modules/common/domain/entities/pagination_info.dart';
import 'package:example/src/modules/user/data/models/user_response_model.dart';
import 'package:example/src/modules/user/data/repo/api_user_repo.dart';
import 'package:example/src/modules/user/data/repo/interface/user_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:warped_getx/warped_getx.dart';

import '../../../../../fixtures/fixture_reader.dart';
import '../../../auth/data/repo/api_auth_repo_test.mocks.dart';

void main() {
  group('ApiUserRepo', () {
    late Dio dio;
    late ApiUserRepo repo;

    var param = const PaginationInfo(
      total: 100,
      page: 1,
      limit: 10,
    );
    var mockResponse = MockResponse();
    var mockData = jsonFixture('users_fixture.json');
    var endpoint = '/users?skip=${param.page - 1}&limit=${param.limit}';

    setUp(() {
      dio = MockDio();
      repo = ApiUserRepo(dio: dio);
    });

    test('is a UserRepo', () {
      expect(repo, isA<UserRepo>());
    });

    group('', () {
      setUp(() {
        when(mockResponse.data).thenAnswer((e) => mockData);
        when(dio.get(endpoint))
            .thenAnswer((realInvocation) async => mockResponse);
      });

      test('calls dio.get', () {
        repo.fetchUsers(param.page, limit: param.limit);
        verify(dio.get(endpoint));
      });

      test('returns data when no error', () async {
        var data = await repo.fetchUsers(param.page, limit: param.limit);
        expect(
          data,
          Paginated<List<UserResponseModel>>(
            info: param,
            data: List<UserResponseModel>.from(
              mockData['users'].map((e) => UserResponseModel.fromJson(e)),
            ),
          ),
        );
      });

      test('throws Server Error when data is null', () {
        when(mockResponse.data).thenAnswer((e) => null);
        expect(
          repo.fetchUsers(param.page, limit: param.limit),
          throwsA(const TypeMatcher<ServerError>()),
        );
      });

      test('throws Failure when something went wrong', () {
        when(dio.get(endpoint)).thenThrow(Exception());
        expect(
          repo.fetchUsers(param.page, limit: param.limit),
          throwsA(const TypeMatcher<Failure>()),
        );
      });
    });
  });
}
