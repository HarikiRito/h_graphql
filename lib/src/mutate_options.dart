import 'package:graphql_flutter/graphql_flutter.dart';

class PartialMutateOptions {
  final Map<String, dynamic> variables;
  final FetchPolicy? fetchPolicy;
  final ErrorPolicy? errorPolicy;
  final CacheRereadPolicy? cacheRereadPolicy;
  final Object? optimisticResult;
  final Context? context;
  final OnMutationCompleted? onCompleted;
  final OnMutationUpdate? update;
  final OnError? onError;

  PartialMutateOptions({
    this.variables = const {},
    this.fetchPolicy,
    this.errorPolicy,
    this.cacheRereadPolicy,
    this.optimisticResult,
    this.context,
    this.onCompleted,
    this.update,
    this.onError,
  });
}
