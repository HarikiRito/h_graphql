import 'package:graphql_flutter/graphql_flutter.dart';

class PartialQueryOptions {
  final Map<String, dynamic> variables;
  final FetchPolicy? fetchPolicy;
  final ErrorPolicy? errorPolicy;
  final CacheRereadPolicy? cacheRereadPolicy;
  final Object? optimisticResult;
  final Duration? pollInterval;
  final Context? context;

  PartialQueryOptions({
    this.variables = const {},
    this.fetchPolicy,
    this.errorPolicy,
    this.cacheRereadPolicy,
    this.optimisticResult,
    this.pollInterval,
    this.context,
  });
}
