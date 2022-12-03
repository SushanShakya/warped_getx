import 'package:example/src/core/interfaces/usecases.dart';
import 'package:example/src/modules/common/domain/entities/paginated.dart';
import 'package:example/src/modules/common/domain/entities/pagination_info.dart';
import 'package:example/src/modules/user/data/models/user_response_model.dart';
import 'package:example/src/modules/user/data/repo/interface/user_repo.dart';
import 'package:example/src/modules/user/domain/converters/user_entity_converter.dart';
import 'package:example/src/modules/user/domain/usecases/fetch_users_interactor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:warped_getx/warped_getx.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'fetch_users_interactor_test.mocks.dart';

@GenerateMocks([UserRepo])
void main() {
  group('FetchUsersInteractor', () {
    late UserRepo repo;
    late FetchUsersInteractor interactor;

    var param = const PaginationInfo(total: -1, page: 1, limit: 10);
    var usersResponse = jsonFixture('users_fixture.json');
    var mockResponse = (usersResponse['users'] as List)
        .map(
          (e) => UserResponseModel.fromJson(e),
        )
        .take(param.limit)
        .toList();

    setUp(() {
      repo = MockUserRepo();
      interactor = FetchUsersInteractor(repo: repo);
    });

    test('is a Usecase', () {
      expect(interactor, isA<Usecase>());
    });

    group('', () {
      setUp(() {
        when(repo.fetchUsers(param.page, limit: param.limit)).thenAnswer(
          (e) async => Paginated(info: param, data: mockResponse),
        );
      });

      test('calls UserRepo', () {
        interactor.call(param);
        verify(repo.fetchUsers(param.page));
        verifyNoMoreInteractions(repo);
      });

      test('returns formatted data if OK', () async {
        final res = await interactor.call(param);
        expect(
          res,
          Paginated(
            info: param,
            data: mockResponse
                .map(
                  (e) => UserEntityConverter.fromModel(e).data,
                )
                .toList(),
          ),
        );
      });

      test('throws Failure if something wrong in repo', () {
        when(repo.fetchUsers(param.page, limit: param.limit))
            .thenThrow(const ServerError());

        expect(interactor.call(param), throwsA(const TypeMatcher<Failure>()));
      });
    });
  });
}
