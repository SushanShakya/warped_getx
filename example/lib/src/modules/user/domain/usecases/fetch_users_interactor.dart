// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example/src/core/interfaces/usecases.dart';
import 'package:example/src/modules/common/domain/entities/paginated.dart';
import 'package:example/src/modules/common/domain/entities/pagination_info.dart';
import 'package:example/src/modules/user/data/repo/interface/user_repo.dart';
import 'package:example/src/modules/user/domain/converters/user_entity_converter.dart';
import 'package:example/src/modules/user/domain/entities/user_entity.dart';

class FetchUsersInteractor
    extends Usecase<Paginated<List<UserEntity>>, PaginationInfo> {
  final UserRepo repo;

  FetchUsersInteractor({
    required this.repo,
  });

  @override
  Future<Paginated<List<UserEntity>>> call(PaginationInfo param) async {
    final res = await repo.fetchUsers(param.page, limit: param.limit);
    return Paginated(
      info: res.info,
      data: res.data.map((e) => UserEntityConverter.fromModel(e).data).toList(),
    );
  }
}
