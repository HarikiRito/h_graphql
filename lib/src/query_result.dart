import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:artemis/artemis.dart';

class HQueryResult<T> {
  QueryResult queryResult;
  GraphQLQuery query;
  HQueryResult({
    required this.queryResult,
    required this.query,
  });

  T? get data {
    return queryResult.data == null
        ? null
        : query.parse(
            queryResult.data ?? {},
          );
  }

  OperationException? get exception => queryResult.exception;
  bool get isLoading => queryResult.isLoading;
  bool get isNotLoading => !isLoading;
  bool get isOptimistic => queryResult.isOptimistic;

  /// shorthand for `!isLoading && !isOptimistic`
  bool get isConcrete => !isLoading && !isOptimistic;

  /// Whether the response includes an [exception]
  bool get hasException => (exception != null);
  DateTime get timestamp => queryResult.timestamp;
}
