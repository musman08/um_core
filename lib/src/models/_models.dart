import 'package:json_annotation/json_annotation.dart';

abstract class Model {
  Model({this.id});

  Model.fromJson(Map<String, dynamic> json);

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? id;

  Map<String, dynamic> toJson();
}
