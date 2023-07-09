import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:um_core/src/models/_models.dart';
import 'package:um_core/src/models/admin/admin_user_model.dart';
import 'package:um_core/src/services/firestore/firestore_service.dart';

class AdminFirestoreLoginService extends AppFirestoreService<AdminModel>{

  @override
  String get collectionName => 'admin';

  @override
  AdminModel parseModel(DocumentSnapshot<Object?> document) {
    return AdminModel.fromJson(document.data() as Map<String, dynamic>)..id = document.id;
  }

}