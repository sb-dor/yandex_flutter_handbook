import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_iwd.g.dart';

@JsonSerializable()
class UserIWD {
  UserIWD({required this.name, required this.email});

  final String name;

  final String email;

  factory UserIWD.fromJson(Map<String, Object?> json) => _$UserIWDFromJson(json);

  Map<String, Object?> toJson() => _$UserIWDToJson(this);
}
