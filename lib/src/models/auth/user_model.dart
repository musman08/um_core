import 'package:json_annotation/json_annotation.dart';
import 'package:um_core/src/models/_models.dart';


part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UserModel extends Model {
  UserModel({
    this.email,
    this.name,
    this.profilePicture,
    this.bio,
    this.description,
    this.status,
    this.userId
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  final String ? name;
  final String ? email;
  final String ? profilePicture;
  final String ? bio;
  final String ? description;
  String ? status;
  final String ? userId;


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel && other.userId == userId;
  }

  @override
  int get hashCode => userId.hashCode;


  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
