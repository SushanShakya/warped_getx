part of 'controllers.dart';

abstract class AsyncController extends WarpedController {
  Future<void> handleDefaultStates(Future<void> Function() callback) async {
    emit(LoadingState());
    try {
      await callback();
    } on Failure catch (e) {
      log(e.message);
      emit(ErrorState(message: e.message));
    } catch (e) {
      log(e.toString());
      emit(ErrorState(message: e.toString()));
    }
  }
}
