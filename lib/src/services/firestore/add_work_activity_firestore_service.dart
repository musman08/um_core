import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:um_core/src/models/add_work_activity_model/add_data_model.dart';
import 'firestore_service.dart';


class AddWorkActivityFirestoreService extends AppFirestoreService<AddDataModel>{
  @override
  String get collectionName => 'activity';

  @override
  AddDataModel parseModel(DocumentSnapshot<Object?> document) {
    return AddDataModel.fromJson(document.data() as Map<String, dynamic>)..id = document.id;
  }

}