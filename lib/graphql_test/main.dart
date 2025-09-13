import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:yandex_flutter_handbook/graphql_test/repository/graphql_datasource.dart';
import 'package:yandex_flutter_handbook/graphql_test/repository/graphql_repository.dart';
import 'package:yandex_flutter_handbook/graphql_test/widgets/graphql_test_widget.dart';

void main() => runApp(MaterialApp(home: GraphqlTestWidget()));

IGraphqlRepository graphqlRepository() {
  final httpLink = HttpLink('http://192.168.100.62:8000/graphql');
  final client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  final IGraphqlDatasource datasource = GeneratedGraphQlDatasourceImpl(client: client);

  return GraphqlRepositoryImpl(iGraphqlDatasource: datasource);
}
