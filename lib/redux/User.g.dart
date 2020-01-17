// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['name'] as String,
    json['sex'] as int,
    json['address'] as String,
    json['birthday'] as String,
    
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'birthday': instance.birthday,
      'name': instance.name,
      'address': instance.address,
      'sex': instance.sex,
    };
