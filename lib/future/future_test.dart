import 'dart:developer';

import 'package:yandex_flutter_handbook/future/api_for_future.dart';
import 'package:yandex_flutter_handbook/interceptors/with_dio/models/user_iwd.dart';

void main() async {
  final api = ApiForFuture();

  final getUsers = api.getUsers();

  getUsers
      .then((users) {
        orderByNameDesc(users);
        print("users: ${users.map((e) => e.name).toList()}");
      })
      .catchError((error, stackTrace) {
        print("Error is: $error");
        print("StackTrace for error: $stackTrace");
      })
      .whenComplete(() {
        print("prints regardless of what 'future' returned - an error or result");
      });
}

void orderByNameDesc(List<UserIWD> users) {
  users.sort((a, b) => b.name.compareTo(a.name));
}
