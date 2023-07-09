import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:um_core/src/models/auth/user_model.dart';
import 'package:um_core/src/services/auth/app_auth_service.dart';
import 'firestore_service.dart';


class UserFirestoreService extends AppFirestoreService<UserModel> {
  @override
  String get collectionName => 'users';

  @override
  UserModel parseModel(DocumentSnapshot<Object?> document) {
    return UserModel.fromJson(document.data() as Map<String, dynamic>)
      ..id = document.id;
  }

  // Future<UserModel> isUserExistSignIn(String email, String role) async {
  //   try {
  //     var _result = await FirebaseFirestore.instance
  //         .collection(collectionName)
  //         .where('email', isEqualTo: email)
  //         .where('role', isEqualTo: role)
  //         .get();
  //     if (_result.docs.isNotEmpty) {
  //       if (parseModel(_result.docs.first).isBlocked) {
  //         await AppAuthService.signOut();
  //   throw 'You account is disabled!';
  //   } else {
  //   return parseModel(_result.docs.first);
  //   }
  //   } else {
  //   await AppAuthService.signOut();
  //   throw 'Please sign up first';
  //   }
  //   } catch (e) {
  //   rethrow;
  //   }
  // }
  Future<bool> isUserExistSignUp(String email) async {
    try {
      var _result = await FirebaseFirestore.instance
          .collection(collectionName)
          .where('email', isEqualTo: email)
      // .where('role', isEqualTo: role)
          .get();
      if (_result.docs.isNotEmpty) {
        return true;
      }else{
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> fetchFcmToken(String id) async {
    try {
      var _result = await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(id)
          .get();
      if (_result.exists) {
        return _result.data()!["token"];
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
