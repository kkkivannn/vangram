// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      name: json['name'] as String,
      surname: json['surname'] as String,
      age: json['age'] as int,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'age': instance.age,
      'photo': instance.photo,
    };
