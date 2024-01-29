import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class userController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference users = firestore.collection("users");
    return users.get();
  }

  Stream<QuerySnapshot<Object?>> streamdata() {
    CollectionReference users = firestore.collection("users");
    return users.snapshots();
  }
}
