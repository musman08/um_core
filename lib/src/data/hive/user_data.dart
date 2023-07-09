import 'package:hive/hive.dart';
part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject{
  @HiveField(1)
  String? userId;

  UserData({this.userId});
}