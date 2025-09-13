import 'package:yandex_flutter_handbook/graphql_test/models/graphql_role_test.dart';

class GraphqlUserTest {
  GraphqlUserTest({this.id, this.name, this.email, required this.graphqlRoleTest});

  final String? id;
  final String? name;
  final String? email;
  final GraphqlRoleTest? graphqlRoleTest;

  factory GraphqlUserTest.fromJson(Map<String, Object?> json) => GraphqlUserTest(
    id: json['id'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    graphqlRoleTest: json['role'] == null
        ? null
        : GraphqlRoleTest.fromJson(json['role'] as Map<String, Object?>),
  );
}
