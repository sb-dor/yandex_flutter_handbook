class GraphqlUserTest {
  GraphqlUserTest({this.id, this.name, this.email});

  final String? id;
  final String? name;
  final String? email;

  factory GraphqlUserTest.fromJson(Map<String, Object?> json) => GraphqlUserTest(
    id: json['id'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
  );
}
