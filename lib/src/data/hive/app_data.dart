import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:um_core/src/data/hive/user_data.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AppData {
  static late Box<String> _dataBox;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    if(!kIsWeb){
      final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
    }else{
      Hive.initFlutter();
    }
    await openBox('data_box');
  }

  static Future<void> openBox(String boxName) async {

    Hive.registerAdapter(UserDataAdapter());
    _dataBox = await Hive.openBox<String>(boxName);
  }

  static Future<void> setUserId(String id) async {
    await _dataBox.put('id', id);
  }

  static String? getUserId(String id) {
    return _dataBox.get(id);
  }

  static clear(){
    _dataBox.clear();
  }
}



