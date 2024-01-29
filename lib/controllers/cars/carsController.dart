import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class CarsController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<QuerySnapshot<Object?>> getData() async {
  //   CollectionReference Cars = firestore.collection("cars");
  //   return Cars.get();
  // }

  Stream<QuerySnapshot<Object?>> streamdata() {
    CollectionReference Cars = firestore.collection("cars");
    return Cars.snapshots();
  }
}
