part of 'controllers.dart';

abstract class AsyncController extends WarpedController {
  Future<void> handleDefaultStates(Future<void> Function() callback) async {
    try {
      await callback();
    } on Failure catch (e) {
      emit(ErrorState(message: e.message));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}
