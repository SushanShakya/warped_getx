import 'package:example/src/modules/auth/domain/entities/login_response.dart';
import 'package:example/src/modules/auth/domain/entities/params/login_param.dart';
import 'package:example/src/modules/auth/domain/usecases/login_interactor.dart';
import 'package:warped_getx/warped_getx.dart';

class LoginSuccess extends DataState<LoginResponse> {
  LoginSuccess({required LoginResponse data}) : super(data: data);
}

class LoginCtrl extends AsyncController {
  final LoginInteractor interactor;

  LoginCtrl({required this.interactor});

  login(LoginParam param) {
    handleDefaultStates(() async {
      final data = await interactor.call(param);
      emit(LoginSuccess(data: data));
    });
  }
}
