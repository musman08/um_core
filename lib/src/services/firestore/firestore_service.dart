import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:um_core/src/models/_models.dart';

abstract class AppFirestoreService<T extends Model> {
  String get collectionName;

  T parseModel(DocumentSnapshot document);

  Stream<List<T>> fetchAllFirestore() => FirebaseFirestore.instance
      .collection(collectionName)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((document) => parseModel(document)).toList());

  Future<List<T>> fetchAllList() async {
    try {
      final _data =
          await FirebaseFirestore.instance.collection(collectionName).get();
      return _data.docs.map((document) => parseModel(document)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<T>> fetchAllSortedFirestore() => FirebaseFirestore.instance
      .collection(collectionName)
      .orderBy('timeStamp', descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((document) => parseModel(document)).toList());

  Stream<T> fetchOneStreamFirestore(String id) => FirebaseFirestore.instance
      .collection(collectionName)
      .doc(id)
      .snapshots()
      .map((snapshot) => parseModel(snapshot));

  Future<T> fetchOneFirestore(String id) async {
    try {
      return parseModel(await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(id)
          .get());
    } catch (_) {
      rethrow;
    }
  }

  Future<T> insertFirestore(T model) async {
    try {
      final document = await FirebaseFirestore.instance
          .collection(collectionName)
          .add(model.toJson());
      model.id = document.id;
      return model;
    } catch (e) {
      rethrow;
    }
  }

  Future<T> insertFirestoreWithId(T model) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(model.id)
          .set(model.toJson());
      return model;
    } catch (e) {
      rethrow;
    }
  }

  Future updateFirestore(T model) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(model.id)
          .update(model.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future deleteFirestore(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(documentId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
