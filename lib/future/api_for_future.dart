import 'dart:convert';
import 'dart:io';

import 'package:yandex_flutter_handbook/interceptors/with_dio/models/user_iwd.dart';

class ApiForFuture {
  ApiForFuture({final HttpClient? client, final String? mainUrl})
    : _client = client ?? HttpClient(),
      _mainUrl = mainUrl ?? "https://jsonplaceholder.typicode.com";

  final HttpClient _client;
  final String _mainUrl;

  Future<List<UserIWD>> getUsers() async {
    final HttpClientRequest request = await _client.getUrl(Uri.parse("$_mainUrl/users"));
    final HttpClientResponse response = await request.close();
    final data = await response.transform(utf8.decoder).join();
    final List<dynamic> dUsers = jsonDecode(data);
    final parsedUsers = dUsers.map((e) => UserIWD.fromJson(e)).toList();
    return parsedUsers;
  }
}
