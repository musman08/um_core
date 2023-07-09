import 'package:json_annotation/json_annotation.dart';
import 'package:um_core/src/models/_models.dart';


part 'add_data_model.g.dart';

@JsonSerializable(includeIfNull: false)
class AddDataModel extends Model{

  AddDataModel({
    this.title,
    this.description,
    this.dateAndTime,
    this.status,
    this.userId,
    this.crDescription
  });

  String ? title;
  String ? description;
  String ? dateAndTime;
  String ? status;
  final String ? userId;
  String ? crDescription;

  factory AddDataModel.fromJson(Map<String, dynamic> json){
    return _$AddDataModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AddDataModelToJson(this);
  }

}