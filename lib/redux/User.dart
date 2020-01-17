import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  User(
      this.name,
      this.sex,
      this.address,
      this.birthday,
      );

  String birthday;
  int sex;
  String address;
  String name;


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);


  Map<String, dynamic> toJson() => _$UserToJson(this);

  // 命名构造函数
  User.empty();

}
