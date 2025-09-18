void main() {
  final endDartCompilation = EnvDartDefineCompilation();

  print("Env: ${endDartCompilation.env}");
  print("Secret Key: ${endDartCompilation.secretKey}");
}

class EnvDartDefineCompilation {
  String get env => const String.fromEnvironment('env').trim();

  String get secretKey => const String.fromEnvironment("secret_key").trim();
}
