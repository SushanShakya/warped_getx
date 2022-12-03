// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PaginationInfo extends Equatable {
  final int total;
  final int page;
  final int limit;

  const PaginationInfo({
    required this.total,
    required this.page,
    required this.limit,
  });

  const PaginationInfo.init({
    this.total = -1,
    this.page = 1,
    this.limit = 10,
  });

  @override
  List<Object> get props => [total, page, limit];

  PaginationInfo copyWith({
    int? total,
    int? page,
    int? limit,
  }) {
    return PaginationInfo(
      total: total ?? this.total,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }
}
