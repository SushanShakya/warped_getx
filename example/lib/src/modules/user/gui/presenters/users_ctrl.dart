import 'package:example/src/modules/common/gui/presenters/paginated_ctrl.dart';
import 'package:example/src/modules/user/domain/entities/user_entity.dart';
import 'package:example/src/modules/user/domain/usecases/fetch_users_interactor.dart';
import 'package:warped_getx/warped_getx.dart';

class UsersLoaded extends DataState<List<UserEntity>> {
  UsersLoaded({required List<UserEntity> data}) : super(data: data);
}

class UsersCtrl extends PaginatedCtrl<UserEntity> {
  final FetchUsersInteractor interactor;

  UsersCtrl({required this.interactor});

  fetchUsers({int? limit}) {
    handleDefaultStates(() async {
      var res = await interactor.call(info.copyWith(limit: limit));
      info = res.info;
      data = [...data, ...res.data];
      emit(UsersLoaded(data: data));
    });
  }
}
