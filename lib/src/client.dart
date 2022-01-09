import 'package:graphql_flutter/graphql_flutter.dart' hide JsonSerializable;
import 'package:artemis/artemis.dart';
import 'query_options.dart';
import 'query_result.dart';
import 'dart:async';
import 'package:json_annotation/json_annotation.dart';

import 'mutate_options.dart';

class HGraphQLClient extends GraphQLClient {
  HGraphQLClient({
    required Link link,
    required GraphQLCache cache,
    DefaultPolicies? defaultPolicies,
    bool alwaysRebroadcast = false,
  }) : super(
          link: link,
          cache: cache,
          defaultPolicies: defaultPolicies,
          alwaysRebroadcast: alwaysRebroadcast,
        );

  Future<HQueryResult<T>> hQuery<T, U extends JsonSerializable>({
    required GraphQLQuery<T, U> query,
    PartialQueryOptions? options,
  }) async {
    final queryResult = await super.query(
      QueryOptions(
        document: query.document,
        variables: query.getVariablesMap(),
        cacheRereadPolicy: options?.cacheRereadPolicy,
        context: options?.context,
        errorPolicy: options?.errorPolicy,
        fetchPolicy: options?.fetchPolicy,
        operationName: query.operationName,
        optimisticResult: options?.optimisticResult,
        pollInterval: options?.pollInterval,
      ),
    );

    return HQueryResult<T>(query: query, queryResult: queryResult);
  }

  Future<HQueryResult<T>> hMutate<T, U extends JsonSerializable>({
    required GraphQLQuery<T, U> query,
    PartialMutateOptions? options,
  }) async {
    final queryResult = await super.mutate(
      MutationOptions(
        document: query.document,
        variables: query.getVariablesMap(),
        cacheRereadPolicy: options?.cacheRereadPolicy,
        context: options?.context,
        errorPolicy: options?.errorPolicy,
        fetchPolicy: options?.fetchPolicy,
        operationName: query.operationName,
        optimisticResult: options?.optimisticResult,
        onCompleted: options?.onCompleted,
        onError: options?.onError,
        update: options?.update,
      ),
    );

    return HQueryResult<T>(query: query, queryResult: queryResult);
  }
}
