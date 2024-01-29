import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentcar/models/car_model.dart';

class DetailCarsController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<DocumentSnapshot<Object?>> getData(String docId) async {
  //   DocumentReference docRef = firestore.collection("cars").doc(docId);
  //   return docRef.get();
  // }

  Future<DocumentSnapshot<Object?>> getData(String docId) async {
    DocumentReference docRef = firestore.collection("cars").doc(docId);
    return docRef.get();
  }
}
