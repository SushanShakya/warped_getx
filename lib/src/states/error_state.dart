// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'states.dart';

class ErrorState<T> extends BaseState {
  final String message;
  final T? data;

  ErrorState({
    required this.message,
    this.data,
  });

  @override
  List<Object?> get props => [message, data, ...super.props];
}
