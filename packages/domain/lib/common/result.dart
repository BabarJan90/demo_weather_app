import 'package:equatable/equatable.dart';

import 'error.dart';

sealed class Result<T> {
  const Result();

  factory Result.success(T data) = ResultSuccess<T>;
  factory Result.failed(Error error) = ResultFailed<T>;

  TResult when<TResult>({
    required TResult Function(T data) success,
    required TResult Function(Error error) failed,
  }) => switch (this) {
    ResultSuccess<T>(:final data) => success(data),
    ResultFailed<T>(:final error) => failed(error),
  };

  bool isSuccess() => this is ResultSuccess<T>;
}

final class ResultSuccess<T> extends Result<T> with Equatable {
  final T data;
  const ResultSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

final class ResultFailed<T> extends Result<T> with Equatable {
  final Error error;
  const ResultFailed(this.error);

  @override
  List<Object?> get props => [error];
}
