import 'dart:developer';

import 'package:graphql/client.dart';
import 'package:yandex_flutter_handbook/graphql_test/common/graphql/create_user.graphql.dart';
import 'package:yandex_flutter_handbook/graphql_test/common/graphql/get_users.graphql.dart';
import 'package:yandex_flutter_handbook/graphql_test/models/graphql_user_test.dart';

abstract interface class IGraphqlDatasource {
  Future<List<GraphqlUserTest>> users();

  Future<GraphqlUserTest> createUser(final String name, {final String? email});
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

  @override
  Future<GraphqlUserTest> createUser(String name, {String? email}) {
    throw UnimplementedError("Test");
  }
}

final class GeneratedGraphQlDatasourceImpl implements IGraphqlDatasource {
  GeneratedGraphQlDatasourceImpl({required GraphQLClient client}) : _client = client;

  final GraphQLClient _client;

  @override
  Future<List<GraphqlUserTest>> users() async {
    final options = Options$Query$GetUsers(variables: Variables$Query$GetUsers(page: 1, first: 10));
    final query = await _client.query$GetUsers(options);
    print("getting users: $query");
    final data = query.data?['users']['data'] as List<dynamic>;
    return data.map((e) => GraphqlUserTest.fromJson(e)).toList();
  }

  @override
  Future<GraphqlUserTest> createUser(String name, {String? email}) async {
    final result = await _client.mutate(
      Options$Mutation$CreateUser(
        variables: Variables$Mutation$CreateUser(
          name: name,
          email: email,
          access_to_agents: 0,
          auction_enabled: 0,
        ),
      ),
    );
    print("creation result: $result");
    final data = result.data?['createUser'];
    return GraphqlUserTest.fromJson(data);
  }
}
