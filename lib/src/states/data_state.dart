// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'states.dart';

abstract class DataState<T> extends BaseState {
  final T data;
  DataState({
    required this.data,
  });

  @override
  List<Object?> get props => [super.props, data];
}
