import 'dart:developer';

import 'package:graphql/client.dart';
import 'package:yandex_flutter_handbook/graphql_test/common/graphql/get_users.graphql.dart';
import 'package:yandex_flutter_handbook/graphql_test/models/graphql_user_test.dart';

abstract interface class IGraphqlDatasource {
  Future<List<GraphqlUserTest>> users();
}

final class GraphqlDatasourceImpl implements IGraphqlDatasource {
  GraphqlDatasourceImpl({required GraphQLClient client}) : _client = client;

  final GraphQLClient _client;

  @override
  Future<List<GraphqlUserTest>> users() async {
    final query = r'''
      {
        users(first:10, page:1){
          paginatorInfo{
            total
          },
          data{
            id, name, email,
            role{
              id, role
            }
          }
        }
      }
     ''';

    final result = await _client.query(QueryOptions(document: gql(query)));

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    log("response: ${result.data}");

    final data = result.data?['users']['data'] as List<dynamic>;

    return data.map((e) => GraphqlUserTest.fromJson(e)).toList();
  }
}

final class GeneratedGraphQlDatasourceImpl implements IGraphqlDatasource {
  GeneratedGraphQlDatasourceImpl({required GraphQLClient client}) : _client = client;

  final GraphQLClient _client;

  @override
  Future<List<GraphqlUserTest>> users() async {
    final options = Options$Query$GetUsers(variables: Variables$Query$GetUsers(page: 1, first: 10));
    final query = await _client.query$GetUsers(options);
    final data = query.data?['users']['data'] as List<dynamic>;
    return data.map((e) => GraphqlUserTest.fromJson(e)).toList();
  }
}
