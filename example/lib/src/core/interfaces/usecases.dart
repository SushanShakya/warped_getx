import 'package:equatable/equatable.dart';

abstract class Usecase<R, D> {
  Future<R> call(D param);
}

class NoParam extends Equatable {
  @override
  List<Object?> get props => [];
}
