// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      email: json['email'] as String?,
      name: json['name'] as String?,
      profilePicture: json['profilePicture'] as String?,
      bio: json['bio'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('profilePicture', instance.profilePicture);
  writeNotNull('bio', instance.bio);
  writeNotNull('description', instance.description);
  writeNotNull('status', instance.status);
  writeNotNull('userId', instance.userId);
  return val;
}
