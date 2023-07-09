// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDataModel _$AddDataModelFromJson(Map<String, dynamic> json) => AddDataModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      dateAndTime: json['dateAndTime'] as String?,
      status: json['status'] as String?,
      userId: json['userId'] as String?,
      crDescription: json['crDescription'] as String?,
    );

Map<String, dynamic> _$AddDataModelToJson(AddDataModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('dateAndTime', instance.dateAndTime);
  writeNotNull('status', instance.status);
  writeNotNull('userId', instance.userId);
  writeNotNull('crDescription', instance.crDescription);
  return val;
}
