class GraphqlRoleTest {
  GraphqlRoleTest({this.id, this.role});

  factory GraphqlRoleTest.fromJson(Map<String, Object?> json) => GraphqlRoleTest(
    id: json['id'] as String?,
    role: json['role'] as String?,
  );

  final String? id;
  final String? role;
}
