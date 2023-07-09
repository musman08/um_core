

import 'package:json_annotation/json_annotation.dart';
import 'package:um_core/src/models/_models.dart';

part 'admin_user_model.g.dart';

@JsonSerializable()
class AdminModel extends Model{

  AdminModel({required this.email, required this.password});

  final String email;
  final String password;

  factory AdminModel.fromJson(Map<String, dynamic> json){
    return _$AdminModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AdminModelToJson(this);
  }

}