import 'package:yandex_flutter_handbook/graphql_test/models/graphql_user_test.dart';
import 'package:yandex_flutter_handbook/graphql_test/repository/graphql_datasource.dart';

abstract interface class IGraphqlRepository {
  Future<List<GraphqlUserTest>> users();

  Future<GraphqlUserTest> createUser(final String name, {final String? email});
}

final class GraphqlRepositoryImpl implements IGraphqlRepository {
  GraphqlRepositoryImpl({required IGraphqlDatasource iGraphqlDatasource})
    : _iGraphqlDatasource = iGraphqlDatasource;

  final IGraphqlDatasource _iGraphqlDatasource;

  @override
  Future<List<GraphqlUserTest>> users() => _iGraphqlDatasource.users();

  @override
  Future<GraphqlUserTest> createUser(String name, {String? email}) =>
      _iGraphqlDatasource.createUser(name, email: email);
}
