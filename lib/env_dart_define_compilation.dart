void main() {
  final endDartCompilation = EnvDartDefineCompilation();

  print("Env: ${endDartCompilation.env}");
  print("Secret Key: ${endDartCompilation.secretKey}");
}

class EnvDartDefineCompilation {
   final String env = String.fromEnvironment("env");

   final String secretKey = String.fromEnvironment("secret_key");
}
