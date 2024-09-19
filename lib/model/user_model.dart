// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? token;
  UserData data;
  UserModel({
    required this.token,
    required this.data,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: "name")
  final String displayName;
  final String email;
  @JsonKey(name: "phone")
  final String phoneNumber;
  @JsonKey(name: "avatar")
  final String photoURL;

  UserData({
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.photoURL,
  });
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
